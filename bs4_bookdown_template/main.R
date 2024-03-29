# 'main.R': this single file should (ideally) bring in all data, run all analysis, and build bookdown and any  other output

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
library(pacman)
here <- here::here()

#source(here("code", "packages.R")) # Install and load packages used in build and analysis (note: these could be cleaned)
#p_load_gh("rethinkpriorities/rp-r-package")
#p_load_gh("rethinkpriorities/r-noodling-package")

source_url("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/baseoptions.R") # Basic options used across files, names and shortcuts for  functions and packages

source_url("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/plotting_functions.R")


#NOTE: I USUALLY USE THE SUFF BELOW FOR SETUP, BUT I COMMENTED IT OUT HERE FOR NOW
#... Import setup for this project using template from dr-rstuff  ####

dir.create(here("code"))

#try_download(
 # "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/project_setup.R",
#  here::here("code", "project_setup.R")
#)

# try_download(
#   "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/download_formatting.R",
#   here::here("code", "download_formatting.R")
# )

# RENV: We can just have renv search for and install these (in Rstudio it reminds you; otherwise use call `renv::dependencies()` or `renv::hydrate` I think. )
#source(here::here("assets", "R", "project_setup.R"))

my.file.rename <- function(from, to) {
  todir <- dirname(to)
  if (!isTRUE(file.info(todir)$isdir)) dir.create(todir, recursive=TRUE)
  file.rename(from = from,  to = to)
}

#annoying workaround to clean up folder structure without changing project_setup.R
my.file.rename(from = here::here("code", "baseoptions.R"),
               to = here::here("assets", "R", "baseoptions.R"))
my.file.rename(from = here::here("code", "functions.R"),
               to = here::here("assets", "R", "functions.R"))
unlink(here::here("code"), recursive = TRUE)


#source(here::here("code", "download_formatting.R"))

#print("project_setup creates 'code' folder and downloads baseoptions.R, and functions.R into it, and sources these")
# Most stuff in 'functions.R' is probably unnecessary ... it could use a good cleaning


### Source model-building tools/functions
#source(here::here("code","modeling_functions.R"))

#Pulling in key files from other repos; don't edit them here
#Just 'pull these in' from the ea-data repo for now; we may re-home them here later

p_load("bettertrace") #better tracking after bugs


#### BUILD the bs4_book bookdown ####
#The line below should 'build the bookdown' in the order specified in `_bookdown.yml`
#remotes::install_github("rstudio/bslib")
#install.packages("downlit")
#remotes::install_github("rstudio/bookdown")

library(rmarkdown)
library(bookdown)
library(bslib)

{
  options(knitr.duplicate.label = "allow")
  rmarkdown::render_site(output_format = 'bookdown::bs4_book', encoding = 'UTF-8')
}


