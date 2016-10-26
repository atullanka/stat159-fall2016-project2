#this will be the file for pcr-script

library(pls)

set.seed(2)

#read in scaled credit data
credit <- read.csv("data/scaled-credit.csv")

pcr.fit = pcr(Balance∼., data=credit ,scale=TRUE , validation ="CV")

pcr_best_lambda <- min(pcr.fit$validation$PRESS)

save(pcr_best_lamda, pcr.fit, file = "data/pcr.RData")


#plot pcr output
png("images/pcr_plots.png")
validationplot(pcr.fit, val.type = "MSEP")
dev.off()

#need to do step 5 and 6
