library(mosaic)
library(tidyverse)

predimed = read.csv('../data/predimed.csv')


###
# Example 1: standard error of the sample mean
###

# calculate sample means, sample sizes, and sample std devs
predimed %>% group_by(group) %>%
	summarize(bmi_mean = mean(bmi), sample_size = n(), std_dev = sd(bmi))

# form the plug-in standard error for mean BMI in control group
se_hat_control = 3.96/sqrt(2042)

# compare it with a bootstrap estimate of the standard error
boot1 = do(1000)*{
	#	resample data with replacement
	predimed_boot = resample(predimed)
	
	# Re-estimate the parameter using the re-sampled data
	mu_hat = mean(bmi ~ group, data= predimed_boot)
	
	# save the result
	mu_hat
}

head(boot1)

# Bootstrapped estimate of standard error
sd(boot1$Control)

# very close to the plug-in standard error
se_hat_control


###
# Example 2: standard error of a difference in proportions  
###

xtabs(~group, data=predimed)

xtabs(~event + group, data=predimed)

xtabs(~event + group, data=predimed) %>%
	prop.table(margin=2)

