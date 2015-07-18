#Your task is to study the dataset and the associated description of the data (i.e. "data dictionary"). You may need
#to look around a bit, but it's there! You should take the data, and create a data frame with a subset of the columns
#(and if you like rows) in the dataset. You should include the column that indicates edible or poisonous and three or
#four other columns. You should also add meaningful column names and replace the abbreviations used in the
#data-for example, in the appropriate column, "e" might become "edible." Your deliverable is the R code to
#perform these transformation tasks.

# take the data and create data frame with column subset
# include wihc indicates edible or poisonous and for other
Mdf<-read.csv(file="agaricus-lepiota.csv", header=FALSE, sep=",")
Mdict <- read.table("m_dictionary.txt",row.names = 1, sep=":")
names(Mdf) = row.names(x)
Mdf.sub <- subset(Mdf, select=c("class","cap-color","ring-number","odor"))
#gsub("(^|.*,)(.*)=t.*","\\2",x["ring-number",1])
#add column names

#replace abrev. 
getTranslation <- function(abbr, s) {
  cat("testing:",abbr, " done")
  return(gsub(paste('(^|.*,)(.*)=',abbr,'.*',sep=""),"\\1", s))
  
}

as.data.frame(lapply(temp.df,FUN = function(x) (gsub("n",as.character(colnames(x)),x))))
as.data.frame(lapply(temp.df,FUN=function(x)(x=colnames(x))))
sapply(colnames(temp.df), function(x) x)

for (name in colnames(temp.df)){
  print(name)
  t2 <- (lapply(temp.df[name],FUN = function(x)(gsub(paste('(^|.*,)(.*)=',x,'.*',sep=""),"\\1",Mdict[name,1]))))
  print(t2)
}
             
              
for (name in colnames(temp.df)){
  print(name)
  print(temp.df[name])
  t2 <- (sapply(temp.df[name],FUN = function (x) getTranslation(as.character(x), Mdict[name,1])))
 # print(t2)
}

for (name in colnames(temp.df)){
  print(name)
  print(temp.df[name])
  t2 <- (sapply(temp.df[name],FUN = function (x) cat(as.character(x),"test1")))
  # print(t2)
}

              