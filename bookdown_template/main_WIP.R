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

#My plan is something like:

#0. ... possibly (manually) add ‘tags’ to original Rmd files indicating start and end of sections to remove from forum post

#1. rmd_edits_for_md.py: apply to all Rmd files in folder, create (in new folder?) new Rmd files with adjustments, removing unrenderable content etc ... maybe not bookdown but something simpler?

#2. Knit Rmds  to commonmark (individual files or?) with
#rmarkdown::render_site(output_format = 'md_document', encoding = 'UTF-8')
  
#3. md_edits_for_eafo.py apply post-knit fixes and substitutions to .md files so that these work on the EA forum
  #these may need to take manual arguments to specify,
  #…e.g, prepend the correct web address where the png files are hosted and append `?raw=true
  #… right now that seems to be  https://github.com/rethinkpriorities/ea_data_public/blob/main/docs/ea_survey_work_files/figure-html/FIGURE_NAME.png?raw=true

