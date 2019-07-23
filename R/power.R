library(mosaic)

#  Suppose X ~ Binom(N, P)
#  Calculating the power function for testing H0: P = 0.5

# Need to choose a rejection region.
# Let's pick: R = {X <= 5 U X >= 20}

# Make an assumption about the true P
assumed_P = 0.65
out = do(10000)*{
	x_sim = rbinom(1, 25, assumed_P)
	(x_sim <= 8) || (x_sim >= 17)
}
mean(out$result)


# Now try for a range of different assumed values
P_grid = seq(0, 1, length=41)
power_grid = rep(0, length(P_grid))

for(i in seq_along(P_grid)) {
	assumed_P = P_grid[i]
	cat("Assumed P = ", assumed_P, "\n")
	out = do(5000)*{
		x_sim = rbinom(1, 25, assumed_P)
		(x_sim >= 17) || (x_sim <= 8)
	}
	power_grid[i] = mean(out$result)
}

plot(P_grid, power_grid)


