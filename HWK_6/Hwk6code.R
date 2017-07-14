#preliminaries
rm(list = ls())
setwd("/Users/raz/Dropbox/14.31 edX Building the Course/Problem Sets/PSET 7")
#Figure out values of XXX, YYY, ZZZ 

#Real value of theta
theta <- 5
#sample size
n <- 25

#Generating 1000 samples of size n - original
simul <- 1000
sample <- matrix(runif(1000*n, max = XXX), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, YYY, max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll ZZZ theta<=ul)
mean(thetain)


#Generating 1000 samples of size n - Option A 
# Result -> mean(thetain) = 1
theta <- 5
#sample size
n <- 25
#Generating 1000 samples of size n - original
simul <- 1000
sample <- matrix(runif(1000*n, max = n), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, 2 , max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll | theta<=ul)
mean(thetain)


# Option B -> mean = 0.04; 2nd: 0.2; 3rd: 0.16; 4th: 0.12; 5th: 0.2; 6th: 0.08
theta <- 5
#sample size
n <- 25
#Generating 1000 samples of size n - original
simul <- 1000
sample <- matrix(runif(1000*n, max = theta), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, 1, max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll & theta<=ul)
mean(thetain)


# Option C -> mean = 0.912; 0.919; 0.903
#Real value of theta
theta <- 5
#sample size
n <- 25

#Generating 1000 samples of size n - original
simul <- 1000
sample <- matrix(runif(1000*n, max = theta), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, 2 , max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll &  theta<=ul)
mean(thetain)



# Option C -> mean = 0.912; 0.919; 0.903
#Real value of theta
theta <- 5
#sample size
n <- 25

#Generating 1000 samples of size n - original
simul <- 1000
sample <- matrix(runif(1000*n, max = theta), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, 2 , max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll &  theta<=ul)
mean(thetain)

# Option D -> mean(thetain)
#Real value of theta
theta <- 5
#sample size
n <- 25

#Generating 1000 samples of size n - original
simul <- 1000
sample <- matrix(runif(1000*n, max = n), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, YY2Y, max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll &  theta<=ul)
mean(thetain)




#Real value of theta
theta <- 5
#sample size
n <- 25

# Option E
#Result: 1 
simul <- 1000
sample <- matrix(runif(1000*n, max = theta), 
                 nrow = n)

thetahat <- (n+1)/n*apply(sample, 1 , max)

ll <- thetahat/(0.95^(1/n)*(n+1)/n)
ul <- thetahat/(0.05^(1/n)*(n+1)/n)
thetain <- (theta>=ll | theta<=ul)
mean(thetain)


