png("uniformPDF.png", height=350, width=700)

par(mfrow=c(1,2))

curve(dunif(x, 0, 2), n=1000, from=-0.5, to=2.5,
      las=1, ylim=c(0, 0.6), ylab="f(x)", main="PDF")

curve(punif(x, 0, 2), n=1000, from=-0.5, to=2.5,
      las=1, ylim=c(0, 1.25), ylab="F(x)", main="CDF")

dev.off()



png("exponentialPDF.png", height=300, width=750)

par(mfrow=c(1,3))

curve(dexp(x, 1/2), n=1000, from=0, to=10, ylim=c(0, 2),
      cex.main=2, cex.axis=2,
      las=1, ylab="", main=expression(lambda==1/2))


curve(dexp(x, 1), n=1000, from=0, to=5, ylim=c(0, 2),
      cex.main=2, cex.axis=2,
      las=1, ylab="", main=expression(lambda==1))

curve(dexp(x, 2), n=1000, from=0, to=5, ylim=c(0, 2),
      cex.main=2, cex.axis=2,
      las=1, ylab="", main=expression(lambda==2))

dev.off()





png("exponentialCDF.png", height=400, width=750)

par(mfrow=c(1,2))

curve(pexp(x, 1), n=1000, from=0, to=6, ylim=c(0, 1),
      las=1, ylab="", main="CDF of Exponential(1)")


curve(qexp(x, 1), n=1000, from=0, to=1, ylim=c(0, 6),
      las=1, ylab="", xlab='q', main="Inverse CDF of Exponential(1)")

dev.off()
