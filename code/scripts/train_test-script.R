#this code creates a random ordered vector consisting of 300 trues and 100 falses

set.seed (1)

#train set will be size 300
true <- !logical(300)
false <- logical(100)
vec <- c(true, false)


train <- sample(vec, replace = FALSE)
#test set is the rest of 100 observations
test <- (! train )

#store train and test data in an Rdata file
#this data will be used everytime we build a model

save(train, test, file = "data/train_test.RData")


