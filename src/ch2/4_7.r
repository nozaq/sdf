niter = 1e5

set.seed(2009)
profit = rep(0, niter)
for (i in 1:niter) {
  r = rnorm(100, mean=.05/253, sd=.23/sqrt(53))
  logPrice = log(1e6) + cumsum(r)
  
  for (j in logPrice) {
    if (logPrice[j] >= log(11e5)) {
      profit[i] = exp(logPrice[j]) - 1e6
      break
    } else if (logPrice[j] < 95e4) {
      profit[i] = exp(logPrice[j]) - 1e6
      break
    }
  }
  
  if (profit[i] == 0) {
    profit[i] = exp(logPrice[length(logPrice)]) - 1e6
  }
}

# Problem4
sol4 = mean(as.numeric(profit >= 1e5))

# Problem5
sol5 = mean(as.numeric(profit < 0))

# Problem6
sol6 = mean(profit)

# Problem7
sol7 = mean(profit) / 5e4 
