stdev <- function(data) {
  n <- length(data)
  
  if (n < 2) {
    stop("Need at least two data points")
  }
  
  mean_value <- sum(data) / n
  
  squared_differences <- numeric(n)
  
  for (i in 1:n) {
    squared_differences[i] <- (data[i] - mean_value)^2
  }
  
  variance <- sum(squared_differences) / n
  
  standard_deviation <- sqrt(variance)
  
  return(standard_deviation)
}