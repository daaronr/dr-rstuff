########### Adapt Rethinkpriorities package style bookdowns to quarto, also changing some of DR's older syntax  ##################

require(readr)
require(dplyr)
require(rex)
require(magrittr)
#require(rethinkpriorities)


fold_to_quarto_note <-  function(filename) {

  reg_fold <- rex(
                  "```{block2,", #reinstein fold syntax
                  zero_or_more(any_spaces, type="lazy"),
                  "type='fold'}",
                  capture(one_or_more(anything,
                                      type="lazy")),
                  "```"
  )

  reg_foldable <-  rex("::: {.foldable}", #ws and bs4 fold syntax
                     zero_or_more(any_spaces, type="lazy"),
                    capture(one_or_more(anything,
                                        type="lazy")),
                  ":::"
  )

  ch_ed <- filename %>%
    gsub(reg_fold,
         "::: {.callout-note collapse='true'}\n \\1 \n:::", .) %>%
    gsub(reg_foldable,
         "::: {.callout-note collapse='true'}\n \\1 \n:::", .)

    return(ch_ed)
}


# Put this all together into a function that maps an old file into a new one and writes it in the environment, with set names ####

rp_rmd_to_quarto <- function(input, output) {
  readr::read_file(input) %>%
    fold_to_quarto_note %>%
readr::write_lines(output)
}

# could add ... #dr_to_bs4 %>%

# Trying it out ####
# rp_rmd_to_quarto(here::here("chapters", "chapter_1_sample.Rmd"),
#           here::here("chapters", "chapter_1_sample_bs4.Qmd"))


#rmd_files <- c("outline_work.Rmd", "present_puzzle.Rmd",  "substitution.Rmd",  "barriers_breakdown.Rmd", "BARRIERS_FUNDAMENTAL.md", "doesimpactmatter.Rmd", "aware-distance.Rmd", "identity.Rmd", "social.Rmd", "BARRIERS_INFO.md", "eval-aversion.Rmd", "impact_analytical.Rmd",  "BARRIERS_JUDGEMENT.md",  "quant-biases.Rmd", "factual.Rmd", "PATH_FORWARD.md", "tools.Rmd", "conclusion-agenda.Rmd", "appendix_tutorial.Rmd", "inertia.Rmd", "references.Rmd")

# apply all parsing commands and put it into 'chapters' folder
# system("mkdir chapters")

#map2(rmd_files, rmd_files,

#~ rp_rmd_to_quarto(here::here("sections", .y), here::here("chapters", .y)))


#newName <- sub(".Rmd", ".qmd", here::here("chapters", rmd_files))


#file.rename(here::here("chapters", rmd_files), newName)

