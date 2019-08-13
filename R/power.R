library(mosaic)

#  Suppose X ~ Binom(N, P)
#  Calculating the power function for testing H0: P = 0.5

# Need to choose a rejection region.
# Let's pick: R = {X >= 17}

### Part 1: simple null hypothesis
# Make an assumption about the true P

N = 25
assumed_P = 0.9
out = do(10000)*{
	x_sim = rbinom(1, N, assumed_P)
	x_sim >= 17
}
mean(out$result)




### Part 2: composite alternative hypothesis
# now we need a power curve

# try for a range of different assumed values for P
P_grid = seq(0, 1, length=41)
power_grid = rep(0, length(P_grid))

for(i in seq_along(P_grid)) {
	assumed_P = P_grid[i]
	cat("Assumed P = ", assumed_P, "\n")
	out = do(5000)*{
		x_sim = rbinom(1, 25, assumed_P)
		x_sim >= 17
	}
	power_grid[i] = mean(out$result)
}

plot(P_grid, power_grid)
