``` r
knitr::opts_chunk$set(echo = TRUE)
```

#### Download, access and run project\_setup.R

(Note: we ultimately can do this in main, but this is a bridge)

Try downloading and accessing my basic content support tool…

``` r
#removed because this is now in `main.R`


source(here("code", "project_setup.R"))
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
