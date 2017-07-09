#Preliminaries
#---------------------------------------------------------
# pnorm(x) takes in a value x and returns the CDF of a normal distribution at x
pnorm(qnorm(2.1,lower.tail = TRUE))
#qnorm(x) gives the value at which the CDF of the standard normal is x
qnorm(pnorm(0.75,lower.tail = TRUE),lower.tail = TRUE)
