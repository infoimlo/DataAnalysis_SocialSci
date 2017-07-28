#-------------------------------------------------
# Homework 8 

rm(list = ls())
getwd() #get working directory - figure out what directory working out of 
setwd("C:/Users/loret/Desktop/DataSciencePrep/Data_Analysis_for_Social_Scientists/DataAnalysis_SocialSci/HWK_8")

mydata <- read.csv('nlsw88.csv', header = TRUE, row.names = NULL )
mydata

# Estimate equation by OLS
results = lm(formula = lwage ~ yrs_school, data = mydata)
summary(results)

# print 90% confidence interval for beta1 
confint(results, 'yrs_school', level = 0.90)

# caluculate residuals
res <- residuals(results)
res

# Estimate liner model using OLS for when log(wagei) = beta not + beta1*black + epsiloni
rrace = lm(formula = lwage ~ black, data = mydata)
summary(rrace)
