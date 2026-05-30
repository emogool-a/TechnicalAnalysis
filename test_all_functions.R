# Set working directory to A05 folder
setwd("~/Desktop/A05")

# Load all function files
source("sma.R")
source("ema.R")
source("macd.R")
source("stdev.R")
source("linreg.R")
source("rsi.R")
source("stoch_rsi.R")
source("crossover.R")
source("crossunder.R")

# Sample data
data <- c(10, 12, 15, 20, 18, 22, 25, 24, 21, 26, 28, 30, 29, 31, 35)

arr1 <- c(10, 12, 15, 20, 18, 22, 25, 24, 21)
arr2 <- c(18, 20, 22, 18, 15, 12, 10, 11, 13)

# Test all functions
print("SMA Result:")
print(sma(data, 3))

print("EMA Result:")
print(ema(data, 3))

print("MACD Result:")
print(macd(data, 3, 5, 2))

print("Standard Deviation Result:")
print(stdev(data))


print("Linear Regression Result:")
print(linreg(data, 5, 0))

print("RSI Result:")
print(rsi(data, 5))

print("Stochastic RSI Result:")
print(stoch_rsi(data, 5, 3, 3))

print("Crossover Result:")
print(crossover(arr1, arr2))

print("Crossunder Result:")
print(crossunder(arr1, arr2))