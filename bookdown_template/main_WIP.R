### 'Main' for template (wip) ####
# 'main.R': this single file should (ideally) source and build all data, build codebooks, run all analysis, and build bookdown and other output

# In Rstudio, select 'Code - Run Region - Run all'

#### Setup ####

try_download <- function(url, path) {
  new_path <- gsub("[.]", "X.", path)
  tryCatch({
    download.file(url = url,
                  destfile = new_path)
  }, error = function(e) {
    print("You are not online, so we can't download")
  })
  tryCatch(
    file.rename(new_path, path)
  )
}


library(here)
here <- here::here()
rename_all <- dplyr::rename_all


#... Import packages for this project using template from dr-rstuff  ####
# - you don't need to do this each time, but it keeps it updated
try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/project_setup.R",
  here::here("code", "project_setup.R")
)

## You MUST run this for anything else to work (installs/loads key packages and functions):
source(here::here("code", "project_setup.R"))

library(rmarkdown)


#... and a few more packages ####
p_load_gh("peterhurford/funtools")

p_load_gh("remotes")
#p_load_gh("tidymodels/corrr")


if (!require("devtools")) { install.packages("devtools") }
p_load_gh("peterhurford/checkr")

#p_load_gh("peterhurford/currencyr")

#p_load("binom")
#p_load("readstata13")

#options(error = searcher("stackoverflow"))


#### Build and clean all data from 2020 ####

##Import relevant dataframes and set filters ####

## ...Import and work on data ####

#source(here("build", "eas_cross_year_harmonisation.R"))


#### Building bookdown  ####
#...this should work 'in place' once we have the bookdown set up, .but it seems one needs Zotero to be running (fix this) ####

{
  options(knitr.duplicate.label = "allow")
  rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
}


#### Codebooks... to understand and communicate the generated datasets ####

#rdr_cbk defined in functions

#d_codebooks <-
 # readline("Do you want codebooks? They take a long time... (Y/N)")

#if (d_codebooks == "Y") {
 # rdr_cbk("codebook_eas_2020.Rmd")
#}



########### EA Forum Markdown ##################

#See plan in https://github.com/daaronr/dr-rstuff/blob/master/bookdown_template/wip_rmd_to_forum_templating/README_plan.md


#chapter by chapter could work?

## .... PREPROCESSING ####

#system('sed "/bookdown_start/,/bookdown_end/d" chapter_1_sample.Rmd > "chapter_1_sample_md.Rmd"')

library(rex)
library(readr)

#... input file for editing ####
ch1_Rmd <- readr::read_file("chapter_1_sample.Rmd")
#do gsub and rex  stuff here

#... Remove bookdown-only content by tag ####

#define and apply regular expression for 'beginning and end of bookdown only tags'

reg_bd <- rex::rex("<--! bookdown_start -->", 
                one_or_more(anything, type="lazy"), 
                "<--! bookdown_end -->")

ch1_Rmd <- gsub(reg_bd, "", ch1_Rmd)

# ... remove html blocks (mainly comments that the md messes up)
reg_html <- rex::rex("```{=html}", 
                     one_or_more(anything, type="lazy"), 
                     "```")

ch1_Rmd <- gsub(reg_html, "", ch1_Rmd)


#.... tufte notes and folding boxes to footnotes... ####
reg_mn_div <- rex('<div class="marginnote">', 
                       capture(one_or_more(anything, type="lazy")), 
                       '</div>')

reg_mn_col_to_fn <- rex('::: {.marginnote}', 
            capture(one_or_more(anything, type="lazy")),                             ':::')

# ... Folding boxes (should be dropped or become footnotes)
reg_fold <- rex("```{block2,", 
                zero_or_more(any_spaces, type="lazy"),
                "type='fold'}",
                capture(one_or_more(anything,
                                    type="lazy")),
                "```"
                )

# make this stuff into footnotes 
ch1_Rmd <- ch1_Rmd %>%
  gsub(reg_mn_div, '^[\\1]', .)  %>% 
  gsub(reg_mn_col_to_fn, '^[\\1]', .)  %>%
  gsub(reg_fold, '^[\\1]', .)  


# ... Other block2 content could be made a bolded 'note'  ####
#note -- this must be run *after* the previous (otherwise we need to exclude blocks containing 'fold')
reg_block2 <- rex("```{block2", 
                one_or_more(anything, type="lazy"),
                "}",
                capture(one_or_more(anything,
                                    type="lazy")),
                "```"
)

ch1_Rmd <- ch1_Rmd %>%
  gsub(reg_block2, '**Note**: \\1', .)   
  
  
# ... echo=FALSE everywhere ####
reg_echo <- rex("echo", 
                     zero_or_more(any_spaces),
                     "=", 
                     zero_or_more(any_spaces),
                     "TRUE")
ch1_Rmd <- ch1_Rmd %>% gsub(reg_echo, "echo=FALSE", .)


# ... TABLES -- change options for kable tables; others may need to be pasted by hand :( ####

reg_kable_pipe <- rex("kable(",
                      capture(one_or_more(anything, type="lazy")),
                      ")",
                      zero_or_more(any_spaces), 
                      zero_or_more("%>%")
)

reg_ks <- rex(between(".", 0, 1, type="lazy"),
              "kable_styling(",
  zero_or_more(anything, type="lazy"),
  ")"
  )

#substitute in the 'pipe' format
ch1_Rmd <- ch1_Rmd %>%
  gsub(reg_kable_pipe, 
       "kable(format='pipe', \\1 ) \n", .) %>%
  gsub(reg_ks,"",.)


# .... Note: the pipe format is not preserved when this is knitted so it's all for nought ####

#remove knitr apps
ch1_Rmd <- ch1_Rmd %>%
  gsub("knitr\\:", "#knitr\\:", .) 
       
write_lines(ch1_Rmd, here("chapter_1_sample_md.Rmd"))

## RENDER as md

rmarkdown::render("chapter_1_sample_md.Rmd", md_document(variant = "commonmark"))

## POSTPROCESSING md ####

ch1_md <- readr::read_file("chapter_1_sample_md.md")

## ...Adjust latex math surrounds ####

reg_math <- rex("$", 
                capture(one_or_more(any_non_newlines,
                                    type="lazy")),
                "$"
)

ch1_md <- ch1_md %>%
  gsub('reg_math', '\\(\\1\\)', .)

#... remove phantom comments ####

reg_html_comment <- rex::rex("<!--", 
                             one_or_more(anything, type="lazy"), 
                             "-->")

ch1_md <- gsub(reg_html_comment, "", ch1_md)

# ... Image file prefixes need adjusting!!! ####
# But this will depend on where they are hosted.  ENTER this here (or at top)!

im_prefix_here <- "chapter_1_sample_files/figure-commonmark/"

im_url_prefix <- "https://github.com/daaronr/dr-rstuff/blob/a66d110c934006b0abe612c7f12bbbb947997cd6/bookdown_template/chapter_1_sample_files/figure-common_mark/"

ch1_md <- gsub(im_prefix_here, im_url_prefix, ch1_md) 
# or do we need "https://raw.githubusercontent.com/daaronr..."?


#![](chapter_1_sample_md_files/figure-commonmark/unnamed-chunk-3-1.png)<!-- -->
  

# ... 

write_lines(ch1_md, here("chapter_1_sample.md"))


