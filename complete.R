function (directory ="specdata", id = 1:332) {

files <- list.files(directory, full.names = 1)

complete_files <- data.frame(id=NA, nobs=NA)

for(i in 1:length(id)) {
     complete_files[i, 1] <- id[i]
     complete_files[i, 2] <- sum(complete.cases(read.csv(files[id[i]])))
   }
 complete_files
}
