library(mosaic)

predimed = read.csv('../data/predimed.csv')

# Cross tabulate participants by group and event status
# "Event = Yes" means some cardiac event 
xtabs(~group + event, data=predimed)

n = 2097+85
x = 85
p_hat = x/n


# Parametric bootstrap:
# 1) Repeatedly simulate data under the assumed
#	 parametric model, using fitted parameter.
# 2) For each simulated data set, refit the model.
# 3) Approximate the sampling distribution using the
#	histogram of fitted parameters.

boot1 = do(1000)*{
	
	# 1) simulate data under the fitted parameter
	# (versus ordinary bootstrap:
	#	resample data with replacement)
	x_sim = rbinom(1, n, p_hat)
	
	# 2) Re-estimate the parameter using the simulated data
	p_hat_sim = x_sim/n
	
	# Return p_hat_sim
	p_hat_sim
}

# 3) Inspect the sampling distribution
hist(boot1$result)

# Bootstrapped estimate of standard error
sd(boot1$result)


# bootstrap confidence interval
confint(boot1)

