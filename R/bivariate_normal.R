library(mosaic)
library(mvtnorm)  # need to install this the first time you use it

# Import code for bivariate normal
# Put this line at the top of any script where you need to simulate
# from a bivariate normal distribution.
source("http://jgscott.github.io/teaching/r/mvnorm/rbvnorm.R")

# Modeling a risky asset with a positive expected return
mu1 = 0.065
mu2 = 0.015
sigma1 = 0.2
sigma2 = 0.1
rho = -0.9

# 1000 samples from this bivariate normal
returns = rbvnorm(1000, mu1, mu2, sigma1, sigma2, rho)
plot(returns)

rbvnorm(1, mu1, mu2, sigma1, sigma2, rho)

# the marginal distributions
hist(returns[,1])
hist(returns[,2])

# Means and sample standard deviations; sample correlation
colMeans(returns)
apply(returns, 2, sd)
cor(returns)
