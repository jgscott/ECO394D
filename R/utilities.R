library(tidyverse)
library(mosaic)

utilities = read.csv('../data/utilities.csv')

# Goal: predict monthly gas bill in terms of temperature

# Notice that not every month has the same number of billing days
hist(utilities$billingDays, breaks=20)

# Define a new variable
utilities$daily.average.gasbill = utilities$gasbill/utilities$billingDays

# Plot the data
plot(daily.average.gasbill ~ temp, data=utilities)


# Fit a quadratic model:
lm2 = lm(daily.average.gasbill ~ poly(temp, 2), data=utilities)

# plot the fitted model (the plotModel function is in mosaic)
plotModel(lm2)

# extrapolation isn't wild
plotModel(lm2 )+ xlim(-10, 100)

# Now go crazy! 15th-degree polynomial
lm15 = lm(daily.average.gasbill ~ poly(temp, 15), data=utilities)

# looks a bit weird if you limit to the range of the data...
# should expect a basically monotonic fit here
# so these wiggles have no sensible justification
plotModel(lm15) + ylim(range(utilities$daily.average.gasbill))

# looks horrible just a bit outside the range of the data!
plotModel(lm15)
