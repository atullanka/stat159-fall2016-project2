This folder contains the code written for the project:

##Session Information

**session.info.R** includes all the library() calls to the packages necessary for your project - for the output of the scripts to even generating tables in the report. 

##Exploratory Data Analysis (EDA)

*eda-script.R* contains the script that when run, the descriptive statistics such as the basic statistical summaries of the quantitative variables and their respective histograms and boxplots are calculated. Furthermore, matrix correlations for the variable *Balance* against the quantitative variables, along with conditional boxplots and scatterplot matrix are output. The qualitiative variables are computed into a table of frequencies and from that, absolute and relative frequency barcharts are created. 

##Pre-modeling

In the *pre_model-script.R* we dummy out the categorical variables. We do this because *glmnet()*, the function we will use for ridge and lasso regressions, does not take factors as data. Next we perform mean centering and standardizing(mean zero and sd is one) because we want to have comparable scales to prevent favoritism for certain coefficients.

##Training and Testing Sets

The script, train_test-script.R took longer to perform even though the task seemed simple. I ended up creating a vector of 300 Trues and another vector of 100 Falses. Then I randomized it using *sample()* and no replacement. 

##Regression Scripts
We created 5 different scripts for running various regression methods: Ordinary Least Squares, Ridge regression, Lasso Regression, Principal Components Regression, and Partial Least Squares Regression.

###Ordinary Least Squares
In **ols_regression.R**, using the `lm()` where the y variable is Balance and the x variable is the combination of the the rest of the variables, the results from the OLS regression methods are output. This script's outputs will be used as a basis for all other regression models to compare to. We read in the scaled data set, which in turn is used for the regression model. 

###Ridge Regression
The script, **ridge-script.R**, performs a ridge regression on the data, credit. Ridge regression is a shrinkage method. "Ridge regression is very similar to least squares, except that the coefficients ridge are estimated by minimizing a slightly different quantity. In particular, the regression ridge regression coefficient estimates βˆR are the values that minimize."<sup>1</sup>

In the script we read in the proper data sets and Rdata files. Then we create a cross validation using cv.glmnet which performs k-fold(here k=10 by default) cross-validation for glmnet, produces a plot, and returns a value for lambda. We then find the best lambda and save the output plot. Finally, we calculate the MSE using the training and test sets and peform ridge regression on the full data set. All prevalent data is saved in a text file in the data folder.

###Lasso Regression
The script, **lasso_regression.R**, performs a lasso regression on the data, credit. Ridge regression is also a shrinkage method. 

Both the scaled data and the test and training sets of data are loaded from calling the appropriate RData and csv files. Fitting and cross-validating the data sets produces a plot, and returns a value for lambda, which leads to calculating the ideal lambda value. Finally, the MSE is calculated using the training and test sets and  lasso regression is performed . All important data and graphical output is saved in a text or png file. 


###Principal Components Regression
The script **pcr-script.R** performs a principal components regression(PCR) on the data, credit. PCR is a dimension reduction method. The PCR approach involves constructing principal components regression the first M principal components, Z1, . . ., ZM, and then using these components as the predictors in a linear regression model that is fit using least squares. The key idea is that often a small number of principal components suffice to explain most of the variability in the data, as well as the relationship with the response. 

In the script we read in the proper data sets and Rdata files. Then we create a cross validation using pcr which performs 10-fold cross-validation, produces a plot, and returns a value for lambda. We then find the best lambda and save the output plot(using *validationplot()*). Finally, we calculate the MSE using the training and test sets and peform PCR on the full data set. All prevalent data is saved in a text file in the data folder.

####Partial Least Squares Regression
The script **plsr_regression.R** performs a partial least squares regression (PLSR) on the credit data. PLSR is also a dimension reduction method. Like PCR, the approach involves constructing principal components regression the first M principal components, Z1, . . ., ZM, and then using these components as the predictors in a linear regression model that is fit using least squares. However, the key difference is that the the principal components are ALSO chosen based thier relation to the response variable, Balance.

In the script we read in the proper data sets and Rdata files. Then we create a cross validation using `plsr()` which performs 10-fold cross-validation, produces a plot, and returns a value for lambda. The following steps are a repeat from **pcr_script.R** and the relevant data and plots are saved in a text and png files.

<sup>1</sup>(James et. al, *An Introduction to Statistical Learning*, 215)
