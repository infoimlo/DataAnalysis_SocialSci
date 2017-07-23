# Preliminaries
#-------------------------------------------------
install.packages('perm')
library(perm)
rm(list = ls())
getwd() #get working directory - figure out what directory working out of 
setwd("C:/Users/loret/Desktop/DataSciencePrep/Data_Analysis_for_Social_Scientists/DataAnalysis_SocialSci/HWK_7")


# Questions 1 - 4
#-------------------------------------------------

#*change information here for students
perms <- chooseMatrix(8,4)  # is it chooseMatrix(8, 4)

A <- matrix(c(0.462, 0.731, 0.571, 0.923, 0.333, 0.750, 0.893, 0.692), nrow=8, ncol=1, byrow=TRUE)
A
treatment_avg <- (1/4)*perms%*%A
treatment_avg
control_avg <- (1/4)*(1-perms)%*%A
control_avg
test_statistic <- abs(treatment_avg-control_avg)
# For question 3 
# test_statistic comes out as an 8 row, 1 col matrix with p-values (I believe)
#Try running Fisher's exact test here:
test_statistic


rownumber <- apply(apply(perms, 1, 
                         function(x) (x == c(0, 1, 0, 0, 0, 1, 1, 1))), 
                   2, sum)
rownumber <- (rownumber == 8)
observed_test <- test_statistic[rownumber == TRUE]
observed_test
#*change information here for students
larger_than_observed <- (test_statistic >= observed_test)
#numbers in which the statistic exceeds the value in the observed date
sum(larger_than_observed)   # got 16!! Wooo! Right answer for question 3
df <- data.frame(perms,control_avg,treatment_avg,test_statistic)
df  #get a massive matrix - looks accurate 

# Goal - calculate the Fisher's exact p-value
# Under the assumption that we will have the same 
# number of treated and control units
fisher.test(rownumber, larger_than_observed, workspace = df, hybrid = FALSE,
            control = list(), or = 1, alternative = "two.sided",
            conf.int = TRUE, conf.level = 0.95,
            simulate.p.value = FALSE, B = 2000)
# Question 5 - 6
#-------------------------------------------------
simul_stat <- as.vector(NULL)
schools <- read.csv('teachers_final.csv')
set.seed(1001)
for(i in 1:100) {
  print(i)
  schools$rand <- runif(100,min=0,max=1)
  schools$treatment_rand <- as.numeric(rank(schools$rand)<=49)
  schools$control_rand = 1-schools$treatment_rand
  simul_stat <-append(simul_stat,
            sum(schools$treatment_rand*schools$open)/sum(schools$treatment_rand) 
            - sum(schools$control_rand*schools$open)/sum(schools$control_rand))
}

schools$control = 1-schools$treatment
actual_stat <- sum(schools$treatment*schools$open)/sum(schools$treatment) - sum(schools$control*schools$open)/sum(schools$control)
sum(abs(simul_stat) >= actual_stat)/NROW(simul_stat)

#Question 7 - 8
#---------------------------------------------------
#Printing the ATE
ate <- actual_stat
ate

control_mean <- sum(schools$control*schools$open)/sum(schools$control)
treatment_mean <- sum(schools$treatment*schools$open)/sum(schools$treatment)

s_c <- (1/(sum(schools$control)-1))*sum(((schools$open-control_mean)*schools$control)^2)
s_t <- (1/(sum(schools$treatment)-1))*sum(((schools$open-treatment_mean)*schools$treatment)^2)

Vneyman <- (s_c/sum(schools$control) + s_t/sum(schools$treatment))
print(sqrt(Vneyman))
print(actual_stat/sqrt(Vneyman))

print(actual_stat-1.96*sqrt(Vneyman))
print(actual_stat+1.96*sqrt(Vneyman))
