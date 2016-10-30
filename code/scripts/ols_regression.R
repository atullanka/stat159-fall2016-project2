load("../../data/train_test.RData")
scaled_data <- read.csv("../../data/scaled-credit.csv")[, -1]
# Fit OLS model:
ols_model <- lm(Balance ~ .,data = scaled_data)
OLS_summary <-summary(ols_model)
sink('../../data/ols_regression_output.txt')
cat('OLS model summary \n')
OLS_summary
sink()

save(OLS_summary, file='../../data/OLS_regression.RData')
