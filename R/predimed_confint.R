library(mosaic)

predimed = read.csv('../data/predimed.csv')

# Cross tabulate participants by group and event status
# "Event = Yes" means some cardiac event 
xtabs(~group + event, data=predimed)

# A normal-based confidence interval for
# P(event) in the MedDiet + VOO group
n = 2097+85
x = 85
p_hat = x/n
se_hat = sqrt(p_hat*(1-p_hat)/n)

p_hat + c(-1.96, 1.96)*se_hat

# How trustworthy is this confidence interval?
# Can't know for sure whether the true value is in the interval.
# But can check the properties of the procedure via
# a simulation study.
p_true = 0.45
n = 15
coverage_study = do(10000)*{
	# simulate a random number of events
	x_sim = rbinom(1, n, p_true)
	
	# construct the confidence interval from the simulated data
	p_hat_sim = x_sim/n
	se_hat_sim = sqrt(p_hat_sim*(1-p_hat_sim)/n)
	interval_sim = p_hat_sim + c(-1.96, 1.96)* se_hat_sim
	
	# Check whether the true proportion is in the confidence interval
	covers = (p_true >= interval_sim[1]) & (p_true <= interval_sim[2])
	
	# Calculate squared error
	squared_error = (p_true - p_hat_sim)^2
	
	# return interval, coverage indicator, and squared error
	c(interval_sim, covers, squared_error)

}

# Check coverage
head(coverage_study)
summary(coverage_study)

# rmse
sqrt(mean(coverage_study[,4]))

# coverage plot of first 50 intervals
max_ind = 50
plot(coverage_study[1: max_ind,1], ylim=range(coverage_study[,1:2]), 
	type='n')
segments(1: max_ind, coverage_study[1: max_ind,1], y1=coverage_study[1: max_ind,2])
abline(h=p_true)

