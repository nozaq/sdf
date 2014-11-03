niter = 1e5

set.seed(2009)
below = rep(0, niter)
for (i in 1:niter) {
  r = rnorm(45, mean=.05/253, sd=.23/sqrt(53))
  logPrice = log(1e6) + cumsum(r)
  minLogPrice = min(logPrice)
  below[i] = as.numeric(minLogPrice < log(95e4))  
}

# Problem3
sol3 = mean(below)
