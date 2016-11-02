This folder contains the data used and generated for the project

##Credit data set
The primary data set for this project is *Credit.csv*, ( [this link](http://www-bcf.usc.edu/~gareth/ISL/Credit.csv) ), from [*An Introduction to Statistical Learning*](http://www-bcf.usc.edu/~gareth/ISL/data.html) book by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani.

##Scaled Credit data set
The csv file **scaled-credit.csv** is a standardized version of the original credit data set. We do this because *glmnet()*, the function we will use for ridge and lasso regressions, does not take factors as data. Next we perform mean centering and standardizing(mean zero and sd is one) because we want to have comparable scales to prevent favoritism for certain coefficients.

##Train and Test Data
**train_test.Rdata** contains the training and testing data sets for the regression models. The training data contains 300 elements and the testing data contains 100 elements. The elements of each set are randomized and meant to be reproducible since we set the seed in the script, which produced the 2 sets.

##Regression data files
Each regression method creates a text file with pertinent data and an Rdata file to be loaded into RMD files.

###OLS regression data files

####OLS text output
**ols_regression_output.txt** contains the statistical summary of the regression (F-statistic, RSE, Intercept etc.) 

####OLS Rdata file
***OLS_regression.Rdata*** contians the *OLS_summary* which is the output generated in the txt file

###Ridge regression data files

####Ridge text output
**ridge-regression-output.txt** contains the 10-Fold Cross Validation for ridge regression on the Full data set. It also contains the MSE, Minumum Lambda and the coefficents for the ridge regression model on the full data set.

####Ridge Rdata file
This Rdata file contains *lambda_min_ridge, cv_ridge_models, ridge_MSE, ridge_coef_full*, which correspond to the variables in the text output file for this method.

###Lasso regression data files

####Lasso text output
**Lasso_regression.txt** contains the 10-Fold Cross Validation for lasso regression on the data set, containing the MSE, Min Lambda and the coefficents for the lasso regression model.

####Lasso Rdata file
This Rdata file (**lasso.Rdata**) contains *"best_lambda", "cv_out", "lasso_coef", "test_mse" *, which are the variables in the text output file.

###Principal Components regression data files

####Principal Components regression text output
**pc-regression-output.txt** contains the 10-Fold Cross Validation for PCR on the Full data set. It also contains the MSE, Minumum Lambda and the coefficents for the PCR model on the full data set.

####Principal Components regression Rdata file
This Rdata file contains *lambda_min_pcr, pcr_fit, pcr_MSE, pcr_coef_full* which correspond to the variables in the text output file for this method.


###Partial least Squares regression data files

####Partial least Squares regression text output
**plsr_regression.txt** contains the 10-Fold Cross Validation for the PLSR regression on the data set, containing the MSE, the ideal number of components and the coefficents for the regression model.

####Partial least Squares regression Rdata file
This Rdata file (**plsr_regression.Rdata**) contains *"coeff" , "comp" , "mse" , "pls_fit" *, which match the variables in the text output file.
