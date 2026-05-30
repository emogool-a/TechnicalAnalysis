rsi <- function(data, period) {
  if (length(data) <= period) {
    stop("Data length must be greater than the period")
  }
  
  differences <- diff(data)
  
  gains <- numeric(length(differences))
  losses <- numeric(length(differences))
  
  for (i in 1:length(differences)) {
    if (differences[i] > 0) {
      gains[i] <- differences[i]
      losses[i] <- 0
    } else {
      gains[i] <- 0
      losses[i] <- abs(differences[i])
    }
  }
  
  avg_gain <- sum(gains[1:period]) / period
  avg_loss <- sum(losses[1:period]) / period
  
  rsi_values <- rep(NA, length(data))
  
  for (i in (period + 1):length(data)) {
    avg_gain <- ((avg_gain * (period - 1)) + gains[i - 1]) / period
    avg_loss <- ((avg_loss * (period - 1)) + losses[i - 1]) / period
    
    if (avg_loss == 0) {
      rsi_values[i] <- 100
    } else {
      rs <- avg_gain / avg_loss
      rsi_values[i] <- 100 - (100 / (1 + rs))
    }
  }
  
  return(rsi_values)
}