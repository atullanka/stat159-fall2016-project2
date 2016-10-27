library(pls)

load("../../data/train_test.RData")
scaled_data <- read.csv("../../data/scaled-credit.csv")[, -1]

test_x = model.matrix(Balance ~ ., test_set)[,-1]
test_y = test_set$Balance

# Perform ten-fold cross validation on the training data
pls_fit = plsr(Balance ~ ., data=train_set,scale=TRUE, validation="CV")

# Find the number of components that yields the lowest MSEP
comp = which.min(pls_fit$validation$PRESS)

# Save validation plot to png file
png(filename="../../images/plsr_regression_validationplot.png")
validationplot(pls_fit, val.type="MSEP")
dev.off()

# Find the test mse
pls_pred = predict(pls_fit, test_x, ncomp=comp)
mse = mean((pls_pred-test_y)^2)

# Find the coefficients for the best value of the number of components
pls_out = plsr(Balance ~ ., data=scaled_data ,scale=TRUE,ncomp=comp)
coeff = pls_out$coefficients[, , comp]

# Save output objects to RData file
save(pls_fit, comp, mse, coeff, file="../../data/plsr_regression.RData")

# Write coefficients, best number of components, and mse to a text file
library(pander)
sink("../../data/plsr_regression.txt")
pander(coeff)
writeLines("\nTest MSE:\n")
mse
writeLines("\nBest Number of Components:\n")
comp
sink()