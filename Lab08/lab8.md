
```
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

library(arulesViz)
plot(rules.sorted)
plot(rules.sorted, method="grouped")
plot(rules.sorted, method="graph")
plot(rules.sorted, method="graph", control=list(type="items"))


```

```
> inspect(rules.sorted)
     lhs          rhs       support confidence lift 
[1]  {rank=4}  => {admit=0} 0.138   0.821      1.203 
[2]  {rank=3}  => {admit=0} 0.232   0.769      1.126
[3]  {rank=2}  => {admit=0} 0.242   0.642      0.941
[4]  {rank=1}  => {admit=1} 0.082   0.541      1.704
[5]  {rank=1}  => {admit=0} 0.070   0.459      0.673
[6]  {admit=1} => {rank=2}  0.135   0.425      1.126
[7]  {rank=2}  => {admit=1} 0.135   0.358      1.126
[8]  {admit=0} => {rank=2}  0.242   0.355      0.941 
[9]  {admit=0} => {rank=3}  0.232   0.341      1.126 
[10] {admit=1} => {rank=1}  0.082   0.260      1.704
[11] {rank=3}  => {admit=1} 0.070   0.231      0.729
[12] {admit=1} => {rank=3}  0.070   0.220      0.729
[13] {admit=0} => {rank=4}  0.138   0.201      1.203
```


![Plot](./Rplot.png)
![Plot](./Rplot01.png)
![Plot](./Rplot02.png)
![Plot](./Rplot03.png)


##Status of my project:
- Found an issue about a bug.
- Forked the repository. 
- Debugged the code.
- Added test cases to cover cases that were not covered in the original test cases. 
- Submitted a pull request.
- My pull request was accepted.
