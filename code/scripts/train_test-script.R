#this code creates a random ordered vector consisting of 300 trues and 100 falses

#read in credit data to eventually make a training and test set from it
credit <- read.csv("data/scaled-credit.csv")

set.seed (1)

#train set will be size 300
true <- !logical(300)
false <- logical(100)
vec <- c(true, false)


train <- sample(vec, replace = FALSE)
#test set is the rest of 100 observations
test <- (! train )

#create the training and test set from the data itself
train_set <- credit[train,]

test_set <- as.numeric(unlist(credit[test,]))

#store train and test data in an Rdata file
#this data will be used everytime we build a model

save(train_set, test_set, file = "data/train_test.RData")
