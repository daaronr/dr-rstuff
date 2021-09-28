library(knitr)
library(rmarkdown)
library(here)
library(exams)
library(dplyr)
library(stringi)
library(tidyverse)
library(purrr)

source(here("code/generate_rexams_functions.R"))

path_rmd_files <- here("output/rmd_question_files/")
path_rmd_files_de <- here("output/rmd_question_files_de/")
path_output <- here("output/en")
path_output_de <- here("output/de")
path_input <- here("input/")

## Read MCQ file
quizzes <- read_csv(here("input/The-Economy-Question-Test-Bank-1-February-2021.csv"))
quizzes_de <- read_csv2(here("input/CORE-The-Economy-MCQ-9-November-2020_DE.csv"))


# Generate RMD files
# setwd(path_rmd_files)

# data2rmd(quizzes)

setwd(path_rmd_files)

data2rmd(quizzes)



######################################
# Generate different question sets####
######################################

## All
quest_list_all    <- list.files(path = path_rmd_files, pattern = "*.Rmd")
quest_list_all_de <- list.files(path = path_rmd_files_de, pattern = "*.Rmd")


## from the core-econ book
quest_list_eco <- list.files(path = path_rmd_files, pattern = "ECO-*")

## all additional questions not in the core-econ book
quest_list_add <- list.files(path = path_rmd_files, pattern = "^(OUP|TEA|UCL)")


# Selection


## Chapter 1

quest_list_ch1 <- c("OUP-U1-Q3.Rmd", "OUP-U1-Q4.Rmd", "OUP-U1-Q2.Rmd", "UCL-J15-Q2.Rmd", "OUP-U1-Q24.Rmd")
setwd(path_output_de)
  exams2html(quest_list_ch1, edir = path_rmd_files_de, dir = path_output_de)


## Chapter 2
setwd(path_output_de)
quest_list_ch2 <- c("OUP-U2-Q1.Rmd", "OUP-U2-Q3.Rmd", "OUP-U2-Q6.Rmd", "OUP-U2-Q7.Rmd", "OUP-U2-Q17.Rmd", "OUP-U2-Q19.Rmd")
  exams2html(quest_list_ch2, edir = path_rmd_files_de, dir = path_output_de, file = "Kapitel_2")

## Chapter 3
setwd(path_output)
c("OUP-U3-Q1.Rmd", "OUP-U3-Q5.Rmd", "OUP-U3-Q10.Rmd", "OUP-U3-Q10.Rmd", "OUP-U3-Q13.Rmd", "OUP-U3-Q7.Rmd", "OUP-U3-Q22.Rmd") %>% 
  exams2html(., edir = path_rmd_files, dir = path_output)

## Chapter 4
setwd(path_output_de)
c("ECO-U4-Q3.Rmd", "ECO-U4-Q6.Rmd",  "OUP-U4-Q12.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)

## Chapter 5
setwd(path_output_de)
c("OUP-U5-Q3.Rmd", "OUP-U5-Q22.Rmd",  "OUP-U5-Q12.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)
## Chapter 6
setwd(path_output_de)
c("OUP-U6-Q13.Rmd", "OUP-U6-Q4.Rmd",  "OUP-U6-Q8.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)

## Chapter 7
setwd(path_output_de)
c("OUP-U7-Q1.Rmd", "OUP-U7-Q4.Rmd",  "OUP-U7-Q7.Rmd",  "OUP-U7-Q11.Rmd", "OUP-U7-Q23.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)


## Chapter 9
setwd(path_output_de)
c("OUP-U9-Q2.Rmd", "OUP-U9-Q5.Rmd",  "OUP-U9-Q7.Rmd",  "ECO-U9-Q7.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)


## Chapter 10
setwd(path_output_de)
c("OUP-U10-Q25.Rmd", "ECO-U10-Q11.Rmd",  "ECO-U10-Q1.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)


## Chapter 12
setwd(path_output_de)
c("OUP-U12-Q9.Rmd", "OUP-U12-Q19.Rmd",  "OUP-U12-Q15.Rmd", "ECO-U12-Q5.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)

## Chapter 17
### No quizzes


# Probeexamen Winter Term 20/21

setwd(path_output_de)
c("ECO-U1-Q7.Rmd", "TEA-U3-Q2.Rmd") %>%  
  exams2ilias(., edir = path_rmd_files_de, dir = path_output_de, eval = list(partial = TRUE, negative = FALSE, rule = "all"))

c("ECO-U1-Q7.Rmd", "TEA-U3-Q3.Rmd") %>%  
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)

# All questions for Course in Winterterm 2020/21

## Read MCQ file
#quizzes <- read_csv2(here("input/The-Economy-Question-Test-Bank-1-February-2021.csv"))




exercises_20_21 <- c("OUP-U1-Q3.Rmd", "OUP-U1-Q4.Rmd", "OUP-U1-Q2.Rmd", "UCL-J15-Q2.Rmd", "OUP-U1-Q24.Rmd",
  "OUP-U2-Q1.Rmd", "OUP-U2-Q3.Rmd", "OUP-U2-Q6.Rmd", "OUP-U2-Q7.Rmd", "OUP-U2-Q17.Rmd", "OUP-U2-Q19.Rmd",
  "OUP-U3-Q1.Rmd", "OUP-U3-Q5.Rmd", "OUP-U3-Q10.Rmd", "OUP-U3-Q13.Rmd", "OUP-U3-Q7.Rmd", "OUP-U3-Q22.Rmd",
  "ECO-U4-Q3.Rmd", "ECO-U4-Q6.Rmd",  "OUP-U4-Q12.Rmd",
  "OUP-U5-Q3.Rmd", "OUP-U5-Q22.Rmd",  "OUP-U5-Q12.Rmd",
  "OUP-U6-Q13.Rmd", "OUP-U6-Q4.Rmd",  "OUP-U6-Q8.Rmd",
  "OUP-U7-Q1.Rmd", "OUP-U7-Q4.Rmd",  "OUP-U7-Q7.Rmd",  "OUP-U7-Q11.Rmd", "OUP-U7-Q23.Rmd",
  "OUP-U9-Q2.Rmd", "OUP-U9-Q5.Rmd",  "OUP-U9-Q7.Rmd",  "ECO-U9-Q7.Rmd", "OUP-U10-Q25.Rmd",
  "ECO-U10-Q11.Rmd",  "ECO-U10-Q1.Rmd",
  "OUP-U12-Q9.Rmd", "OUP-U12-Q19.Rmd",  "OUP-U12-Q15.Rmd", "ECO-U12-Q5.Rmd")



#exercises_20_21_text <- quizzes_de %>% filter(identifier %in% str_remove(exercises_20_21, ".Rmd"))
#write.csv(exercises_20_21_text, file = "exercises_20_21.csv")



quizzes_de_corr <- read_csv(here("input/exercises_20_21_corr.csv")) %>% dplyr::select(-X1)

setwd(path_rmd_files_de)

data2rmd(quizzes_de_corr)

exercises_20_21 %>% 
  exams2html(., edir = path_rmd_files_de, dir = path_output_de)


## Exam 20/21

exam_20_21 <-  c("OUP-U1-Q23.Rmd", "OUP-U2-Q8.Rmd", 
                 "OUP-U2-Q20.Rmd", "OUP-U3-Q24.Rmd", 
                 "ECO-U4-Q5.Rmd",  "OUP-U5-Q21.Rmd",
                 "ECO-U6-Q5.Rmd",  "OUP-U10-Q4.Rmd",
                 "OUP-U12-Q8.Rmd", "OUP-U17-Q19.Rmd")


# exam_20_21 %>%   exams2html(., edir = path_rmd_files_de, dir = path_output_de)

# exam_20_21_text <- quizzes_de %>% filter(identifier %in% str_remove(exam_20_21, ".Rmd"))
# write.csv(exam_20_21_text, file = "exam_20_21.csv")



exam_de_corr <- read_csv(here("input/exam_20_21_corr.csv")) %>% dplyr::select(-X1)

setwd(path_rmd_files_de)

data2rmd(exam_de_corr)

setwd(path_output_de)
exam_20_21_names <-  c("Aufgabe 6-1.Rmd", "Aufgabe 6-2.Rmd", 
                 "Aufgabe 6-3.Rmd", "Aufgabe 6-4.Rmd", 
                 "Aufgabe 6-5.Rmd",  "Aufgabe 6-6.Rmd",
                 "Aufgabe 6-7.Rmd",  "Aufgabe 6-8.Rmd",
                 "Aufgabe 6-9.Rmd", "Aufgabe 6-10.Rmd")

exam_20_21 %>%   exams2html(., edir = path_rmd_files_de, dir = path_output_de)


exam_20_21 %>%   exams2ilias(., edir = path_rmd_files_de, dir = path_output_de, 
                             points = 4, 
                             eval = list(partial = TRUE, negative = FALSE, rule = "true"))


exam_20_21 %>%   exams2pandoc(., edir = path_rmd_files_de, dir = path_output_de, solution = FALSE, question = "Frage")



# exam 2021

setwd(path_output_de)

exam_21 <- c("OUP-U1-Q6.Rmd", 
"OUP-U1-Q12.Rmd", 
"ECO-U1-Q4.Rmd", 
"OUP-U2-Q25.Rmd",
"TEA-U3-Q2.Rmd",
"OUP-U6-Q18.Rmd",
"TEA-U7-Q2.Rmd", 
"OUP-U9-Q2.Rmd",
"OUP-U4-Q23.Rmd",
"OUP-U5-Q2.Rmd"
)

setwd(path_output_de)

exam_21_names <-  c("Aufgabe 6-1.Rmd", "Aufgabe 6-2.Rmd", 
                       "Aufgabe 6-3.Rmd", "Aufgabe 6-4.Rmd", 
                       "Aufgabe 6-5.Rmd",  "Aufgabe 6-6.Rmd",
                       "Aufgabe 6-7.Rmd",  "Aufgabe 6-8.Rmd",
                       "Aufgabe 6-9.Rmd", "Aufgabe 6-10.Rmd")



exam_21 %>%   exams2html(., edir = path_rmd_files_de, dir = path_output_de)


exam_21 %>%   exams2ilias(., edir = path_rmd_files_de, dir = path_output_de, name = "exam21",
                             points = 4, 
                             eval = list(partial = TRUE, negative = FALSE, rule = "true"))


exam_21 %>%   exams2pandoc(., edir = path_rmd_files_de, dir = path_output_de, solution = FALSE, question = "Frage")

setwd(path_rmd_files_de)

setwd(path_output)

exam_21 %>%   exams2pandoc(., edir = path_rmd_files, dir = path_output, solution = FALSE, question = "Question")







# All
## German

setwd(path_output_de)
exams2ilias(quest_list_all, edir = path_rmd_files_de, dir = path_output_de)
exams2html(quest_list_add, edir = path_rmd_files_de, dir = path_output_de)



## Generate sets using R/exams
setwd(path_output)

exams2pandoc(quest_list_add, edir = path_rmd_files, dir = path_output)

exams2ilias(quest_list_all, edir = path_rmd_files, dir = path_output)

exams2html(quest_list_add, edir = path_rmd_files, dir = path_output)

exams2pdf(quest_list_add, edir = path_rmd_files, dir = path_output)


