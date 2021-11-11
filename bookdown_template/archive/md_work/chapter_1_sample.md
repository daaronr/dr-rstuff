# About this work

**Note**: Click [HERE](#chapter_2) to jump to next chapter.

**Note to friends I’ve asked to look at this book…**

Thanks for looking at this.

## Preface

Testing a Zotero reference: (Becker 1974) (should cite Becker, 1974).
(Adena and Huck 2019) – should cite Adena 2019.

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

[1]

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

Let’s cite a paper here: (**Akerlof1984a?**); I don’t think I needed the
brackets though ((**Akerlof1984a?**) would also have worked).

Testing another one: (**alecstephensonQuickIntroductionShiny2013?**)

It is referring the contents of bibtex files, in the line
`bibliography: [./references.bib, support/reinstein_bibtex.bib]`

^\[

This can be made easier with the addin citation tool ‘citr,’ along with
Zotero and betterbibtex.

\]

## Examples of the sort of fancy interactive stuff one can incorporate in this web book

Thanks to Yihui and many others, this book should permit lots of
flexible tools. Trying some of these below (with code shown, but it
could also be hidden). Thanks Yihui for the [Bookdown
package](https://bookdown.org/yihui/bookdown/).

We can have internal links to previous sections like [here, to the about
section](#about).

### Questions with folded answers, folded expanded discussions

Can I ask you a question? (Answer below the fold.)

^\[

Yes: I just did.

\]

  

I can also put expansive detail into a fold, to avoid clutter. If you
want to know more about spittlebugs, feel free (to open the fold below).

^\[

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

\]

### A Shiny app

``` r
#knitr::include_app("https://yihui.shinyapps.io/miniUI/", height = "600px")
```

### My web pages

[innovationsinfundraising.org](https://innovationsinfundraising.org/doku.php)

(This page couldn’t embed)

------------------------------------------------------------------------

``` r
#knitr::include_url("https://davidreinstein.wordpress.com/")
```

### Scary math

$$\\Theta = \\begin{pmatrix}\\alpha & \\beta\\\\
\\gamma & \\delta
\\end{pmatrix}$$

### R code and data

These are “code chunks”

    ##  [1] -0.676  0.030  0.398  0.624 -0.366 -0.047 -1.353  0.534  1.320  0.536

![A figure
caption.](chapter_1_sample_md_files/figure-commonmark/chunk-label-1.png)

And I can refer to the results of the r code in the text itself, e.g.,
by writing

    ``  one plus one equals  ` r x `   ``

I get … one plus one equals 2.

### Tables and graphs

We can make tables from data (but these might struggle exporting to
markdown formats?)

Below, this defaults to an html styling

``` r
mtcars %>% as_tibble() %>%
  tabyl(cyl) %>%
  .kable(format='pipe', caption="don't forget a caption" )
```

<table>
<caption>don’t forget a caption</caption>
<thead>
<tr class="header">
<th style="text-align: right;">cyl</th>
<th style="text-align: right;">n</th>
<th style="text-align: right;">percent</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">4</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">0.34</td>
</tr>
<tr class="even">
<td style="text-align: right;">6</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">0.22</td>
</tr>
<tr class="odd">
<td style="text-align: right;">8</td>
<td style="text-align: right;">14</td>
<td style="text-align: right;">0.44</td>
</tr>
</tbody>
</table>

don’t forget a caption

and then with latex styling

``` r
mtcars %>% as_tibble() %>%
  tabyl(cyl) %>%
  kable(format='pipe', caption="don't forget a caption" )
```

<table>
<caption>don’t forget a caption</caption>
<thead>
<tr class="header">
<th style="text-align: right;">cyl</th>
<th style="text-align: right;">n</th>
<th style="text-align: right;">percent</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;">4</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">0.34</td>
</tr>
<tr class="even">
<td style="text-align: right;">6</td>
<td style="text-align: right;">7</td>
<td style="text-align: right;">0.22</td>
</tr>
<tr class="odd">
<td style="text-align: right;">8</td>
<td style="text-align: right;">14</td>
<td style="text-align: right;">0.44</td>
</tr>
</tbody>
</table>

don’t forget a caption

And of course, graphs aka ‘visualisations’:

``` r
(
mtcars_plot <- mtcars %>%
  ggplot(aes(x=mpg))
+ geom_histogram(binwidth=5)
)
```

![](chapter_1_sample_md_files/figure-commonmark/unnamed-chunk-3-1.png)

### Other fancy stuff

<div id="KC5.4" class="keyconcept">

<h3 class="right">
Key Concept 5.4
</h3>
<h3 class="left">
Heteroskedasticity and Homoskedasticity
</h3>

-   The error term of our regression model is homoskedastic if the
    variance of the conditional distribution of *u*<sub>*i*</sub> given
    *X*<sub>*i*</sub>,
    *V**a**r*(*u*<sub>*i*</sub>|*X*<sub>*i*</sub> = *x*), is constant
    *for all* observations in our sample:
    Var(*u*<sub>*i*</sub>|*X*<sub>*i*</sub> = *x*) = *σ*<sup>2</sup> ∀ *i* = 1, …, *n*.

</div>

### Interactive questions

### Videos

## Types of notes within text

**Note**:

“Aside” notes look like this.

**Note**:

Warnings look like this.

### A margin note

What about tufte-style margin notes? \*

^\[

\* If you are considering pursuing an MSc or PhD this will typically be
centered on doing research; it’s worth knowing whether this is for you
before diving in. Doing research is also a key component of much
professional work in the private and public (government) sectors,
including at ‘think tanks,’ some government agencies, and many private
consulting and ‘data analytics’ firms. \]

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

Just remember the simple acronym “ECAOAcIn”:[2]

**E**conomic question – **C**ritical discussion – **A**pply economics –
**O**rganise/present well – **Ac**ademic writing – original **In**sight

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

[1]  If you have benefitted from this work (and you are not one of my
students), please consider giving me some sort of ‘’kudos’’ on Twitter
or wherever. One way to materially express gratitude: make a donation in
my honor to an *effective and international charity*, such as those
listed at [givewell.org](givewell.org). If you make this donation and
share it on a social media site with the hashtag \#DRWritingEcon, that
would be greatly appreciated.

[2] (Isn’t that catchy?)

