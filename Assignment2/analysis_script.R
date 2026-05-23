# Load required library
library(tidyverse)

# Function to load portfolio
load_portfolio <- function(file_path) {
  symbols <- readLines(file_path)
  return(symbols)
}

# Function to calculate simple statistics
calculate_stats <- function(data) {
  mean_value <- mean(data$value)
  sd_value <- sd(data$value)
  
  result <- list(
    mean = mean_value,
    sd = sd_value
  )
  
  return(result)
}

# Create sample dataset
data <- data.frame(
  category = c("AAPL", "MSFT", "GOOGL", "AMZN", "TSLA"),
  value = c(150, 300, 2800, 3500, 700)
)

# Run functions
portfolio <- load_portfolio("portfolio.txt")
stats <- calculate_stats(data)

# Print results
print(portfolio)
print(stats)