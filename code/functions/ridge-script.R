#this script will run a ridge regression
library (glmnet)

set.seed (1)


#load scaled-credit data
credit <- read.csv("data/scaled-credit.csv")

#load my train and testing data set
load("data/train_test.RData")
#the variables in this file are training_set, test_set, train, test

#ONLY WORK ON TRAINING SET FOR NOW

#WHAT SHOULD MY X AND Y BE???

#create an x and y for glmnet() to input
x = as.matrix(training_set) 

#just look at Age for now
y = as.double(training_set$Age) 

#ridge regression utilizes a variable lambda which can vary in size, so we make a vector modeling this

grid = 10^seq(10, -2, length = 100)

#create ridge object using glmnet and grid for lambda arguemnet
#alpha =0 ensures that ridge is used
#Do i need intercept = FALSE

#ridge_models = glmnet(x,y, alpha =0, lambda = grid, standardize = FALSE, intercept = FALSE)


cv_ridge_models = cv.glmnet (x,y,alpha =0, lambda = grid, standardize = FALSE, intercept = FALSE)

best_lamda = cv_ridge_models$lambda.min

print(best_lamda)

save(best_lamda, cv_ridge_models, file = "data/ridge_regression.RData")


#plot cv.glmnet output
png("images/ridge_plots.png")
plot(cv_ridge_models)
dev.off()


#STILL NEED TO DO STEPS 5 AND 6


