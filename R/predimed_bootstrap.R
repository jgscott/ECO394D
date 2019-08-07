library(mosaic)
library(tidyverse)

predimed = read.csv('../data/predimed.csv')

# Cross tabulate participants by group and event status
# "Event = Yes" means some cardiac event 
xtabs(~group + event, data=predimed)

# define a meddiet variable
# collapsing across the two versions
predimed = mutate(predimed,
                  meddiet = ifelse(group == 'Control', 'No', 'Yes'))

# now cross-tab:
xtabs(~meddiet + event, data=predimed)


# or using pipes:
table1 = predimed %>%
  group_by(meddiet) %>%
  summarize(p_event = sum(event=='Yes')/n())


# now bootstrap:
boot1 = do(1000)*{
  # contruct a bootstrapped sample
  predimed_boot = resample(predimed)
  # recalculate the statistics for the bootstrapped sample
  table1_boot = predimed_boot %>%
    group_by(meddiet) %>%
    summarize(p_event = sum(event=='Yes')/n())
  # return the result of interest
  table1_boot$p_event
}


# histogram for controls
hist(boot1[,1], 20)

# histogram for med diet
hist(boot1[,2], 20)

# histogram for the difference
hist(boot1[,1]-boot1[,2], 20)


confint(boot1[,1]-boot1[,2], level=0.95)


# In-class activity:

# calculate two confidence intervals for the difference
# in proportions of events for control vs med diet:
# one for men and one for women



# Parametric bootstrap:
# 1) Repeatedly simulate data under the assumed
#	 parametric model, using fitted parameter.
# 2) For each simulated data set, refit the model.
# 3) Approximate the sampling distribution using the
#	histogram of fitted parameters.


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



