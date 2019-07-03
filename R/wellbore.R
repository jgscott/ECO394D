# well bores example
# X ~ Uniform(0.7, 1.3)
# Y = pi/4 X^2

# check by simulation
y_min = pi/4 * 0.7^2
y_max = pi/4 * 1.3^2

n_samples = 100000
X = runif(n_samples, 0.7, 1.3)
Y = (pi/4)* X^2

hist(Y, breaks=seq(y_min, y_max, length=50), prob=TRUE)
curve(x^{-1/2} * {1/sqrt(pi)} * 1/(1.3-0.7), add=TRUE, col='red')
