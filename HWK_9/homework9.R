# remove all vectors of character strings 
rm(list = ls())

# set working directory
setwd("C:/Users/loret/Desktop/DataSciencePrep/Data_Analysis_for_Social_Scientists/DataAnalysis_SocialSci/HWK_9")

# read my data as CSV file
fastfood <- read.csv('fastfood.csv', header = TRUE, row.names = NULL)
fastfood

# Estimate equation by OLS (Q1 - Q3)

# Model 1 - alfa is answer to question 1
#average difference between fast-food restaurants located in NJ and Pennsylvania 
#in terms of the number of full-time employees (before the change in minimum wage)
fullemploymentante = lm(formula = empft ~ state, data = fastfood)
summary(fullemploymentante)

# Model 2 - same as M1 but for part-time employees (before mwage change)
ptemploymentante <- lm(emppt ~ state, data = fastfood)
summary(ptemploymentante)

# Model 3 - starting wages for NJ & PA : state = 1 if NJ; state = 0 if PA 
#- alfa is answer to avg wage in PA prior to change
# alpa + beta = answer for Q4
swage <- lm(wage_st ~ state, data = fastfood)
summary(swage)
