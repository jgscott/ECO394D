library(mosaic)

ebola = read.csv("../data/ebola.csv", header=TRUE)
head(ebola)

# total suspected cases over time
plot(totalSus ~ Day, data=ebola)
plot(log(totalSus) ~ Day, data=ebola)

# linear model for log(cases) versus time
lm1 = lm(log(totalSus) ~ Day, data=ebola)

plot(log(totalSus) ~ Day, data=ebola)
abline(lm1, col='red')

# plot on the original scale
alpha = exp(coef(lm1)[1])
rate = coef(lm1)[2]
        
plot(totalSus ~ Day, data=ebola)
curve(alpha*exp(rate*x), add=TRUE, col='red')

