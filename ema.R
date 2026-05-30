ema <- function(data, period) {
  if (length(data) < period) {
    stop("Data length should be greater than or equal to the period")
  }
  
  multiplier <- 2 / (period + 1)
  ema_values <- numeric(length(data))
  
  ema_values[1] <- data[1]
  
  for (i in 2:length(data)) {
    ema_values[i] <- (data[i] - ema_values[i - 1]) * multiplier + ema_values[i - 1]
  }
  
  return(ema_values)
}