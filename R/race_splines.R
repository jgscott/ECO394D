library(splines)
library(mosaic)
librar(tidyverse)
data(TenMileRace)

head(TenMileRace)

# order the data set by age
TenMileRace = TenMileRace %>% arrange(age)

# plot
ggplot(TenMileRace) + 
  geom_point(aes(x=age, y = net)) 

# choose knot locations: 25th, 50th and 7th percentiles of age
my_knots = quantile(TenMileRace$age, prob=c(0.25,0.5,0.75))

# piecewise quadratic (degree=2) with knots at the specified locations
# note: bs stands for "b-splines"
spline_model = lm(net ~ splines::bs(age, degree=2, knots=my_knots), data=TenMileRace)

# add the predicted/fitted values to the data frame
TenMileRace$net_predicted = fitted(spline_model)

# plot the fitted values
ggplot(TenMileRace) + 
  geom_point(aes(x=age, y = net)) + 
  geom_line((aes(x=age, y=net_predicted)), color='red', size=3) + 
  geom_vline(xintercept=my_knots, color='blue')
  
