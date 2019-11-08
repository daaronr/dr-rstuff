#Input
ms <- tribble( #mark scheme
  ~q_label,	~point_value,	~d_partial_credit,	~c_ans,
  "questions1",	5,	1,	"B,E",
  "questions2",	4,	0,	"C",
  "questions3",	4,	1,	"C,E"
)

ms <- ms %>% remove_rownames %>% column_to_rownames(var="q_label")

sr <- tribble( #student responses 
~id,	~questions1,	~questions2,	~questions3,
"1", "A,E",	"C", "C,B",
"2",	"A,D,E","B","C,E",
"3",	"E",	"C",	"A,B,C",
"4", "E",	"C",	"C"
)

#Convert answer columns into "list of characters" recursive vector thing:
ms$c_ans <- lapply(strsplit(as.character(ms$c_ans),split=','),trimws)

makeitlist <- function(x) (lapply(strsplit(as.character(x),split=','),trimws))

sr <- sr %>% mutate_all(makeitlist)

#for (i in 2:length(sr)) {          
#  sr[[i]] <- makeitlist(sr[[i]]) 
#}


#Trying

#Compare elements of a single vector of responses sr$questions1 to the corresponding element of ms, i.e.,  ms[[c("questions1"),"c_ans"]] 


#This seems to work, element by element...
length(intersect(sr$questions3[[2]], ms[[c("questions3"),"c_ans"]]))
length(intersect(sr$questions3[[1]], ms[[c("questions3"),"c_ans"]])) 

#now I need to figure out how to iterate it over all questions and over all students

for(q in rownames(ms)) {   #iterate over all questions 
  for (i in 1:NROW(sr)) {  #over all students
    sr[[glue("cr_ans_",q)]][[i]] <- length(intersect(sr[[q]][[i]], ms[[c(q),"c_ans"]])) 
  }
} 

# Below,  some things that dr
dn't work, I don't know why


sr$questions1 == ms[[c("questions1"),"c_ans"]] #why oh why is the fourth element 'true'? Not sure how list comparisons work
sr$questions1[[4]] == ms[[c("questions1"),"c_ans"]] #Hmm, it compares each element but not the whole thing
sr$questions1[[4]] == ms[[c("questions1"),"c_ans"]] #Hmm, it compares each element in the list but not the whole list

length(intersect(sr$questions1, ms[[c("questions1"),"c_ans"]])) #no idea why it's 1


  