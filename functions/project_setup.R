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

#Downloading html Formatting
tryCatch(
  {
    download.file(url = "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/header.html", destfile = here("support", "headerX.html"))
    download.file(url = "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/tufte_plus.css", destfile = here("support", "tufte_plusX.css"))
  },  error = function(e) {
    print("you are not online, so we can't download")
  }
)

tryCatch(
  file.rename(here("support", "headerX.html"), here("support", "header.html"))
)

tryCatch(
  file.rename(here("support", "tufte_plusX.css"), here("support", "tufte_plus.css"))
)
tryCatch(
  file.rename(here("support", "reinstein_bibtex_dropboxX.bib"), here("support", "reinstein_bibtex_dropbox.bib"))
)

#Downloading Bib files
tryCatch(
  {
    download.file(url = "https://www.dropbox.com/s/3i8bjrgo8u08v5w/reinstein_bibtex.bib?raw=1", destfile = here("support", "reinstein_bibtex_dropboxX.bib"))
    
    
    file.rename(here("support", "reinstein_bibtex_dropboxX.bib"), here("support", "reinstein_bibtex_dropbox.bib"))
  }
)

#Source R functions and baseoptions

tryCatch(
  {
    download.file(url = "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/functions.R", destfile = here("code", "functionsX.R"))
    
    download.file(url = "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/baseoptions.R", destfile = here("code", "baseoptionsX.R"))
  },  error = function(e) {
    print("you are not online, so we source locally instead; hope you've updated")
    source(here("code", "functions.R")) # functions grabbed from web and created by us for analysis/output
    source(here("code", "baseoptions.R")) # Basic options used across files and shortcut functions, e.g., 'pp()' for print
  }
)

#Note - workaround naming and code because otherwise a failed download seems to delete the destination file -- how to fix that? Renaming files?

file.rename(here::here("code", "functionsX.R"), here::here("code", "functions.R"))
file.rename(here::here("code", "baseoptionsX.R"), here::here("code", "baseoptions.R"))

source(here("code", "functions.R"))
source(here("code", "baseoptions.R"))

# Basic options used across files and shortcut functions, e.g., 'pp()' for print
# functions grabbed from web and created by us for analysis/output