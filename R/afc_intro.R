library(mosaic)
library(tidyverse)

# read in data
afc = read.csv('../data/afc.csv')

# simple scatter plot
plot(Price ~ FoodScore, data = afc)

# fit a linear model for price versus food score
lm1 = lm(Price ~ FoodScore, data = afc)

# look at the coefficients
coef(lm1)

# make prediction on new data
new_data = data.frame(FoodScore = 7.5)
predict(lm1, new_data)


# look at the residuals (actual - predicted)
resid(lm1)

# who has the smallest residual? pipe to which.min
resid(lm1) %>% which.min

# the 3rd row, which is...
afc[3,]
