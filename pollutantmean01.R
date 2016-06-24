pollutantmean <-
function (directory ="specdata", pollutant ="", id = 1:332) 
{#files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
#files_list
#head(read.csv(files_list[1]))
#setwd(file.path(getwd(), directory)) ## setting the directory
datas <- data.frame()
#total = 0                            ## the sum of all observed values of pollutant (either sulfate or nitrate)
#observations = 0                     ## the total number of observed values of pollutant (either sulfate or nitrate)

nfile <- paste(directory, sprintf("\\%03d",id), ".csv", sep="")
print(nfile);

tb <- table()
tb <- read.csv(nfile, header = FALSE
              )
print(tb)
tb <- read.table("001.csv",sep = ",",header = TRUE, na.strings = "NA")
class(tb)
#[1] "data.frame"
names(tb)
#[1] "Date"    "sulfate" "nitrate" "ID"     
dim(tb)
#[1] 1461    4
nrow(tb)
#[1] 1461
ncol(tb)
#[1] 4
colnames(tb)
#[1] "Date"    "sulfate" "nitrate" "ID"     
rownames(tb)
#[1] "1"    "2"    "3"    "4"    "5"    "6"    "7"    "8"    "9"    "10"  
#[11] "11" .....
#[1451] "1451" "1452" "1453" "1454" "1455" "1456" "1457" "1458" "1459" "1460"
#[1461] "1461"
head(tb)
#        Date sulfate nitrate ID
#1 2003-01-01      NA      NA  1
#2 2003-01-02      NA      NA  1
#3 2003-01-03      NA      NA  1
#4 2003-01-04      NA      NA  1
#5 2003-01-05      NA      NA  1
#6 2003-01-06      NA      NA  1
tb[1,4]
#[1] 1
tb[1,2]
#[1] NA
tb[1,1]
#[1] 2003-01-01
#1461 Levels: 2003-01-01 2003-01-02 2003-01-03 2003-01-04 ... 2006-12-31

goodTb <- complete.cases(tb)
tb[goodTb,]
good <- tb[goodTb,]
#           Date sulfate nitrate ID
#279  2003-10-06   7.210   0.651  1
#285  2003-10-12   5.990   0.428  1
#291  2003-10-18   4.680   1.040  1
#...........
#1143 2006-02-16   2.700   1.030  1
#1149 2006-02-22   3.740   0.657  1
#1155 2006-02-28   2.640   0.577  1
#1161 2006-03-06   4.820   1.140  1
goodTb <- tb[complete.cases(tb),]
goodTb
#           Date sulfate nitrate ID
#279  2003-10-06   7.210   0.651  1
#285  2003-10-12   5.990   0.428  1
#291  2003-10-18   4.680   1.040  1
#...........
#1143 2006-02-16   2.700   1.030  1
#1149 2006-02-22   3.740   0.657  1
#1155 2006-02-28   2.640   0.577  1
#1161 2006-03-06   4.820   1.140  1
mean(goodTb[,"sulfate"], na.rm=1)
#[1] 3.880701
mean(tb[,"sulfate"], na.rm=1)
#[1] 3.880701

pollutantmean("specdata","sulfate",1)


#Looping thru the directory's files specified in the 'id' argument 
for(i in id) {
    #datas <- rbind(datas, read.csv(paste(directory, "/00", as.character(i), ".csv", sep=""),  ## for example, if 'id' =7, we get 007.csv
     datas <- rbind(datas, read.csv(paste(directory, sprintf("\\%03d",i), ".csv", sep=""),  ## for example, if 'id' =7, we get 007.csv
                                    #header = T, 
                                    #na.strings=c("NA","NaN", " ")
                                   )
                   )
     #else if (i>=10 & i<100) { 
     #      datas <- rbind(datas, read.csv(paste(directory, "/0", as.character(i), ".csv", sep=""),  ## for example, if 'id' = 17, we get 017.csv
                                           #header = T, 
                                           #na.strings=c("NA","NaN", " ") 
     #                                    )
     #                    )
## getting rid of all the "NA" values and, consequently, all the non-complete ovservations (the ones with at least one NA in row)
#data = na.omit(data)  
##  cumulative addition of the complete observations
#observations = observations + nrow(data)
## depending the poluttant ( sulfate or nitrate), we aggregate the observed values
#if(pollutant == "sulfate") 
#  {total = total + sum(data$sulfate)
#  }
#else 
#  {total = total + sum(data$nitrate)
#  }
}

## reset directory path
#setwd("..")
## returning the mean of the pollutant values
#return (total/observations)
mean(datas[,pollutant], na.rm=1)
}
