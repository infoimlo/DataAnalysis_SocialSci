#Homework 4 
# Set Values
#q <- 100
x <- 0
p <- 0.1
m <- 100
n <- 6
k <- 32
qhyper(p, m, n, k, lower.tail=TRUE,log.p = FALSE)
dhyper(x, m, n, k, log = FALSE)
phyper(q, m, n, k, lower.tail = TRUE, log.p = FALSE)


#Poisson Random Variables - Distribution
lamda <- 4
rpois(15, 4)

V <- rpois(100, 0.7)
barplot(table(V))
mean(V)

A <- rpois(2, 0.99)
barplot(table(A))
plot(A)

#Poission Distribution
x <- 2
lamda <- 0.99
dpois(x, lambda, log = FALSE)
dpois(x, lambda = 0.99, log = FALSE)

n <- 2
lamda <- 0.99
rpois(n, lamda)
