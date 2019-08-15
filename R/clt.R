library(mosaic)

sample_size = 50000
NMC = 10000

## A binomial distribution
P = 0.2

# expected value of x_bar_N
mu = P
sig2 = P*(1-P)/sample_size

out = do(NMC)*{
	# take a sample
	my_sample = rbinom(sample_size, 1, P)
	  
	# Calculate the z score
	xbar = mean(my_sample)
	se_xbar = sqrt(sig2)	
	
	z = (xbar - mu)/se_xbar
	z
}

hist(out$result, 150, prob=TRUE)

# compare the CDFs
plot(ecdf(out$result))
curve(pnorm(x), add=TRUE, col='red')

###
## A very skewed distribution: Gamma(2, 0.1)
###


# first visualize the distribution
x = rgamma(100000, shape=2, rate = 0.1)
hist(x, 100)
mu = 2/0.1
mean(x)


sample_size = 150
NMC = 10000

out = do(NMC)*{
	# take a sample
	my_sample = rgamma(sample_size, 2, 1/10)
	
	# Calculate the z score
	xbar = mean(my_sample)
	sigmahat = sd(my_sample)
	se_xbar = sigmahat/sqrt(sample_size)
	
	z = (xbar - mu)/se_xbar
	z
}

  # Look at the sampling distribution
  hist(out$result, 100, prob=TRUE)
  curve(dnorm(x), add=TRUE, col='blue', lwd=2)

# compare the CDFs
plot(ecdf(out$result))
curve(pnorm(x), add=TRUE, col='red', 10001)

