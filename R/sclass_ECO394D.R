library(mosaic)

# Use "Import Dataset > From Text (Base)
# or change to the correct path on your computer
sclass = read.csv('../data/sclass.csv')

# Reminder of the variables involved
summary(sclass)

# Here's are several examples of interesting multivariate plots
# No doubt you found other interesting ones, too!

# Price versus mileage stratified by condition
xyplot(price ~ mileage | condition, data=sclass)

# On a log scale
xyplot(log(price) ~ mileage | condition, data=sclass)


# price versus mileage stratified by year
xyplot(price ~ mileage | factor(year), data=sclass)

# price versus condition stratified by region of the country
bwplot(price ~ condition | region, data=sclass)

# by trim
xyplot(price ~ mileage | trim, data=sclass)
