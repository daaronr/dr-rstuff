
########### EA Forum Markdown ##################

#See plan in https://github.com/daaronr/dr-rstuff/blob/master/bookdown_template/wip_rmd_to_forum_templating/README_plan.md


#chapter by chapter could work?

## .... PREPROCESSING ####

p_load(rex)
p_load(readr)

#... input file for editing ####
#chapter_Rmd <- readr::read_file("ch.Rmd")
#do gsub and rex  stuff here

#... Remove bookdown-only content by tag ####

#define and apply regular expression for 'beginning and end of bookdown only tags'

reg_bd <- rex::rex("<!-- bookdown_start -->",
                one_or_more(anything, type="lazy"),
                "<!-- bookdown_end -->")

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

# ... If not on DR's computer, add 'webshot' save commands for relevant tables ####
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

ch_Rmd <- ch_Rmd %>%
    gsub(reg_kab_save_image,
      "kable_styling( \\1 ) %>% \n as_image(width = 8) \n", .)

}



readr::write_lines(ch_Rmd, here::here("ch_md.Rmd"))

## RENDER as md

{
options(knitr.duplicate.label = "allow")
rmarkdown::render("ch_md.Rmd", rmarkdown::md_document(variant = "commonmark"), run_pandoc=FALSE)
}


## POSTPROCESSING md ####

ch_md <- readr::read_file("ch_md.knit.md")
#ch_md <- readr::read_file(here("temp_work_on_md_with_pete", "ch_md.knit.md"))
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

#... TODO: Remove any remaining 'div' sections (these shouldn't be here)

reg_mn_div <- rex('<div',
                      zero_or_more(anything, type="lazy"),
                       '</div>')


ch_md <- gsub(reg_mn_div, "", ch_md)


# ... Image file prefixes need adjusting!!! ####
# But this will depend on where they are hosted.  ENTER this here (or at top)!

reg_img <- rex('<img src="',
               im_prefix_here_enter,
               capture(
                 one_or_more(anything, type="lazy")
               ),
               '.png"',
               (zero_or_more(anything, type="lazy")),
               "/>"
               )

reg_img_pete <- rex('<img src="',
               pete_prefix_here_enter,
               capture(
                 one_or_more(anything, type="lazy")
               ),
               '.png"',
               (zero_or_more(anything, type="lazy")),
               "/>"
)

# note this is a bit rigid as it needs it to be png, but when I tried anchoring with only the '>' it kept the formatting suffix stuff (`width=80%' etc)  in

reg_gif <-  rex('<img src="',
                      pete_gif_prefix,
                      capture(
                        one_or_more(anything, type="lazy")
                      ),
                      '.gif"',
                      (zero_or_more(anything, type="lazy")),
                      "/>"
  )


ch_md <- ch_md %>%
  gsub(reg_img_pete,
       paste0("![](",im_url_prefix_enter,"\\1.png)"), .) %>%
  gsub(reg_img,
       paste0("![](",im_url_prefix_enter,"\\1.png)"), .)  %>%
  gsub(reg_gif,
       paste0("![](",im_url_prefix_enter,"\\1.gif)"), .)

#gsub(reg_mn_div, "", ch_md) %>% im_url_prefix_enter

#im_prefix_here <- im_prefix_here_enter
#"chapter_1_sample_files/figure-commonmark/"
#im_url_prefix <- im_url_prefix_enter

#"https://github.com/daaronr/dr-rstuff/blob/a66d110c934006b0abe612c7f12bbbb947997cd6/bookdown_template/chapter_1_sample_files/figure-common_mark/"

#ch_md <- gsub(im_prefix_here, im_url_prefix, ch_md)
# or do we need "https://raw.githubusercontent.com/daaronr..."?


#![](chapter_1_sample_md_files/figure-commonmark/unnamed-chunk-3-1.png)<!-- -->

# ...

#... Footnote newlines not needed, footnotes can not contain *any* new lines ... (todo) ####


reg_fna <- rex::rex(
  one_or_more('\\*'),
  one_or_more(any_spaces, type="lazy"),
  '^['
  )

ch_md <- ch_md %>%
  gsub(reg_fna,
       '^[', .)

#Todo -- Remove all explicit asterisks (remember -- no significance stars etc are present because we turned it into images)

# ... Remove multiple blank lines ####

reg_blanks <- rex::rex(at_least("\n", 3))

ch_md <- gsub(reg_blanks, "\n\n", ch_md)

# ... single backslashes should be blank lines
#ch_md <- gsub(rex(start, "\", newline), "\n\n", ch_md)

# ... if on DR computer, remove tables that will not come out (TODO) ####

reg_tab <- rex::rex('<table class=',
                   one_or_more(anything, type="lazy"),
                   '</table>')


if(Sys.info()[[4]]=="Yosemites-iMac.local") {
  ch_md <- gsub(reg_tab, "", ch_md)
}

# ... TODO: Internal links to URL links (very difficult!)

write_lines(ch_md, here("ch.md"))
#write_lines(ch_md, here("code", "ch_fix_pete.md"))

#This doesn't seem to do anything
#p_load(reticulate)
#py_run_file(here("code", "fix_eafo_links.py"))
#file.copy(here("code", "ch_lf.md"), here("ch_lf.md"), overwrite = TRUE)
# aborted attempt to get this to run python code and take object from R


# ... Internal links to URL links with external python script (thanks Hamish Huggard) -- run




