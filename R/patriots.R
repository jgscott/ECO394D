# In a 25-game stretch of the 2014-15 NFL seasons,
# the New England Patriots won 19 coin tosses, for a
# winning percentage of 76%. The Patriots have a
# reputation for ethical lapses. Could they have cheated
# at the coin toss, too?

library(mosaic)

# What does a random set of 25 coin flips look like?
# Let H = "Patriots win" and assume that P(H) = 0.5
rflip(25)

# This function just counts the heads
nflip(25)

# repeat the experiment 25 times
do(25)*nflip(25)

# repeat 10000 times and store in a vector
sim_flips = do(10000)*nflip(25)
head(sim_flips)

# Visualize the distribution
hist(sim_flips$nflip, cex.axis=2)

# How many are 19 or larger?
sum(sim_flips$nflip >= 19)
sum(sim_flips$nflip >= 19)/10000

# What is the actual probability under the binomial distribution?
# P(X >= 19) = 1 - P(X <= 18)
pbinom(18, 25, 0.5)
1 - pbinom(18, 25, 0.5)

