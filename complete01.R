complete <-

function (directory ="specdata", id = 1:332) 
{
files <- list.files(directory, full.names = 1)

#complete_files <- data.frame(id=integer(), nobs=integer())
complete_files <- data.frame(id=NA, nobs=NA)
complete_files
#  id nobs
#1 NA   NA

#for(i in id) { 
for(i in 1:length(id)) {
    #complete_files[i, 1] <- i
     complete_files[i, 1] <- id[i]
    #complete_files[i, 2] <- sum(complete.cases(read.csv(files[i])))
     x<-read.csv("001.csv")
x
#           Date sulfate nitrate ID
#1    2003-01-01      NA      NA  1
#2    2003-01-02      NA      NA  1
#3    2003-01-03      NA      NA  1
y <- complete.cases(x)
y
#   [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#  [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#  [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#  ..........
#[1441] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[1453] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
z <- sum(y)
z
#[1] 117
     complete_files[i, 2] <- sum(complete.cases(read.csv(files[id[i]])))
   }
#complete_files[complete.cases(complete_files),]
 complete_files
}
