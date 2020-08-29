#### Script for importing data & importing packages ####

#This script aims to remove some of the repetition that occurs throughout these files
#Ideally we want to create all necessary objects - for performing analysis - in this file rather than creating objects in Rmd files

#### Setup ####

library(here)
#library(checkpoint) #TODO ... in to avoid differential processing from different package versions
library(pacman)

p_load(GGally,Hmisc,broom,codebook,corx,data.table,dataMaid,devtools,dplyr,glue,gtools,here,hrbrthemes,janitor,kableExtra,knitr,lubridate,magrittr,pastecs,plyr,purrr, pryr, readr,scales,sjlabelled,
       snakecase,summarytools,tictoc,tidyr,tidyverse,todor,xtable)

#Set function defaults
here <- here::here
where <- pryr::where

#### Sourcing R scripts and HTML formatting ####

#Function to try and download
try_download <- function(url, path) {
  new_path <- gsub("[.]", "X.", path)
  tryCatch({
    download.file(url = url,
                  destfile = new_path)
  }, error = function(e) {
    print("You are not online, so we can't download")
  })
  tryCatch(
    file.rename(new_path, path
    )
  )
}    

#Downloading html Formatting
try_download("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/header.html", here("support", "header.html"))

try_download("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/tufte_plus.css", here("support", "tufte_plusX.css"))

try_download("https://www.dropbox.com/s/3i8bjrgo8u08v5w/reinstein_bibtex.bib?raw=1", here("support", "reinstein_bibtex_dropbox.bib"))


#Source R functions and baseoptions

try_download("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/functions.R", here("code", "functions.R"))
try_download("https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/baseoptions.R", here("code", "baseoptions.R"))

source(here("code", "functions.R")) # functions grabbed from web and created by us for analysis/output
source(here("code", "baseoptions.R")) # Basic options used across files and shortcut functions, e.g., 'pp()' for print
