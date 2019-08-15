library(mosaic)

GasPrices = read.csv("../data/GasPrices.csv", header=TRUE)
head(GasPrices)

# MoM estimator for population mean and variance of the non-highway gas stations

sub1 = subset(GasPrices, Highway == 'N')
mu_hat = mean(sub1$Price)
Sx2 = mean(sub1$Price^2)
sigma2_hat = Sx2 - mu_hat^2
sqrt(sigma2_hat)

hist(sub1$Price, 20)
