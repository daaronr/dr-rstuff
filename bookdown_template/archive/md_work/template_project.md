``` r
knitr::opts_chunk$set(echo = TRUE)
```

#### Download, access and run project\_setup.R

(Note: we ultimately can do this in main, but this is a bridge)

Try downloading and accessing my basic content support tool…

``` r
#?removed because this is now in `main.R`
# but we need it if we use the 'build' option for the md

library(here)
source(here("code", "project_setup.R"))
```

    ## Installing package into '/Users/yosemite/githubs/dr-rstuff/bookdown_template/renv/library/R-4.0/x86_64-apple-darwin17.0'
    ## (as 'lib' is unspecified)
    ## Installing package into '/Users/yosemite/githubs/dr-rstuff/bookdown_template/renv/library/R-4.0/x86_64-apple-darwin17.0'
    ## (as 'lib' is unspecified)

    ## 
    ## citr installed

    ## Installing package into '/Users/yosemite/githubs/dr-rstuff/bookdown_template/renv/library/R-4.0/x86_64-apple-darwin17.0'
    ## (as 'lib' is unspecified)

  



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

    ## tweaking Hmisc

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

# About this work

<div class="note">

Click [HERE](#chapter_2) to jump to next chapter.

</div>

**Note to friends I’ve asked to look at this book…**

Thanks for looking at this.

## Preface

Testing a Zotero reference: ([Becker 1974](#ref-becker1974)) (should
cite Becker, 1974). ([Adena and Huck 2019](#ref-adena2019)) – should
cite Adena 2019.

**Leaving feedback, asking questions, seeking other’s
feedback/notes/questions:**

*All feedback is appreciated, and I will try to respond to your
questions.* An easy way to take notes and leave feedback: sign up for
[‘hypothes.is’](https://web.hypothes.is/) and you can put your ‘public
notes’ *directly on this web book.* Don’t worry, these comments are
saved even if the web book is updated.

> an example of a quotation example of a quotation example of a
> quotation example of a quotation example of a quotation example of a
> quotation example of a quotation example of a quotation example of a
> quotation.

<!--
(As noted at <https://www.econometrics-with-r.org/>; thanks for this example:)
-->

<div class="rmdreview">

This book is in <b>Open Review</b>. We want your feedback to make the
book better for you and other students. You may annotate some text by
<span style="background-color: #3297FD; color: white">selecting it with
the cursor</span> and then click the <i class="h-icon-annotate"></i> on
the pop-up menu. You can also see the annotations of others: click the
<i class="h-icon-chevron-left"></i> in the upper right hand corner of
the page
<i class="fa fa-arrow-circle-right  fa-rotate-315" aria-hidden="true"></i>

</div>

<div class="marginnote">

If you have benefitted from this work (and you are not one of my
students), please consider giving me some sort of ‘’kudos’’ on Twitter
or wherever. One way to materially express gratitude: make a donation in
my honor to an *effective and international charity*, such as those
listed at [givewell.org](givewell.org). If you make this donation and
share it on a social media site with the hashtag \#DRWritingEcon, that
would be greatly appreciated.

</div>

### Licence

Essentially:

-   You can use this freely and create other versions as long as you
    give proper attribution, and you make your work publicly available

-   You cannot sell this or use it, or any part of it, for commercial
    purposes

<https://creativecommons.org/licenses/by-nc-sa/4.0/>

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" alt="Creative Commons License" style="border-width:0"/></a><br /><span
xmlns:dct="http://purl.org/dc/terms/" property="dct:title">Researching
and writing in Economics (Essays, term paper, dissertations for
Economics undergraduates and MSc students)</span> by
<a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/daaronr/writing_econ_research" property="cc:attributionName" rel="cc:attributionURL">David
Reinstein</a> is licensed under a
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative
Commons Attribution-NonCommercial-ShareAlike 4.0 International
License</a>.

## Citations

Let’s cite a paper here: ([**Akerlof1984a?**](#ref-Akerlof1984a)); I
don’t think I needed the brackets though
(([**Akerlof1984a?**](#ref-Akerlof1984a)) would also have worked).

Testing another one:
([**alecstephensonQuickIntroductionShiny2013?**](#ref-alecstephensonQuickIntroductionShiny2013))

It is referring the contents of bibtex files, in the line
`bibliography: [./references.bib, support/reinstein_bibtex.bib]`

<div class="marginnote">

This can be made easier with the addin citation tool ‘citr,’ along with
Zotero and betterbibtex.

</div>

## Examples of the sort of fancy interactive stuff one can incorporate in this web book

Thanks to Yihui and many others, this book should permit lots of
flexible tools. Trying some of these below (with code shown, but it
could also be hidden). Thanks Yihui for the [Bookdown
package](https://bookdown.org/yihui/bookdown/).

We can have internal links to previous sections like [here, to the about
section](#about).

### Questions with folded answers, folded expanded discussions

Can I ask you a question? (Answer below the fold.)

<div class="fold">

Yes: I just did.

</div>

  

I can also put expansive detail into a fold, to avoid clutter. If you
want to know more about spittlebugs, feel free (to open the fold below).

<div class="fold">

> These families are best known for the nymphal stage, which produces a
> cover of foamed-up plant sap visually resembling saliva; the nymphs
> are therefore commonly known as spittlebugs and their foam as cuckoo
> spit, frog spit, or snake spit. This characteristic spittle production
> is associated with the unusual trait of xylem feeding. Whereas most
> insects that feed on sap feed on the nutrient-rich fluid from the
> phloem, Cercopidae utilize the much more dilute sap flowing upward
> from the roots via the xylem. The large amount of excess water that
> must be excreted and the evolution of special breathing tubes allow
> the young spittlebug nymphs to grown in the relatively protective
> environment of the spittle.

Indirect source: [wikipedia: Froghopper, accessed 21 Feb
2020](https://en.wikipedia.org/wiki/Froghopper)

</div>

### A Shiny app

``` r
knitr::include_app("https://yihui.shinyapps.io/miniUI/",
  height = "600px")
```

<a href="https://yihui.shinyapps.io/miniUI/" target="_blank"><img src="template_project_files/figure-commonmark/knitrapp-1.png" width="80%" style="display: block; margin: auto;" /></a>

### My web pages

[innovationsinfundraising.org](https://innovationsinfundraising.org/doku.php)

(This page couldn’t embed)

------------------------------------------------------------------------

``` r
knitr::include_url("https://davidreinstein.wordpress.com/")
```

<a href="https://davidreinstein.wordpress.com/" target="_blank"><img src="template_project_files/figure-commonmark/wppage-1.png" width="80%" style="display: block; margin: auto;" /></a>

### Scary math

$$\\Theta = \\begin{pmatrix}\\alpha & \\beta\\\\
\\gamma & \\delta
\\end{pmatrix}$$

### R code and data

These are “code chunks”

``` r
x <- 1 + 1
rnorm(10)  # 10 random numbers
```

    ##  [1] -0.66  1.79 -0.97 -0.20 -0.52  0.20 -1.20  0.96 -1.23 -0.52

``` r
plot(dist ~ speed, cars)  # a scatterplot
```

<img src="template_project_files/figure-commonmark/chunk-label-1.png" title="A figure caption." alt="A figure caption." width="80%" style="display: block; margin: auto;" />

And I can refer to the results of the r code in the text itself, e.g.,
by writing

    ``  one plus one equals  ` r x `   ``

I get … one plus one equals 2.

### Tables and graphs

We can make tables from data (but these might struggle exporting to
markdown formats?)

``` r
mtcars %>% as_tibble() %>%  
  tabyl(cyl) %>%
  .kable(caption="don't forget a caption") %>%
  .kable_styling()
```

<table class="table" style="width: auto !important; margin-left: auto; margin-right: auto;">
<caption>
don’t forget a caption
</caption>
<thead>
<tr>
<th style="text-align:right;">
cyl
</th>
<th style="text-align:right;">
n
</th>
<th style="text-align:right;">
percent
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
4
</td>
<td style="text-align:right;">
11
</td>
<td style="text-align:right;">
0.34
</td>
</tr>
<tr>
<td style="text-align:right;">
6
</td>
<td style="text-align:right;">
7
</td>
<td style="text-align:right;">
0.22
</td>
</tr>
<tr>
<td style="text-align:right;">
8
</td>
<td style="text-align:right;">
14
</td>
<td style="text-align:right;">
0.44
</td>
</tr>
</tbody>
</table>

And of course, graphs aka ‘visualisations’:

``` r
(
mtcars_plot <- mtcars %>% 
  ggplot(aes(x=mpg)) 
+ geom_histogram(binwidth=5)
)
```

<img src="template_project_files/figure-commonmark/unnamed-chunk-7-1.png" width="80%" style="display: block; margin: auto;" />

### Other fancy stuff

### Interactive questions

<a href="https://os301.shinyapps.io/Question/" target="_blank"><img src="template_project_files/figure-commonmark/unnamed-chunk-9-1.png" width="80%" style="display: block; margin: auto;" /></a>

### Videos

<a href="https://os301.shinyapps.io/Video/" target="_blank"><img src="template_project_files/figure-commonmark/unnamed-chunk-10-1.png" width="80%" style="display: block; margin: auto;" /></a>

## Types of notes within text

<div class="note">

“Aside” notes look like this.

</div>

<div class="warning">

Warnings look like this.

</div>

### A margin note

What about tufte-style margin notes? \* ::: {.marginnote} \* If you are
considering pursuing an MSc or PhD this will typically be centered on
doing research; it’s worth knowing whether this is for you before diving
in. Doing research is also a key component of much professional work in
the private and public (government) sectors, including at ‘think tanks,’
some government agencies, and many private consulting and ‘data
analytics’ firms. :::

## Notes for instructors and course organisers

Note: related pptx slides (covering Ch 1-3, adapted to Exeter) are
downloadable:

<button onclick="window.open(&#39;Lecture1_intro_andyourtopic_exeter.pptx&#39;)">

Download

</button>

## We link back here in the next chapter – check it out

Jump to [next chapter](#chapter_2)

### A fun acronym

**Six simple rules for writing a good paper** (and, incidentally, for
getting a good mark)

1.  Frame your topic as an interesting, well-defined **Economic**
    question. Demonstrate that you understand your question.

2.  Explain what others have written about your topic and which
    techniques they used. [**Critically**](#crit_examine) **discuss**
    the strengths and limitations these. Explain how these relate to and
    inform your own work. Cite correctly and do not plagiarise.

3.  **Apply economics** (and econometrics) to your question. Demonstrate
    an understanding of your approach and techniques.

4.  **Organise and present** your work clearly, including an outline and
    labels and explanations of any tables, graphs, and equations.

5.  Write clearly, logically, and in a professional **academic** style.

6.  If you are aiming to produce a great paper, make an original
    contribution or **insight.** (This can be a small insight, and it is
    not always necessary for a top mark.)

------------------------------------------------------------------------

<img src="images/ecacoacin4life.jpg" title="Just remember..." alt="Just remember..." width="40%" style="display: block; margin: auto;" />

Just remember the simple acronym “ECAOAcIn”:[1]

**E**conomic question – **C**ritical discussion – **A**pply economics –
**O**rganise/present well – **Ac**ademic writing – original **In**sight

<!--chapter:end:chapter_1_sample.Rmd-->

# Second sample chapter

Blah blah

## Test

### Link back to first chapter

Link back to the first chapter [here](link_back)

## Blah

### A proposed lecture programme

*Note:* I have slides covering a range of key topics, which tie in with
this web book. Please contact me directly for details.

<br>

  

Large lectures have limited value in this context. From my experience
students appreciate *occasional* lectures for motivation and
clarification, and to ask questions, but more than 5-6 traditional
lectures seems to be overkill.

If resources permit, it will be helpful to intersperse this with casual
scheduled ‘research coffees,’ encouraging students to discuss their
ideas with instructors and with each other. I recommend a ‘light-touch
approach’ in sessions. Let the students take the lead in presenting and
responding (making occasional course-corrections where necessary). From
our experience, students engage actively in these contexts!

# Works Cited

# Appendix

## Alphabetical list of abbreviations

## Abbreviations: Notes for paper marking and commenting

Here is a categorized list of abbreviations I use in marking; you may
find it useful just to read these to be aware of common issues.

-   (abbreviations as
    pdf)\[<https://github.com/daaronr/writing_econ_research/blob/master/ec831%20lecture%20slides%20(powerpoint)/abbreviations%20for%20editing%20-%20alphaall%20(David%20Reinstein's%20conflicted%20copy%202012-05-15>).pdf\] -
    download and view

-   (link to page to download
    spreadsheet)\](<https://github.com/daaronr/writing_econ_research/blob/master/ec831%20lecture%20slides%20(powerpoint)/abbreviations%20for%20marking%20-%20forstudents.xlsx>)

-   [Airtable view link (sortable
    etc)](https://airtable.com/shrPGYSbNvnUV4TzU)

  

<iframe class="airtable-embed" src="https://airtable.com/embed/shrPGYSbNvnUV4TzU?backgroundColor=purple&amp;viewControls=on" frameborder="0" onmousewheel width="100%" height="533" style="background: transparent; border: 1px solid #ccc;">
</iframe>
<!--chapter:end:chapter_2_sample.Rmd-->

# List of works cited

<!--chapter:end:references.Rmd-->

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-adena2019" class="csl-entry">

Adena, Maja, and Steffen Huck. 2019. “Giving Once, Giving Twice: A
Two-Period Field Experiment on Intertemporal Crowding in Charitable
Giving.” *Journal of Public Economics* 172.
<https://doi.org/10.1016/j.jpubeco.2019.01.002>.

</div>

<div id="ref-becker1974" class="csl-entry">

Becker, Gary S. 1974. “A Theory of Social Interactions.” *The Journal of
Political Economy* 82 (6): 10631093.
<http://links.jstor.org/sici?sici=0022-3808(197411/12)82:6%3C1063:ATOSI%3E2.0.CO;2-W>.

</div>

</div>

[1] (Isn’t that catchy?)
