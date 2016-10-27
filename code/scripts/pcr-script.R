<<<<<<< HEAD
#this will be the file for pcr-script

library(pls)

set.seed(2)

#read in scaled credit data
credit <- read.csv("data/scaled-credit.csv")

pcr.fit = pcr(Balance∼., data=credit ,scale=TRUE , validation ="CV")

pcr_best_lambda <- min(pcr.fit$validation$PRESS)

save(pcr_best_lamda, pcr.fit, file = "data/pcr.RData")


#plot pcr output
png("images/pcr_plots.png")
validationplot(pcr.fit, val.type = "MSEP")
dev.off()

#need to do step 5 and 6
=======
# This script will run a pcr regression

# Load necessary libraries and variables
library (pls)
# Load my train and testing data set
load('data/train_test.RData')
# Load scaled-credit data
scaled_credit <- read.csv("data/scaled-credit.csv")
scaled_credit$X <- NULL

set.seed (72838)

# Now begin pcr regression method

# Do I need scale = TRUE in pcr call????

# Running Cross Validation with pcr
cv_pcr <- pcr(Balance ~ ., data = train_set, validation = 'CV')
	 
# Find min lambda
lambda_min_pc <- which.min(cv_pcr$validation$PRESS)

# Plot pcr regression
png('images/pcr_plot.png')
validationplot(cv_pcr, val.type = 'MSEP')
dev.off()

# Calculate MSE
pc_predict <- predict(cv_pcr, ncomp = lambda_min_pc, newdata = test_set)
pc_MSE <- mean((pc_predict - test_set$Balance)^2)

# Re-Fit the Model on the Full Data Set and use best lambda from above
pc_full <- pcr(Balance ~ ., data = scaled_credit, ncomp = lambda_min_pc, validation = 'CV')
pc_coef_full <- coef(pc_full)
	 
# Save Data and Generate an informative Output in txt file
save(lambda_min_pc, cv_pcr, pc_MSE, pc_coef_full,file = 'data/pc-regression.RData')
	 
sink('data/pc-regression-output.txt')
cat('Output of PCR with 10-fold CV on the Full Data Set\n')
print(summary(cv_pcr))
cat('\nMinimum Lambda for PCR\n')
print(lambda_min_pc)
cat('\nPCR MSE of Test Data Set\n')
print(pc_MSE)
cat('\nCoefficients of using PCR Model on Full Data Set\n')
print(pc_coef_full)
sink()




>>>>>>> 7dd60011735c946d6827ae3cd82c319d21f7dabd