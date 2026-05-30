stoch_rsi <- function(data, period, k_period, d_period) {
  rsi_values <- rsi(data, period)
  
  valid_rsi <- rsi_values[!is.na(rsi_values)]
  
  min_rsi <- min(valid_rsi)
  max_rsi <- max(valid_rsi)
  
  stoch_values <- rep(NA, length(rsi_values))
  
  for (i in 1:length(rsi_values)) {
    if (!is.na(rsi_values[i])) {
      stoch_values[i] <- (rsi_values[i] - min_rsi) / (max_rsi - min_rsi)
    }
  }
  
  k_line <- sma(stoch_values[!is.na(stoch_values)], k_period)
  d_line <- sma(k_line, d_period)
  
  result <- list(
    k_line = k_line,
    d_line = d_line
  )
  
  return(result)
}