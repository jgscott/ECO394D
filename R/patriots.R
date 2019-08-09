# In a 25-game stretch of the 2014-15 NFL seasons,
# the New England Patriots won 19 coin tosses, for a
# winning percentage of 76%. The Patriots have a
# reputation for ethical lapses. Could they have cheated
# at the coin toss, too?
library(mosaic)

# What does a random set of 25 coin flips look like?
# Answer: like a binomial distribution!

# This simulates the number of heads we'd get
# in a single set of 25 fair coin flips
rbinom(1, size=25, prob=0.5)

# repeat the simulation 25 times
rbinom(25, size=25, prob=0.5)

# repeat 10000 times and store in a vector
sim_flips = rbinom(10000, size=25, prob=0.5)

# Visualize the distribution
hist(sim_flips)

# How many are 19 or larger?
sum(sim_flips >= 19)
sum(sim_flips >= 19)/10000

# What is the actual probability under the binomial distribution?
# P(X >= 19) = 1 - P(X <= 18)
pbinom(18, 25, 0.5)
1 - pbinom(18, 25, 0.5)

# or equivalently:  
pbinom(18, 25, 0.5, lower.tail=FALSE)
sum(dbinom(19:25, 25, 0.5))
