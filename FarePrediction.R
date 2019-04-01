library(dplyr)
library(plotly)
library(caret)
library(ggplot2)

#Reading the CSV file
df <- read.csv("Airline Data.csv")

#Multivariable Regression
fit <- lm(FARE ~ VACATION + SW + GATE + SLOT, data = df)
summary(fit)
plot(fit)

#Exploratory Analysis
pairs()