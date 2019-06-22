library(mosaic)

# repeat the same simulation 1000 times
Y = do(1000)*{
  x = runif(n=10, min=0, max=100)  # draw 10 uniform(0,100) scores
  y = max(x) # take the max score
}

# plot a probability histogram of the simulated results
hist(Y$result, prob=TRUE)

# superimpose the curve of our derived PDF in red
curve(10*x^9/(100^10), col='red', add=TRUE)

