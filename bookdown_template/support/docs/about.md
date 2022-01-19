---
title: "Template for Reinstein bookdowns"
author: "Dr. David Reinstein, "
abstract: "This 'book' organizes the project and helps others understand it and learn from it"
#cover-image: "images/cardcatalogue.JPG"
date: "2022-01-12"
site: bookdown::bookdown_site
output:
  md_document:
    variant: commonmark
  bookdown::gitbook:
    lib_dir: "book_assets"
    includes:
      in_header: support/header.html
      #in_header: https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/header.html
    #css: https://raw.githubusercontent.com/daaronr/dr-rstuff/master/bookdown_template/support/tufte_plus.css

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


Needs to be set to `echo = FALSE` for creating EAF markdowns (or do this in post?)

```r
#knitr::opts_chunk$set(echo = FALSE)
```


#### Download,  access and run project_setup.R ####

(Note: we ultimately can do this in main, but this is a bridge)




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

```
## tweaking Hmisc
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

---
bibliography: references.bib
always_allow_html: yes
---

# About this work {#about}



\BeginKnitrBlock{note}<div class="note">Click [HERE](#chapter_2) to jump to next chapter.</div>\EndKnitrBlock{note}

<!-- bookdown_start --> The first bit of content meant 'only for the bookdown' goes here.

This contains multiple lines blah blah

<!-- bookdown_end -->

<font color='brown'>**Note to friends I've asked to look at this book...**</font>

<font color='brown'>Thanks for looking at this.</font>

## Preface {#preface}

Testing a Zotero reference: [@becker1974] (should cite Becker, 1974). [@adena2019] -- should cite Adena 2019.

**Leaving feedback, asking questions, seeking other's feedback/notes/questions:**

*All feedback is appreciated, and I will try to respond to your questions.* An easy way to take notes and leave feedback: sign up for ['hypothes.is'](https://web.hypothes.is/) and you can put your 'public notes' *directly on this web book.* Don't worry, these comments are saved even if the web book is updated.

> an example of a quotation example of a quotation example of a quotation example of a quotation example of a quotation example of a quotation example of a quotation example of a quotation example of a quotation.

```{=html}
<!--
(As noted at <https://www.econometrics-with-r.org/>; thanks for this example:)
-->
```
::: {.rmdreview}
This book is in <b>Open Review</b>. We want your feedback to make the book better for you and other students. You may annotate some text by [selecting it with the cursor]{style="background-color: #3297FD; color: white"} and then click the <i class="h-icon-annotate"></i> on the pop-up menu. You can also see the annotations of others: click the <i class="h-icon-chevron-left"></i> in the upper right hand corner of the page <i class="fa fa-arrow-circle-right  fa-rotate-315" aria-hidden="true"></i>
:::

::: {.marginnote}
If you have benefitted from this work (and you are not one of my students), please consider giving me some sort of ''kudos'' on Twitter or wherever. One way to materially express gratitude: make a donation in my honor to an *effective and international charity*, such as those listed at [givewell.org](givewell.org). If you make this donation and share it on a social media site with the hashtag \#DRWritingEcon, that would be greatly appreciated.
:::

### Licence {.unnumbered}

Essentially:

-   You can use this freely and create other versions as long as you give proper attribution, and you make your work publicly available

-   You cannot sell this or use it, or any part of it, for commercial purposes

<https://creativecommons.org/licenses/by-nc-sa/4.0/>

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" alt="Creative Commons License" style="border-width:0"/></a><br />[Researching and writing in Economics (Essays, term paper, dissertations for Economics undergraduates and MSc students)]{xmlns:dct="http://purl.org/dc/terms/" property="dct:title"} by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/daaronr/writing_econ_research" property="cc:attributionName" rel="cc:attributionURL">David Reinstein</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

## Citations

Let's cite a paper here: [@lakens2014]; I don't think I needed the brackets though (@lakens2014 would also have worked).

Testing another one: [@alecstephenson2013]

It is referring the contents of bibtex files, mentioned in the index.Rmd file in the line `bibliography: ["references.bib"]`

This can be more 'automated' with the visual editor ... turning on Zotero (necessary?) and inserting a reference from the linked library, this should automatically be added to `references.bib`

Or you can add it manually (there was the 'citr' plugin a while ago, but that might now confuse things.)

Adding one manually: [@AkerlofGeorgeA.2000] ... let's see if it works

## Examples of the sort of fancy interactive stuff one can incorporate in this web book

Thanks to Yihui and many others, this book should permit lots of flexible tools. Trying some of these below (with code shown, but it could also be hidden). Thanks Yihui for the [Bookdown package](https://bookdown.org/yihui/bookdown/).

We can have internal links to previous sections like [here, to the about section](#about).

### Questions with folded answers, folded expanded discussions

Can I ask you a question? (Answer below the fold.)

\BeginKnitrBlock{fold}<div class="fold">
Yes: I just did.
</div>\EndKnitrBlock{fold}

\

<!-- bookdown_start --> The second bit of content meant 'only for the bookdown' goes here.

With multiple lines.

second bit ends. <!-- bookdown_end -->

I can also put expansive detail into a fold, to avoid clutter. If you want to know more about spittlebugs, feel free (to open the fold below).

\BeginKnitrBlock{fold}<div class="fold">
> These families are best known for the nymphal stage, which produces a cover of foamed-up plant sap visually resembling saliva; the nymphs are therefore commonly known as spittlebugs and their foam as cuckoo spit, frog spit, or snake spit. This characteristic spittle production is associated with the unusual trait of xylem feeding. Whereas most insects that feed on sap feed on the nutrient-rich fluid from the phloem, Cercopidae utilize the much more dilute sap flowing upward from the roots via the xylem. The large amount of excess water that must be excreted and the evolution of special breathing tubes allow the young spittlebug nymphs to grown in the relatively protective environment of the spittle.

Indirect source: [wikipedia: Froghopper, accessed 21 Feb 2020](https://en.wikipedia.org/wiki/Froghopper)
</div>\EndKnitrBlock{fold}

### A Shiny app {#shiny_test .unnumbered}


```r
knitr::include_app("https://yihui.shinyapps.io/miniUI/", height = "600px")
```

<iframe src="https://yihui.shinyapps.io/miniUI/?showcase=0" width="80%" height="600px" data-external="1"></iframe>

### My web pages {.unnumbered}

[innovationsinfundraising.org](https://innovationsinfundraising.org/doku.php)

(This page couldn't embed)

------------------------------------------------------------------------


```r
knitr::include_url("https://davidreinstein.wordpress.com/")
```

<iframe src="https://davidreinstein.wordpress.com/" width="80%" height="400px" data-external="1"></iframe>

### Scary math {.unnumbered}

$$\Theta = \begin{pmatrix}\alpha & \beta\\
\gamma & \delta
\end{pmatrix}$$

### R code and data {.unnumbered}

These are "code chunks"


```r
x <- 1 + 1
rnorm(10)  # 10 random numbers
```

```
##  [1]  0.01649221  1.96656758  1.88290810  0.62289619 -0.32140098 -0.64893598  0.19644578 -0.39802346 -1.49955297
## [10]  1.29062023
```

```r
plot(dist ~ speed, cars)  # a scatterplot
```

<div class="figure" style="text-align: center">
<img src="template_project_files/figure-html/chunk-label-1.png" alt="A figure caption." width="80%" />
<p class="caption">(\#fig:chunk-label)A figure caption.</p>
</div>

And I can refer to the results of the r code in the text itself, e.g., by writing

    ``  one plus one equals  ` r x `   ``

I get ... one plus one equals 2.

### Tables and graphs

We can make tables from data (but these might struggle exporting to markdown formats?)

Below, this defaults to an html styling

(but in the md substitution code I swap in 'pipe styling')


```r
#install.packages("magick")
#install.packages("webshot")
#webshot::install_phantomjs(force=TRUE)
#library(webshot)
#library(magick)

mtcars %>% as_tibble() %>%
  janitor::tabyl(cyl) %>%
  kable(caption="don't forget a caption") %>%
  kable_styling()
```

<table class="table" style="margin-left: auto; margin-right: auto;">
<caption>(\#tab:unnamed-chunk-8)don't forget a caption</caption>
 <thead>
  <tr>
   <th style="text-align:right;"> cyl </th>
   <th style="text-align:right;"> n </th>
   <th style="text-align:right;"> percent </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 4 </td>
   <td style="text-align:right;"> 11 </td>
   <td style="text-align:right;"> 0.34375 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 6 </td>
   <td style="text-align:right;"> 7 </td>
   <td style="text-align:right;"> 0.21875 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 8 </td>
   <td style="text-align:right;"> 14 </td>
   <td style="text-align:right;"> 0.43750 </td>
  </tr>
</tbody>
</table>

```r
    #as_image(width = 8) (this fails)
```

And using the gtsummary package:


```r
library(gtsummary)

# make model and tbl_regression object
m_linear <- lm(mpg ~ cyl, data = mtcars)
t1 <- tbl_regression(m_linear)

# Use function from gt package to save table, after converting to
# gt object using as_gt()
#gt::gtsave(as_gt(t1), file = file.path(tempdir(), "temp.png"))
```

And of course, graphs aka 'visualisations':


```r
(
mtcars_plot <- mtcars %>%
  ggplot(aes(x=mpg))
+ geom_histogram(binwidth=5)
)
```

<img src="template_project_files/figure-html/unnamed-chunk-10-1.png" width="80%" style="display: block; margin: auto;" />

### Other fancy stuff {.unnumbered}


<div class = "keyconcept" id="KC5.4">
<h3 class = "right"> Key Concept 5.4 </h3>
<h3 class = "left"> Heteroskedasticity and Homoskedasticity </h3>
- The error term of our regression model is homoskedastic if the variance of the conditional distribution of $u_i$ given $X_i$, $Var(u_i|X_i=x)$, is constant *for all* observations in our sample:
\[ \text{Var}(u_i|X_i=x) = \sigma^2 \ \forall \ i=1,\dots,n. \]

</div>

### Interactive questions

<iframe src="https://os301.shinyapps.io/Question/?showcase=0" width="80%" height="210px" data-external="1"></iframe>

### Videos

<iframe src="https://os301.shinyapps.io/Video/?showcase=0" width="80%" height="400px" data-external="1"></iframe>

## Types of notes within text

\BeginKnitrBlock{note}<div class="note">
"Aside" notes look like this.
</div>\EndKnitrBlock{note}

\BeginKnitrBlock{warning}<div class="warning">
Warnings look like this.
</div>\EndKnitrBlock{warning}

### A margin note

What about tufte-style margin notes? \*

::: {.marginnote}
\* If you are considering pursuing an MSc or PhD this will typically be centered on doing research; it's worth knowing whether this is for you before diving in. Doing research is also a key component of much professional work in the private and public (government) sectors, including at 'think tanks', some government agencies, and many private consulting and 'data analytics' firms.
:::

## Notes for instructors and course organisers {.unnumbered}

Note: related pptx slides (covering Ch 1-3, adapted to Exeter) are downloadable:

<button onclick="window.open(&#39;Lecture1_intro_andyourtopic_exeter.pptx&#39;)">

Download

</button>

## We link back here in the next chapter -- check it out {#link_back}

Jump to [next chapter](#chapter_2)

### A fun acronym

**Six simple rules for writing a good paper** (and, incidentally, for getting a good mark)

1.  Frame your topic as an interesting, well-defined **Economic** question. Demonstrate that you understand your question.

2.  Explain what others have written about your topic and which techniques they used. [**Critically**](#crit_examine) **discuss** the strengths and limitations these. Explain how these relate to and inform your own work. Cite correctly and do not plagiarise.

3.  **Apply economics** (and econometrics) to your question. Demonstrate an understanding of your approach and techniques.

4.  **Organise and present** your work clearly, including an outline and labels and explanations of any tables, graphs, and equations.

5.  Write clearly, logically, and in a professional **academic** style.

6.  If you are aiming to produce a great paper, make an original contribution or **insight.** (This can be a small insight, and it is not always necessary for a top mark.)

------------------------------------------------------------------------

<div class="figure" style="text-align: center">
<img src="images/ecacoacin4life.jpg" alt="Just remember..." width="40%" />
<p class="caption">(\#fig:unnamed-chunk-16)Just remember...</p>
</div>

Just remember the simple acronym "ECAOAcIn":[^chapter_1_sample-1]

**E**conomic question -- **C**ritical discussion -- **A**pply economics -- **O**rganise/present well -- **Ac**ademic writing -- original **In**sight

[^chapter_1_sample-1]: (Isn't that catchy?)

<!--chapter:end:chapter_1_sample.Rmd-->

# Second sample chapter {#chapter_2}


Blah blah

## Test

### Link back to first chapter

Link back to the first chapter [here](link_back)

## Blah

### A proposed lecture programme {-}

*Note:* I have slides covering a range of key topics, which tie in with this web book. Please contact me directly for details.

<br>

\

Large lectures have limited value in this context. From my experience students appreciate *occasional* lectures for motivation and clarification, and to ask questions, but more than 5-6 traditional lectures seems to be overkill.

If resources permit, it will be helpful to intersperse this with casual scheduled 'research coffees', encouraging students to discuss their ideas with instructors and with each other. I recommend a 'light-touch approach' in sessions. Let the students take the lead in presenting and responding (making occasional course-corrections where necessary). From our experience, students engage actively in these contexts!




# Works Cited

# Appendix

## Alphabetical list of abbreviations


## Abbreviations: Notes for paper marking and commenting

Here is a categorized list of abbreviations I use in marking; you may
find it useful just to read these to be aware of common issues.

- (abbreviations as pdf)[https://github.com/daaronr/writing_econ_research/blob/master/ec831%20lecture%20slides%20(powerpoint)/abbreviations%20for%20editing%20-%20alphaall%20(David%20Reinstein's%20conflicted%20copy%202012-05-15).pdf] - download and view

- (link to page to download spreadsheet)](https://github.com/daaronr/writing_econ_research/blob/master/ec831%20lecture%20slides%20(powerpoint)/abbreviations%20for%20marking%20-%20forstudents.xlsx)

- [Airtable view link (sortable etc)](https://airtable.com/shrPGYSbNvnUV4TzU)


\

<iframe class="airtable-embed" src="https://airtable.com/embed/shrPGYSbNvnUV4TzU?backgroundColor=purple&viewControls=on" frameborder="0" onmousewheel="" width="100%" height="533" style="background: transparent; border: 1px solid #ccc;"></iframe>


<!--chapter:end:chapter_2_sample.Rmd-->

# List of works cited {#references}

<!--chapter:end:references.Rmd-->

