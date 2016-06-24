function (directory ="specdata", pollutant ="", id = 1:332) 
{
datas <- data.frame()
for(i in id) {
     datas <- rbind(datas, read.csv(paste(directory, sprintf("\\%03d",i), ".csv", sep=""),  ## for example, if 'id' =7, we get 007.csv
                                   )
                   )
   }
mean(datas[,pollutant], na.rm=1)
}
