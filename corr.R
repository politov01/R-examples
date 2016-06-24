corr <- function(directory, threshold = 0) {

id = 1:332
filename <- list.files(directory, full.names = TRUE)

result <-vector(mode="numeric", length=0)
 
for(i in seq(filename)) {
    airquality <- read.csv(filename[i])
    good <- complete.cases(airquality)
    airquality <- airquality[good, ]
    if(nrow(airquality) > threshold) {
        correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
        result <- append(result, correlation)
        #print(correlation)
       }
  }
result
}
