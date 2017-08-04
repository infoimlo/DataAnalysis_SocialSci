# remove all vectors of character strings 
rm(list = ls())

# set working directory
setwd("C:/Users/loret/Desktop/DataSciencePrep/Data_Analysis_for_Social_Scientists/DataAnalysis_SocialSci/HWK_9")

# read my data as CSV file
mydata <- read.csv('fastfood.csv', header = TRUE, row.names = NULL)
mydata

# Estimate equation by OLS
fullemploymentante = lm(formula = empft ~ state, data = mydata)
summary(fullemploymentante)
