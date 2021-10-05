
########### EA Forum Markdown ##################

#See plan in https://github.com/daaronr/dr-rstuff/blob/master/bookdown_template/wip_rmd_to_forum_templating/README_plan.md


#chapter by chapter could work?

## .... PREPROCESSING ####

#system('sed "/bookdown_start/,/bookdown_end/d" ch.Rmd > "ch_md.Rmd"')

p_load(rex)
p_load(readr)

#... input file for editing ####
#chapter_Rmd <- readr::read_file("ch.Rmd")
#do gsub and rex  stuff here

#... Remove bookdown-only content by tag ####

#define and apply regular expression for 'beginning and end of bookdown only tags'

reg_bd <- rex::rex("<--! bookdown_start -->",
                one_or_more(anything, type="lazy"),
                "<--! bookdown_end -->")

ch_Rmd <- gsub(reg_bd, "", ch_Rmd)

# ... remove html blocks (mainly comments that the md messes up)
reg_html <- rex::rex("```{=html}",
                     one_or_more(anything, type="lazy"),
                     "```")

ch_Rmd <- gsub(reg_html, "", ch_Rmd)


#.... tufte notes and folding boxes to footnotes... ####
reg_mn_div <- rex('<div class="marginnote">',
                       capture(one_or_more(anything, type="lazy")),
                       '</div>')

reg_mn_col_to_fn <- rex('::: {.marginnote}',
            capture(one_or_more(anything, type="lazy")),                             ':::')

# ... Folding boxes (should be dropped or become footnotes)
reg_fold <- rex("```{block2,",
                zero_or_more(any_spaces, type="lazy"),
                "type='fold'}",
                capture(one_or_more(anything,
                                    type="lazy")),
                "```"
                )

# make this stuff into footnotes
ch_Rmd <- ch_Rmd %>%
  gsub(reg_mn_div, '^[\\1]', .)  %>%
  gsub(reg_mn_col_to_fn, '^[\\1]', .)  %>%
  gsub(reg_fold, '^[\\1]', .)


# ... Other block2 content could be made a bolded 'note'  ####
#note -- this must be run *after* the previous (otherwise we need to exclude blocks containing 'fold')
reg_block2 <- rex("```{block2",
                one_or_more(anything, type="lazy"),
                "}",
                capture(one_or_more(anything,
                                    type="lazy")),
                "```"
)

ch_Rmd <- ch_Rmd %>%
  gsub(reg_block2, '**Note**: \\1', .)


# ... echo=FALSE everywhere ####
reg_echo <- rex("echo",
                     zero_or_more(any_spaces),
                     "=",
                     zero_or_more(any_spaces),
                     "TRUE")
ch_Rmd <- ch_Rmd %>% gsub(reg_echo, "echo=FALSE", .)


# ... TABLES -- change options for kable tables; others may need to be pasted by hand :( ####

#TODO: If not on DR's computer, add 'webshot' save commands for relevant tables
# ... this is `as_image(width = 8)` (or some width) for kable
# and `gt::gtsave()` (I think) for gtsummary stuff ... or convert with `as_kable_extra()` ad use same `as_image`

if(Sys.info()[[4]]!="Yosemites-iMac.local") {

p_load("magick", "webshot")
webshot::install_phantomjs(force=TRUE)

reg_kab_save_image <- rex("kable_styling(",
                      capture(zero_or_more(anything, type="lazy")),
                      ")",
                      zero_or_more(any_spaces),
                       zero_or_more("%>%")
                      )


reg_ake_save_image <- rex("as_kable_extra()",
                          zero_or_more("%>%")
                      )


ch_Rmd <- ch_Rmd %>%
    gsub(reg_kab_save_image,
      "kable_styling( \\1 ) %>% \n as_image(width = 8)")
} %>%
     gsub(reg_kab_save_image,
      "as_kable_extra() %>%  \n as_image(width = 8)")


# reg_kable_pipe <- rex("kable(",
#                       capture(one_or_more(anything, type="lazy")),
#                       ")",
#                       zero_or_more(any_spaces),
#                       zero_or_more("%>%")
# )
#
# reg_ks <- rex(between(".", 0, 1, type="lazy"),
#               "kable_styling(",
#   zero_or_more(anything, type="lazy"),
#   ")"
#   )
#
# #substitute in the 'pipe' format
# ch_Rmd <- ch_Rmd %>%
#   gsub(reg_kable_pipe,
#        "kable(format='pipe', \\1 ) \n", .) %>%
#   gsub(reg_ks,"",.)
#

# .... Note: the pipe format is not preserved when this is knitted so it's all for nought ####

#remove knitr apps
ch_Rmd <- ch_Rmd %>%
  gsub("knitr\\:", "#knitr\\:", .)

write_lines(ch_Rmd, here("ch_md.Rmd"))

## RENDER as md

rmarkdown::render("ch_md.Rmd", rmarkdown::md_document(variant = "commonmark"))

## POSTPROCESSING md ####

ch_md <- readr::read_file("ch_md.md")

## ...Adjust latex math surrounds ####

reg_math <- rex("$",
                capture(one_or_more(any_non_newlines,
                                    type="lazy")),
                "$"
)

ch_md <- ch_md %>%
  gsub('reg_math', '\\(\\1\\)', .)

#... remove phantom comments ####

reg_html_comment <- rex::rex("<!--",
                             one_or_more(anything, type="lazy"),
                             "-->")

ch_md <- gsub(reg_html_comment, "", ch_md)

# ... Image file prefixes need adjusting!!! ####
# But this will depend on where they are hosted.  ENTER this here (or at top)!

im_prefix_here <- im_prefix_here_enter
#"chapter_1_sample_files/figure-commonmark/"

im_url_prefix <- im_url_prefix_enter

#"https://github.com/daaronr/dr-rstuff/blob/a66d110c934006b0abe612c7f12bbbb947997cd6/bookdown_template/chapter_1_sample_files/figure-common_mark/"

ch_md <- gsub(im_prefix_here, im_url_prefix, ch_md)
# or do we need "https://raw.githubusercontent.com/daaronr..."?


#![](chapter_1_sample_md_files/figure-commonmark/unnamed-chunk-3-1.png)<!-- -->


# ...

write_lines(ch_md, here("ch.md"))


