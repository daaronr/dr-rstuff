---
  title: "Codebook: Donations to JustGiving Fundraiser pages "
author: "David Reinstein, Toby Jolly, Gerhard Riener"
output:
  html_document:
  toc: true
toc_depth: 4
toc_float: true
code_folding: 'hide'
self_contained: true
pdf_document:
  toc: yes
toc_depth: 4
latex_engine: xelatex
---

```{r setup}
install.packages("tidyverse")

```
  
```{r simple-tibble}

df <- tibble(x = 1:2, y = c("hello, i", "john"))

```
## Add meta-data

```{r meta-data}

metadata(df)$name <- "Donations to Justgiving fundraising pages "

```

## Codebook

```{r codebook-generation, message=FALSE, warning=FALSE}

codebook(df, survey_repetition = "single", metadata_table = TRUE)

```

