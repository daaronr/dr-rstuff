
#p_load(knitr, dplyr, tidyverse, here, janitor, citr, reporttools, magrittr, glue, experiment, estimatr, broom, kableExtra, purrr, ggsignif, recipes, pwr,lubridate,huxtable,sandwich,randomizr)


#tryCatch(
#devtools::install_github("moodymudskipper/safejoin")
#)

#p_load_gh("acoppock/attrition", "ngreifer/cobalt") # Alexander Coppock package to calculate trimming bounds. Not on CRAN


library(pacman)

p_load(arm, arsenal, blockTools, bookdown, broom, car,  cobalt, codebook, coefplot, corx, data.table, dataMaid, DescTools, devtools, dplyr, DT,  estimatr, experiment, forcats, furniture, gapminder, GGally, gganimate, ggplot2, ggpubr, ggrepel, ggsignif, ggtext, ggthemes, glmnet, glmnetcr, glue, gtools, gtsummary, here, Hmisc, hrbrthemes, huxtable, janitor, kableExtra, knitr, likert, lmtest, lubridate, magrittr, paramtest, pastecs, plotly, pryr, psych, pubh, purrr, pwr, randomizr, readr, readxl, recipes, reporttools, rlang, safejoin, sandwich, santoku, scales, searcher, sjlabelled, sjmisc, skimr, snakecase, statmod, summarytools, tidyverse, todor, vtable,
      install = FALSE)

devtools::install_github("robertzk/bettertrace")
library(bettertrace) 


print("Note we have now set install=FALSE in the p_load; thus you must install all of these packages yourself (but only once)")

#TODO: I Intend to load `conflicted` here, but I would need to resolve a huge number of name conflicts

p_load_gh('peterhurford/surveytools2')
p_load_gh('hughjonesd/rumpel')


