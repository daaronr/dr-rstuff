########### Make DR gitbook style Rmd files adaptable to Sleegers bs4 style  ##################

p_load(readr)
p_load(rex)
p_load(magrittr)

#... input file for editing ####
ch_Rmd <- readr::read_file(here("chapters", "chapter_1_sample.Rmd"))
##You need to call it `ch_Rmd` for parse_ea_forum_md.R to run, until I functionalize it or have it 'do this for every file in folder'

#1. Tufte notes become footnotes... (Popup, in Willem's style) ####
# tag 2 formats of tufte notes
reg_mn_div <- rex('<div class="marginnote">',
                       zero_or_more("\\*"),
                       capture(one_or_more(anything, type="lazy")),
                       '</div>')

reg_mn_col_to_fn <- rex('::: {.marginnote}',
                       zero_or_more(any_spaces),
                       zero_or_more("\\*"),
            capture(one_or_more(anything, type="lazy")), ':::')

# make into footnotes
ch_Rmd <- ch_Rmd %>%
  gsub(reg_mn_div, '^[\\1]', .)  %>%
  gsub(reg_mn_col_to_fn, '^[\\1]', .)

#todo: remove asterisks at the start of these (or just remove all asterisks in the file)

# 2.  Folding boxes into Sleegers adapted format ###

#::: {.foldable}
#Hello **world**!
#:::

reg_fold <- rex("```{block2,",
                zero_or_more(any_spaces, type="lazy"),
                "type='fold'}",
                capture(one_or_more(anything,
                                    type="lazy")),
                "```"
                )

ch_Rmd %<>% 
  gsub(reg_fold, "::: {.foldable} \n \\1 \n:::", .)


# 3. Turn other block2 content into a 'callout block' (for now)

#note -- this must be run *after* the previous (otherwise we need to exclude blocks containing 'fold')
reg_block2 <- rex("```{block2",
                one_or_more(anything, type="lazy"),
                "}",
                capture(one_or_more(anything,
                                    type="lazy")),
                "```"
)

ch_Rmd <- ch_Rmd %>%
  gsub(reg_block2, "::: {.rmdnote}\n \\1 \n:::", .)


readr::write_lines(ch_Rmd, here::here("chapters", "chapter_1_sample_bs2.Rmd"))

