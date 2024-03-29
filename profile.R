euclidean_distance = function(x1, y1, x2, y2) {
  distance = sqrt((x2 - x1)^2 + (y2 - y1)^2)
  return(distance)
}

set.seed(123) # Setting seed for reproducibility
num_points <- 10^6
x1 = runif(num_points)
y1 = runif(num_points)
x2 = runif(num_points)
y2 = runif(num_points)

 
Rprof()
system.time(euclidean_distance(x1,y1,x2,y2))
Rprof(NULL)
summaryRprof()
