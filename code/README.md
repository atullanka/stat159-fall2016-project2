This section contains the code written for the project


##Pre-modeling

In the *pre_model-script.R* we dummy out the categorical variables. We do this because *glmnet()*, the function we will use for ridge and lasso regressions, does not take factors as data. Next we perform mean centering and standardizing(mean zero and sd is one) because we want to have comparable scales to prevent favoritism for certain coefficients.

##Training and Testing Sets

The script, train_test-script.R took longer to perform even though the task seemed simple. I ended up creating a vector of 300 Trues and another vector of 100 Falses. Then I randomized it using *sample()* and no replacement. 

##Regression Scripts
We created 5 different scripts for running various regression methods: Ordinary Least Squares, Ridge regression, Lasso Regression, Principal Components Regression, and Partial Least Squares Regression.

###Ordinary Least Squares
We just use lm fnc

###Ridge Regression
The script, *ridge-script.R*, performs a ridge regression on the data, credit. Ridge regression is a shrinkage method. Ridge regression is very similar to least squares, except that the coefficients ridge are estimated by minimizing a slightly different quantity. In particular, the regression ridge regression coefficient estimates βˆR are the values that minimize(page 215) n i=1 ⎛ ⎝yi − β0 −p j=1 βjxij ⎞ ⎠ 2 + λ p j=1 β2 j = RSS + λ p j=1 β2 j , (6.5) (FOOTNOTE)
.

In the script we read in the proper data sets and Rdata files. Then we create a cross validation using cv.glmnet which performs k-fold(here k=10 by default) cross-validation for glmnet, produces a plot, and returns a value for lambda. We then find the best lambda and save the output plot. Finally, we calculate the MSE using the training and test sets and peform ridge regression on the full data set. All prevalanet data is saved in a text file in the data folder.

###Lasso Regression

###Principal Components Regression
