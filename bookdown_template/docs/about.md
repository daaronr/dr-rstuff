---
title: "Template for Reinstein bookdowns"
author: "Dr. David Reinstein, "
abstract: "This 'book' organizes the project and helps others understand it and learn from it"
#cover-image: "images/cardcatalogue.JPG"
date: "2021-09-24"
site: bookdown::bookdown_site
output:
  bookdown::gitbook:
    lib_dir: "book_assets"
    includes:
      in_header: support/header.html
      #in_header: https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/header.html
    #css: https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/tufte_plus.css
    css: support/tufte_plus_test.css
    config:
      toc:
        after: |
          <li><a href="https://bookdown.org" target="_blank">Published with bookdown</a></li>
        collapse: none
        scroll_highlight: yes
      fontsettings:
        theme: white
        size: 2
      sharing:
        github: yes
        facebook: yes
        twitter: yes
        linkedin: yes
        weibo: yes
        all: ['github', 'facebook', 'twitter', 'linkedin']
    highlight: tango
    download: [pdf, epub, mobi]
    keep_md: yes 
  bookdown::pdf_book:
    keep_tex: yes
    
  bookdown::md_document:
    variant: commonmark
always_allow_html: yes
bibliography: "references.bib"
biblio-style: apalike
link-citations: yes
github-repo: daaronr/dr-rstuff
description: "Template testing this format"
#url: 'https\://daaronr.github.io//'
tags: [Testing, Economics, Experiments, Charity]
---



```r
knitr::opts_chunk$set(echo = TRUE)
```


#### Download,  access and run project_setup.R ####

(Note: we ultimately can do this in main, but this is a bridge)


Try downloading and accessing my basic content support tool...



```r
#removed because this is now in `main.R`


source(here("code", "project_setup.R"))
```


\




```


# install.packages("bookdown")
# or the development version
# devtools::install_github("rstudio/bookdown")

<!-- Download 'backup' bibtex file from dropbox (synced with Zotero), do the rename workaround -->



<!-- note installing packages is mainly removed because this is done in baseoptions.R -->


```r
# automatically create a bib database for R packages
knitr::write_bib(c(
  .packages(), 'bookdown', 'knitr', 'rmarkdown'
), 'packages.bib')
```









<!-- Global site tag (gtag.js) - Google Analytics -->


<html>

<script async src="https://www.googletagmanager.com/gtag/js?id=G-QLKFNFTGXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-QLKFNFTGXX');
</script>
</html>

<!--chapter:end:index.Rmd-->


# About this work {#about}

Placeholder


## Preface {#preface}
### Licence {.unnumbered}
## Citations
## Examples of the sort of fancy interactive stuff one can incorporate in this web book
### Questions with folded answers, folded expanded discussions
### A Shiny app {#shiny_test .unnumbered}
### My web pages {.unnumbered}
### Scary math {.unnumbered}
### R code and data {.unnumbered}
### Tables and graphs 
### Other fancy stuff {.unnumbered}
### Interactive questions
### Videos
## Types of notes within text
### A margin note
## Notes for instructors and course organisers {.unnumbered}
## We link back here in the next chapter -- check it out {#link_back}
### A fun acronym

<!--chapter:end:chapter_1_sample.Rmd-->


# Second sample chapter {#chapter_2}

Placeholder


## Test
### Link back to first chapter
## Blah
### A proposed lecture programme {-}
## Alphabetical list of abbreviations
## Abbreviations: Notes for paper marking and commenting

<!--chapter:end:chapter_2_sample.Rmd-->

# List of works cited {#references}

<!--chapter:end:references.Rmd-->

