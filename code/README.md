This section contains the code written for the project


##pre_model-script.R

In this script we dummy out the categorical variables. We do this because *glmnet()*, the function we will use for ridge and lasso regressions, does not take factors as data. Next we perform mean centering and standardizing(mean zero and sd is one) because we want to have comparable scales to prevent favoritism for certain coefficients.

##Training and Testing Sets

This one took longer to perform even though the task seemed simple. I ended up creating a vector of 300 Trues and another vector of 100 Falses. Then I randomized it using *sample()* and no replacement. 