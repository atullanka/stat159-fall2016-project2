#This script will pre-model the data
#specifically make the data ready to be dealt with glmnet() function

#first transform each categorical variable into dummy variables

# dummy out categorical variables
temp_credit <- model.matrix(Balance ~ ., data = credit)

# removing column of ones, and appending Balance
new_credit <- cbind(temp_credit[ ,-1], Balance = credit$Balance)

#now we need to mean center and standardize

#scaling and centering
scaled_credit <- scale(new_credit, center = TRUE, scale = TRUE)

#export scaled data
write.csv(scaled_credit, file = "data/scaled-credit.csv")

