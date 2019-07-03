# Example 1: binomial for airline no shows

# Parameters
P = 0.09
N = 140

# Create a grid of x's
x_grid = seq(0, 30, by=1)

# Probability mass function of binomial
dbinom(x_grid, N, P)

barplot(dbinom(x_grid, N, P), names.arg = x_grid,
	xlab='Number of no shows',
	ylab='Probability')

# Left tail area
sum(dbinom(0:5, N, P))
pbinom(5, size=N, prob=P)


# Example 2: Poisson for soccer scores

x_grid = 0:7

dpois(x_grid, 1.6)

barplot(dpois(x_grid, 1.6), names.arg = x_grid,
	cex.names=1.1, las=1, ylim=c(0,0.35),
	xlab='Goals',
	ylab='Probability', main="Arsenal: Poisson(1.6)")

barplot(dpois(x_grid, 1.3), names.arg = x_grid,
	cex.names=1.1, las=1, ylim=c(0,0.35),
	xlab='Goals',
	ylab='Probability', main="Man U: Poisson(1.3)")
	

# Simulate lots of games according to these Poissons
NMC = 100000
arsenal = rpois(NMC, 1.6)
ManU = rpois(NMC, 1.3)

# Compile the results
xtabs(~arsenal + ManU)
results_table = xtabs(~arsenal + ManU)/NMC
results_table

# Monte Carlo estimates of probabilities
sum(arsenal > ManU)/NMC
sum(arsenal == ManU)/NMC
sum(arsenal < ManU)/NMC

# Compare with a calculation from the PMF assuming independence

dpois(1, 1.6) * dpois(1, 1.3) # Arsenal 1 - 1 ManU
dpois(2, 1.6) * dpois(0, 1.3) # Arsenal 2 - 0 ManU

# A cool figure for those who want to geek out with R graphics
my_cols = grey(seq(1, 0.5, length=15))
my_breaks = seq(0, 0.12, length=16)
image(0:5, 0:5, results_table,
	xlim=c(-0.5, 5.5), 
	ylim=c(-0.5, 5.5),
	col=my_cols, breaks=my_breaks,
	las=1, bty='n',
	main="Probability of outcomes for the \nArsenal vs. Manchester United match",
	ylab='Manchester United goals',
	xlab="Arsenal goals")
	
abline(h=-0.5 + 0:6, lty='dotted')
abline(v=-0.5 + 0:6, lty='dotted')
for(i in 1:6) {
	for(j in 1:6) {
		text(i-1, j-1, results_table[i,j])
		if(i > j) {
			rect(i-1.5,j-1.5,i-0.5, j-0.5, border='blue', lwd=2) 
		}
	}
}
