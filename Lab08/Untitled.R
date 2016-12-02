library(arules)

rm(list=ls()) 
setwd("/Users/hassanalshehri/Google Drive/RPI/Open_Software/myRepo/Lab08")
getwd()
admissions <- read.table("binary.csv", header = TRUE, sep = "," )
col_names <- names(admissions)
admissions[,col_names] <- lapply(admissions[,col_names] , factor)
str(admissions)
summary(admissions)
head(admissions)

rules <- apriori(admissions,  parameter = list(minlen=2, supp=0.01, conf=0.02),
                 appearance = list(rhs=c("admit=1"), 
                                   default="lhs"),
                 control = list(verbose=F))
rules.sorted <- sort(rules, by="confidence")
inspect(rules.sorted)


rules <- apriori(admissions,
                  parameter = list(minlen=2, supp=0.07, conf=0.02),
                 appearance = list(rhs=c(("rank=1")), default="none"),
                  control = list(verbose=F)) 
quality(rules) <- round(quality(rules), digits=3)
rules.sorted <- sort(rules, by="confidence")
inspect(rules.sorted)

setwd("/Users/hassanalshehri/Google Drive/RPI/Open_Software/myRepo/Lab08")
titanic.raw <- read.table("titanic.raw.rdata", header = TRUE, sep = "," )
col_names <- names(admissions)


readLines("./titanic.raw", n=5)
titanic <- read.table("./titanic.raw.rdata", header=F)
names(titanic) <- c("Class", "Sex", "Age", "Survived")
summary(titanic)


library(arulesViz)
plot(rules.sorted)
plot(rules.sorted, method="grouped")
plot(rules.sorted, method="graph")
plot(rules.sorted, method="graph", control=list(type="items"))

'
rm(list=ls()) 
setwd("/Users/hassanalshehri/Google Drive/RPI/Open_Software/myRepo/Lab08")
getwd()
admissions <- read.table("binary.csv", header = TRUE, sep = "," )
str(admissions)
col_names <- names(admissions)
admissions[,col_names] <- lapply(admissions[,col_names] , factor)

titanic.raw <- NULL
for(i in 1:4) {
   titanic.raw <- cbind(titanic.raw, rep(as.character(df[,i]), df$Freq))
}
titanic.raw <- as.data.frame(titanic.raw)
names(titanic.raw) <- names(df)[1:4]
dim(titanic.raw)
'


#precip[1:10]
#require(graphics)
#dotchart(precip[order(precip)], main = "precip data")
#title(sub = "Average annual precipitation (in.)")
#library(prob)
#library(combinat)
#with(prob)

#precip[1:10]
#require(graphics)
#dotchart(precip[order(precip)], main = "precip data")
#title(sub = "Average annual precipitation (in.)")
#library(prob)
#library(combinat)
#with(prob)
