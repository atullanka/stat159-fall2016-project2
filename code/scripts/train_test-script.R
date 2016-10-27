#this code creates a random ordered vector consisting of 300 trues and 100 falses

#read in credit data to eventually make a training and test set from it
credit <- read.csv("data/scaled-credit.csv")

set.seed (1982)

#train set will be size 300
true <- !logical(300)
false <- logical(100)
vec <- c(true, false)


train <- sample(vec, replace = FALSE)
#test set is the rest of 100 observations
test <- (! train )

#create the training and test set from the data itself
train_set <- credit[train,]

test_set <- credit[test,]

#store train and test data in an Rdata file
#this data will be used everytime we build a model
<<<<<<< HEAD
=======
<<<<<<< HEAD
save(train_set, test_set, file = "data/train_test.RData")
=======
save(train_set, test_set, train, test, file = "data/train_test.RData")
>>>>>>> 0eb513f9b503acc5323a1c89abc9f7dfb09de474
>>>>>>> e396f172540263e5b24fe9b484cdb8d7b14b6372


save(train_set, test_set, file = "data/train_test.RData")
