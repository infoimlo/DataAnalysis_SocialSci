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

# t-test to test null hypothesis Beta 1 = 0 

# Question 10 - 11 : find mean of black
t.test(rrace$black, mu = 0,  conf.level = 0.99 )

# Question 12: run model - total experience as explanatory variables of the wage- and find Rsquared
# value of R-Squared in this case will be Multiple R-squared:  0.267
yrexper_wage = lm(formula = lwage ~ yrs_school + ttl_exp, data = mydata)
summary(yrexper_wage)

# Question 15 - estimate restricted model
# I used this formula to generate the restricted model: I(yrs_school + 2*ttl_exp)

restrict <- lm(formula = lwage ~ I(yrs_school + 2*ttl_exp), data = mydata)
summary(restrict)

# Question 16 - use anova to calculate test - for the yrexper_wage calculated in Q12 
anova_unrest <- anova(yrexper_wage)
anova_unrest
