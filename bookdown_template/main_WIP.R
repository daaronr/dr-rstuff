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


#... Import setup for this project using template from dr-rstuff  ####
# - you don't need to do this each time, but it keeps it updated
try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/project_setup.R",
  here::here("code", "project_setup.R")
)


print("project_setup creates 'code' folder and downloads baseoptions.R, and functions.R into it, and sources these")

try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/download_formatting.R",
  here::here("code", "download_formatting.R")
)

print("download_formatting.R creates 'support' folder and downloads tufte_plus.css, header.html into it")

#### Install packages here ###

# Change this?: ... with renv we can just have renv search for and install these (in Rstudio it reminds you; otherwise use call `renv::dependencies()` or `renv::hydrate` I think. )


try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/packageadditions.R",
  here::here("code", "packageadditions.R")
)

source(here("code", "packageadditions.R"))


## You MUST run this for anything else to work

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


#### Building bookdown  ####
#...this should work 'in place' once we have the bookdown set up, .but it seems one needs Zotero to be running (fix this) ####

{
  options(knitr.duplicate.label = "allow")
  rmarkdown::render_site(output_format = 'bookdown::gitbook', encoding = 'UTF-8')
}


########### EA Forum Markdown ##################

#See plan in https://github.com/daaronr/dr-rstuff/blob/master/bookdown_template/wip_rmd_to_forum_templating/README_plan.md

library(readr)

#... input file for editing ####
ch_Rmd <- readr::read_file("chapter_1_sample.Rmd")
##You need to call it `ch_Rmd` for parse_ea_forum_md.R to run, until I functionalize it

#prefixes for image files
im_prefix_here_enter <-  "ch_md_files/figure-commonmark/"
im_url_prefix_enter <- "https://github.com/daaronr/dr-rstuff/blob/a66d110c934006b0abe612c7f12bbbb947997cd6/bookdown_template/chapter_1_sample_files/figure-common_mark/"


try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/parse_ea_forum_md.R",
  here::here("code", "parse_ea_forum_md.R")
)

source(here::here("code", "parse_ea_forum_md.R"))

