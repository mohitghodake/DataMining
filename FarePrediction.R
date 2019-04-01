library(dplyr)
library(plotly)
library(caret)
library(ggplot2)

#Reading the CSV file
df <- read.csv("Airline Data.csv")

#Removing Columns that are not needed
df$S_CODE = NULL
df$S_CITY = NULL
df$E_CODE = NULL
df$E_CITY = NULL

#Formatting the Columns
df$FARE <- as.numeric(sub('$', '', as.character(df$FARE), fixed = TRUE))
df$S_INCOME <- sub(',', '', as.character(df$S_INCOME), fixed=TRUE)
df$S_INCOME <- as.numeric(sub('$', '', as.character(df$S_INCOME), fixed = TRUE))
df$E_INCOME <- sub(',', '',as.character(df$E_INCOME), fixed=TRUE)
df$E_INCOME <- as.numeric(sub('$', '', as.character(df$E_INCOME), fixed = TRUE))

#Multivariable Regression
fit <- lm(FARE ~ ., data = df)
summary(fit)
plot(fit)

#Exploratory Analysis
pairs(FARE ~ ., data = df, main = "Scatterplots")
