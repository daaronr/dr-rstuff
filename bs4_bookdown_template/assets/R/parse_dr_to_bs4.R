########### Make DR gitbook style Rmd files adaptable to Sleegers bs4 style  ##################

p_load(readr)
p_load(rex)
p_load(magrittr)


# Attempt to get whole list of files to map (not applied yet) ####
#
# filenames <- c(list.files("chapters", pattern=".Rmd"))
#
# filenames_specific <- c(here("index.Rmd"), here("chapters", "chapter_1_sample.Rmd"), here("chapters", "chapter_2_sample.Rmd"), here("chapters", "references.Rmd"))
#
# ch_Rmd <- list()
# for(i in filenames_specific) {
#   #... input file for editing ####
#   ch_Rmd[i] <- readr::read_file((i))
# }



#1. Tufte notes become footnotes... (Popup, in Willem's style) ####
  # tag 2 formats of tufte notes

tufte_to_footnote <- function(filename) {
  reg_mn_div <- rex(zero_or_more("\\*"),
                    zero_or_more(any_spaces),
                    '<div class="marginnote">',
                    zero_or_more(any_spaces),
                    zero_or_more("\\*"),
                    capture(one_or_more(anything, type="lazy")),
                    '</div>')

reg_mn_col_to_fn <- rex(zero_or_more("\\*"),
                          zero_or_more(any_spaces),
                          '::: {.marginnote}',
                          zero_or_more(any_spaces),
                          zero_or_more("\\*"),
                          capture(one_or_more(anything, type="lazy")), ':::')

  # make into footnotes
  ch_ed <- filename %>%
    gsub(reg_mn_div, '^[\\1]', .)  %>%
    gsub(reg_mn_col_to_fn, '^[\\1]', .)

  return(ch_ed)
}

# ch_Rmds <- purrr::map(ch_Rmd, tufte_to_footnote)
#
# new_list <- set_names(map2(list_a,names(list_a),
#                            ~tibble(!!.y := .x)), str_c("df", 1:3))
#
# list2env(new_list, .GlobalEnv)


#todo: remove asterisks at the start of these (or just remove all asterisks in the file)

# 2.  Folding boxes into Sleegers adapted format ####

#::: {.foldable}
#Hello **world**!
#:::

fold_to_foldable <- function(filename) {
  reg_fold <- rex("```{block2,",
                  zero_or_more(any_spaces, type="lazy"),
                  "type='fold'}",
                  capture(one_or_more(anything,
                                      type="lazy")),
                  "```"
  )
  ch_ed <- filename %>%
    gsub(reg_fold, "::: {.foldable} \n \\1 \n:::", .)

  return(ch_ed)
}


# 3. Turn other block2 content into a 'callout block' (for now) ####

#note -- this must be run *after* the previous (otherwise we need to exclude blocks containing 'fold')

block2_to_callout <- function(filename) {
  reg_block2 <- rex("```{block2",
                    one_or_more(anything, type="lazy"),
                    "}",
                    capture(one_or_more(anything,
                                        type="lazy")),
                    "```"
  )

  ch_ed <- filename %>%
    gsub(reg_block2, "::: {.rmdnote}\n \\1 \n:::", .)

  return(ch_ed)
}


# Put this all together into a function that maps an old file into a new one and writes it in the environment, with set names ####

dr_to_bs4 <- function(input, output) {
  readr::read_file(input) %>%
    tufte_to_footnote %>%
    fold_to_foldable %>%
    block2_to_callout %>%
    readr::write_lines(output)
}


# Trying it out ####
# dr_to_bs4(here::here("chapters", "chapter_1_sample.Rmd"),
#           here::here("chapters", "chapter_1_sample_bs4.Rmd"))

#assign(output, data.frame(object), envir = .GlobalEnv)


