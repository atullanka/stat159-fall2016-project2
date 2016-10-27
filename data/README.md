This folder contains the data used and generated for the project

Need a liscence

##Credit data set
write some stuff about exploratory data

##Scaled Credit data set
The csv file **scaled-credit.csv** is a standardized version of the original credit data set. We do this because *glmnet()*, the function we will use for ridge and lasso regressions, does not take factors as data. Next we perform mean centering and standardizing(mean zero and sd is one) because we want to have comparable scales to prevent favoritism for certain coefficients.

##Regression data files
Each regression method creates a text file with pertinent data and an Rdata file to be loaded into RMD files.

###Ridge regression data files

####Ridge text output
**ridge-regression-output.txt** contains the 10-Fold Cross Validation for ridge regression on the Full data set. It also contains the MSE, Minumum Lambda and the coefficents for the ridge regression model on the full data set.

####Ridge Rdata file
This Rdata file contains *lambda_min_ridge, cv_ridge_models, ridge_MSE, ridge_coef_full*, which correspond to the variables in the text output file for this method.

###Lasso regression data files

####Lasso text output

####Lasso Rdata file


###Principal Components regression data files

####Principal Components regression text output
**pc-regression-output.txt** contains the 10-Fold Cross Validation for PCR on the Full data set. It also contains the MSE, Minumum Lambda and the coefficents for the PCR model on the full data set.

####Principal Components regression Rdata file
This Rdata file contains *lambda_min_pcr, pcr_fit, pcr_MSE, pcr_coef_full* which correspond to the variables in the text output file for this method.


###Partial least Squares regression data files

####Partial least Squares regression text output

####Partial least Squares regression Rdata file
