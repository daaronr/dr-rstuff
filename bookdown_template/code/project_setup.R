#### Script for importing data & importing packages ####

#This script aims to remove some of the repetition that occurs throughout these files
#Ideally we want to create all necessary objects - for performing analysis - in this file rather than creating objects in Rmd files

#### Setup ####

library(here)
#library(checkpoint) #TODO ... in to avoid differential processing from different package versions

# moved all sourcing/loading of packages (using pacman) to baseoptions.R

#Set function defaults
here <- here::here

#### Sourcing R scripts and HTML formatting ####

#... Downloading html Formatting ####

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

try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/header.html",
  here::here("support", "header.html")
)

try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/tufte_plus.css",
  here::here("support", "tufte_plus.css")
)




# ... Downloading Bib files ####

try_download(
  "https://www.dropbox.com/s/3i8bjrgo8u08v5w/reinstein_bibtex.bib?raw=1",
  here::here("support", "reinstein_bibtex_dropbox.bib")
)



# ... Source R functions and baseoptions ####

try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/baseoptions.R",
  here::here("code", "baseoptions.R")
)

try_download(
  "https://raw.githubusercontent.com/daaronr/dr-rstuff/master/functions/functions.R",
  here::here("code", "functions.R")
)



source(here("code", "baseoptions.R"))
source(here("code", "functions.R"))

# Basic options used across files and shortcut functions, e.g., 'pp()' for print
# functions grabbed from web and created by us for analysis/output
