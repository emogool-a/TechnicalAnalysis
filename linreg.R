linreg <- function(regressionSource, regressionLength, regressionOffset) {
  
  n <- length(regressionSource)
  
  if (regressionLength > n) {
    stop("regressionLength cannot be greater than the number of elements")
  }
  
  if (regressionOffset >= regressionLength) {
    stop("regressionOffset must be less than regressionLength")
  }
  
  start_index <- max(1, n - regressionLength + regressionOffset)
  end_index <- min(n, n - regressionOffset)
  
  source_subset <- regressionSource[start_index:end_index]
  
  index_values <- 1:length(source_subset)
  
  mean_index <- sum(index_values) / length(index_values)
  mean_source <- sum(source_subset) / length(source_subset)
  
  numerator <- sum((index_values - mean_index) *
                     (source_subset - mean_source))
  
  denominator <- sum((index_values - mean_index)^2)
  
  slope <- numerator / denominator
  
  intercept <- mean_source - slope * mean_index
  
  predicted_values <- slope * index_values + intercept
  
  result <- list(
    slope = slope,
    intercept = intercept,
    predicted_values = predicted_values
  )
  
  return(result)
}