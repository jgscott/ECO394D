library(mosaic)

# use Import Dataset to read in "annual_returns_since1928.csv"

# Data on annual returns of stocks, bonds, and savings account
annual_returns = read.csv("../data/annual_returns_since1928.csv")

# first few lines
head(annual_returns)

# Shape of distribution of returns, net of inflation?
hist(annual_returns$SP500 - annual_returns$Inflation)

# Mean and standard deviation of net returns for stocks
mean(annual_returns$SP500 - annual_returns$Inflation)
sd(annual_returns$SP500 - annual_returns$Inflation)

# Modeling a risky asset with a positive expected return
mu = mean(annual_returns$SP500 - annual_returns$Inflation)
sigma = sd(annual_returns$SP500 - annual_returns$Inflation)
Horizon = 40

Wealth = 10000  # Initial wealth
WealthTracker = rep(0, Horizon)  # Placeholder
# Sweep through each year and update the value of wealth
for(i in 1:Horizon) {
  ThisReturn = rnorm(1, mu, sigma)  # simulate a random return
  Wealth = Wealth * (1 + ThisReturn) # update wealth recursively
  WealthTracker[i] = Wealth # save the result
}
Wealth  # final value of wealth
plot(WealthTracker, type='l')  # wealth over time


# Now a Monte Carlo simulation
InitialWealth = 10000
sim1 = do(1000)*{
  Wealth = InitialWealth  # Reset initial wealth
  WealthTracker = rep(0, Horizon)  # Placeholder
  # Sweep through each year and update the value of wealth
  for(i in 1:Horizon) {
    ThisReturn = rnorm(1, mu, sigma)
    Wealth = Wealth * (1 + ThisReturn)
    WealthTracker[i] = Wealth
  }
  WealthTracker
}
head(sim1)

# calculate some summary statistics
summary(sim1$V40)



# Plot a few simulated scenarios
plot(1:Horizon, sim1[1,], type='l')
lines(1:Horizon, sim1[2,], type='l')
lines(1:Horizon, sim1[3,], type='l')


# A cool (more advanced) plot to show variability over time

plot(1:Horizon, colMeans(sim1), type='l', col='red',
	xlab="Years into future",
	ylab="Value of portfolio",
	main="Simulated growth of a stock portfolio over 40 years",
	las=1, cex.axis = 0.85,
	ylim=c(10000, 2*max(colMeans(sim1))))
	
for(sim in 1:50) {
  lines(1:Horizon, sim1[sim,], type='l', col=rgb(0.5,0.5,0.5,0.25))
}
lines(1:Horizon, colMeans(sim1), lwd=3, col='red')
# legend('topleft',
# 	legend=c("Average trajectory", "All simulations", "Example trajectories"),
# 	lwd=1, col=c("red", "grey", "blue"))
lines(1:Horizon, sim1[1,], col='blue')
lines(1:Horizon, sim1[2,], col='blue')



