# This script will run a ridge regression

# Load necessary libraries and variables
library (glmnet)
# Load my train and testing data set
load("data/train_test.RData")
# Load scaled-credit data
scaled_credit <- read.csv("data/scaled-credit.csv")
scaled_credit$X <- NULL

set.seed (12345)

# Now begin ridge regression method

# Only doing balance variable for now

# Create an x and y for glmnet() to input
x <- as.matrix(train_set[, -12]) 
y <- as.double(train_set$Balance)

# Ridge regression utilizes a variable lambda which can vary in size, so we make a vector modeling this
grid <- 10^seq(10, -2, length = 100)


# Create ridge object using glmnet and grid for lambda arguemnet
# Alpha =0 ensures that ridge is used
cv_ridge_models <- cv.glmnet (x,y,alpha =0, lambda = grid, standardize = FALSE, intercept = FALSE)

# Save the output for lambda
lambda_min_ridge <- cv_ridge_models$lambda.min
ridge_coef <- coef(cv_ridge_models, s = lambda_min_ridge)

# Plot cv.glmnet output
png("images/ridge_plots.png")
plot(cv_ridge_models)
dev.off()

# Calculate MSE
ridge_matrix_test <- as.matrix(test_set[ ,-12])
ridge_predit <- predict(cv_ridge_models,ridge_matrix_test, s = lambda_min_ridge)
ridge_MSE <- mean((ridge_preditct - test_set$Balance)^2)

# Re-Fit the Model on the Full Data Set and use best lambda from above
full_credit <- as.matrix(scaled_credit[ ,-12])
ridge_fit <- glmnet(x = full_credit, y = scaled_credit$Balance, lambda = lambda_min_ridge,
                    intercept = FALSE, standardize = FALSE, alpha = 0)
ridge_coef_full <- coef(ridge_fit, s = lambda_min_ridge)

# Save Data and Generate an informative Output in txt file
save(lambda_min_ridge, cv_ridge_models, ridge_MSE, ridge_coef_full,file = 'data/ridge-regression.RData')


sink('data/ridge-regression-output.txt')
cat('Output of Ridge Regression with 10-fold CV on the Full Data Set\n')
print(ridge_fit)
cat('\nMinimum Lambda\n')
print(lambda_min_ridge)
cat('\nRidge MSE of Test Data Set\n')
print(ridge_MSE)
cat('\nCoefficients of using Ridge Regression Model on Full Data Set\n')
print(ridge_coef_full)
sink()


#TODO:
# Create a vector of lables aka the predictors to be used in the regression analaysis
#y <- as.double(train_set$train_set[0,2:12 ]) 
#Create tables with predictors and best lambdas and MSE, etc




