
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

rules <- apriori(admissions,
                  parameter = list(minlen=2, supp=0.06, conf=0.2),
                  #appearance = list(rhs=c("admit=0", "admit=1"), default="none"),
                  )#control = list(verbose=F))
quality(rules) <- round(quality(rules), digits=3)
rules.sorted <- sort(rules, by="confidence")
inspect(rules.sorted)
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