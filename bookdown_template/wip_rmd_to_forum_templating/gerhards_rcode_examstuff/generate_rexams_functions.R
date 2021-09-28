data2rmd <- function(x, ...) {
  ## Rmd exercise template
  rmd <- '
  
Question
========


%s

%s
%s

Answerlist
----------

%s
%s
%s
%s

Solution
========

Answerlist
----------

%s
%s
%s
%s

Meta-information
================
exname: %s
extype: mchoice
exsolution: %s
'
  
## convenience functions
include_image <- function(x) {
    if(is.na(x)) {
      return("")
    } else {
    # if(is.na(x)) return("")  
    rmd <- '```{r, echo = FALSE, results = "hide", warning=FALSE}
include_supplement("%s", recursive = TRUE)
```
\\
![](%s)'
    sprintf(rmd, x, x)
    }
  }
  
include_question <- function(x) {
  # if(x == "") return("")
  if(is.na(x)) return("")
  rmd <- '* "%s"'
  sprintf(rmd, x, x)
}
  
  ## insert data base into template
  nam <- x$identifier
  # x$identifier1 <- paste0("**",x$identifier,"**")
  x$solfeedback1 <- paste0(ifelse(x$solution1 == 1, "**True**: ", "**False**: "), x$feedback1 )
  x$solfeedback2 <- paste0(ifelse(x$solution2 == 1, "**True**: ", "**False**: "), x$feedback2 )
  x$solfeedback3 <- paste0(ifelse(x$solution3 == 1, "**True**: ", "**False**: "), x$feedback3 )
  x$solfeedback4 <- ifelse(!is.na(x$solution4), paste0(ifelse(x$solution4 == 1, "**True**: ", "**False**: "), x$feedback4 ), x$solution4)
  
  ph <- ""
    
  rmd <- sprintf(rmd,
                 #x$identifier1,
                 x$question,
                 ifelse(!is.na(x$image1), sapply(paste0(x$image1,".png"), include_image), ph),
                 ifelse(!is.na(x$image2), sapply(paste0(x$image2,".png"), include_image), ph),
                 sapply(x$answer1, include_question),
                 sapply(x$answer2, include_question),
                 sapply(x$answer3, include_question),
                 sapply(x$answer4, include_question),
                 sapply(x$solfeedback1, include_question),
                 sapply(x$solfeedback2, include_question),
                 sapply(x$solfeedback3, include_question),
                 sapply(x$solfeedback4, include_question),
                 nam,
                 paste0(x$solution1, x$solution2,x$solution3, ifelse(!is.na(x$solution4),x$solution4,""))
  )
  
  
  ## write Rmd files
  for(i in 1L:nrow(x)) writeLines(rmd[i], paste0(nam[i], ".Rmd"))
  invisible(rmd)
}

