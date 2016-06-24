corr 
<- function(directory, threshold = 0) 
{
id = 1:332
filename <- list.files(directory, full.names = TRUE)
result <-vector(mode="numeric", length=0)
 
for(i in seq(filename)) {
    airquality <- read.csv(filename[i])
airquality
#           Date sulfate nitrate ID
#1    2003-01-01      NA      NA  1
#2    2003-01-02      NA      NA  1
#3    2003-01-03      NA      NA  1
#..............
#1458 2006-12-28      NA      NA  1
#1459 2006-12-29      NA      NA  1
#1460 2006-12-30      NA      NA  1
#1461 2006-12-31      NA      NA  1

    good <- complete.cases(airquality)
good
#   [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#  [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#  [25] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#..........
#[1429] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[1441] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
#[1453] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  

    airquality <- airquality[good, ]
airquality
#           Date sulfate nitrate ID
#279  2003-10-06   7.210   0.651  1
#285  2003-10-12   5.990   0.428  1
#291  2003-10-18   4.680   1.040  1
#297  2003-10-24   3.470   0.363  1
#303  2003-10-30   2.420   0.507  1
#..........
#1137 2006-02-10   2.600   1.480  1
#1143 2006-02-16   2.700   1.030  1
#1149 2006-02-22   3.740   0.657  1
#1155 2006-02-28   2.640   0.577  1
#1161 2006-03-06   4.820   1.140  1
nrow(airquality)
#[1] 117

    if(nrow(airquality) > threshold) {
        # We need [[]] around pollutant instead of [] since 
        # airquality["sulfate"] is a data.frame but we need a vector here. 
        # Hence, [[]]. Please note thatusing either
        #[[]] or [] gives the same results as the test cases
class(airquality[["sulfate"]])
#[1] "numeric"
airquality["sulfate"]
#     sulfate
#279    7.210
#285    5.990
#291    4.680
#297    3.470
#303    2.420
#............
#1143   2.700
#1149   3.740
#1155   2.640
#1161   4.820
airquality[["sulfate"]]
#  [1]  7.210  5.990  4.680  3.470  2.420  1.430  2.760  3.410  1.300  3.150  2.870  2.270  2.330  1.840  7.130  2.050
# [17]  2.050  2.580  3.260  3.540  4.400  2.040  4.360  3.460  2.990  2.000  2.420  2.760  1.480  3.540  6.630 10.900
# [33]  1.630  5.760  5.520 12.200  4.980  4.390  1.650  4.530  4.300 15.800  5.440  3.090  3.610  4.190  7.370  2.680
# [49]  2.210  1.990  1.780  2.030  2.110  1.820  2.370  3.410  4.960  2.300  4.670  2.870  1.530  1.280  4.170  2.750
# [65]  2.830  1.220  4.190  1.920  2.550  2.180  2.930  2.790  2.740  2.020  4.730  5.840  4.640  4.790  6.650  2.090
# [81]  4.850  7.250  3.220  3.810  2.850  1.360  1.850 13.000  2.570  2.680  5.420  9.520  7.680  6.650 19.100  6.040
# [97]  2.800  5.520  1.820  4.880  2.280  5.510  2.410  1.630  1.670  0.959  2.740  0.613  2.370  2.240  2.530  3.500
#[113]  2.600  2.700  3.740  2.640  4.820
class(airquality["nitrate"])
#[1] "data.frame"
airquality["nitrate"]
#     nitrate
#279    0.651
#285    0.428
#291    1.040
#297    0.363
#303    0.507
#............
#1143   1.030
#1149   0.657
#1155   0.577
#1161   1.140
airquality[["nitrate"]]
#  [1] 0.651 0.428 1.040 0.363 0.507 0.474 0.425 0.964 0.491 0.669 0.400 0.715 0.554 0.803 0.518 1.400 0.979 0.632 0.506
# [20] 0.671 0.602 0.815 1.080 0.351 0.486 0.340 0.531 0.520 0.186 0.576 0.118 0.295 0.372 0.193 0.173 0.223 0.227 0.236
# [39] 0.479 0.140 0.203 0.472 0.665 0.466 0.372 0.221 0.590 0.219 0.568 0.337 0.739 1.200 0.429 0.941 0.570 1.160 0.537
# [58] 0.719 1.770 1.200 0.460 0.378 0.553 0.479 1.610 0.902 0.993 0.233 0.215 0.211 0.286 0.421 0.409 0.222 0.285 0.189
# [77] 0.204 0.299 0.276 0.290 0.266 0.355 0.205 0.322 0.331 0.250 0.177 0.178 0.503 0.191 0.209 0.193 0.404 0.226 0.149
# [96] 0.188 0.342 0.382 0.267 0.363 0.283 0.446 0.302 0.559 0.743 0.312 1.830 0.326 1.100 1.800 1.010 1.610 1.480 1.030
#[115] 0.657 0.577 1.140

        correlation <- cor(airquality[["sulfate"]], airquality[["nitrate"]])
#correlationVector = c(correlationVector, cor(data[,2], data[,3]))
        result <- append(result, correlation)
        #print(correlation)
  }
result
}
