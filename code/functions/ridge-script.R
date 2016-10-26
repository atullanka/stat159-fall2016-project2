#this script will run a ridge regression

#load necessary libraries and variables
library (glmnet)
#load my train and testing data set
load("data/train_test.RData")
#load scaled-credit data
scaled_credit <- read.csv("data/scaled-credit.csv")
scaled_credit$X <- NULL

set.seed (12345)

#FIGURED OUT THINGS

#create an x and y for glmnet() to input
x <- as.matrix(train_set[, -12]) 
#create a vector of lables aka the predictors to be used in the regression analaysis
#y <- as.double(train_set$train_set[0,2:12 ]) 

y <- as.double(train_set$Balance)

#ridge regression utilizes a variable lambda which can vary in size, so we make a vector modeling this
grid <- 10^seq(10, -2, length = 100)


#create ridge object using glmnet and grid for lambda arguemnet
#alpha =0 ensures that ridge is used
cv_ridge_models <- cv.glmnet (x,y,alpha =0, lambda = grid, standardize = FALSE, intercept = FALSE)

#save the output for lambda
lamda_min_ridge <- cv_ridge_models$lambda.min
cv_ridge_coef <- coef(cv_ridge_models, s = lamda_min_ridge)


#create tables with predictors and best lambdas

#plot cv.glmnet output
png("images/ridge_plots.png")
plot(cv_ridge_models)
dev.off()


#STILL NEED TO DO STEPS 5 AND 6


