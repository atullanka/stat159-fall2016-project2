credit <- read.csv("data/Credit.csv")

#For simplicity, a smaller dataset that contains all the quantitative variables will be used instead of the entire dataset
credit.quant <- credit[c(2,3,4,5,6,7,12)]

#Statistical Summary of the quantitative variables
summary.credit <- summary(credit.quant)

#Computing Range, IQR and Standard Devaition for the same quantitative variables
credit.extra = matrix(nrow  = ncol(credit.quant), ncol = 4)
colnames(credit.extra) <- c("Variable","Range", "IQR", "Standard Deviation")
for (i in 1:ncol(credit.quant)){
  credit.extra[i,1] = names(credit.quant)[i]
  credit.extra[i,2] = max(credit.quant[i]) - min(credit.quant[i])
  credit.extra[i,3] = quantile(credit.quant[[i]], 3/4, names = F) - quantile(credit.quant[[i]], 1/4, names = F)
  credit.extra[i,4] = sd(credit.quant[[i]])
}

#Histograms
png(file = "../../images/histogram-income.png")
hist(credit.quant$Income, main = "Income Distribution", xlab = "Income (in thousands of dollars)", col = "blue")
dev.off()

png(file = "../../images/histogram-limit.png")
hist(credit.quant$Limit, main = "Limit Distribution", xlab = "Limit", col = "blue")
dev.off()

png(file = "../../images/histogram-rating.png")
hist(credit.quant$Rating, main = "Rating Distribution", xlab = "Rating", col = "blue")
dev.off()

png(file = "../../images/histogram-cards.png")
hist(credit.quant$Cards, main = "Credit Cards Distribution", xlab = "Cards", col = "blue")
dev.off()

png(file = "../../images/histogram-age.png")
hist(credit.quant$Age, main = "Age Distribution", xlab = "Age", col = "blue")
dev.off()

png(file = "../../images/histogram-education.png")
hist(credit.quant$Education, main = "Education Distribution", xlab = "Education (in years)", col = "blue")
dev.off()

png(file = "../../images/histogram-balance.png")
hist(credit.quant$Balance, main = "Bank Balance Distribution", xlab = "Balance", col = "blue")
dev.off()

#Boxplots
png(file = "../../images/boxplot-income.png")
boxplot(credit.quant$Income, main = "Income Distribution", 
        xlab = "Income (in thousands of dollars)", horizontal = T)
dev.off()

png(file = "../../images/boxplot-limit.png")
boxplot(credit.quant$Limit, main = "Limit Distribution", 
        xlab = "Limit", horizontal = T)
dev.off()

png(file = "../../images/boxplot-rating.png")
boxplot(credit.quant$Limit, main = "Rating Distribution", 
        xlab = "Rating", horizontal = T)
dev.off()

png(file = "../../images/boxplot-cards.png")
boxplot(credit.quant$Cards, main = "Credit Card Distribution", 
        xlab = "Cards", horizontal = T)
dev.off()

png(file = "../../images/boxplot-age.png")
boxplot(credit.quant$Age, main = "Age Distribution", 
        xlab = "Age", horizontal = T)
dev.off()

png(file = "../../images/boxplot-education.png")
boxplot(credit.quant$Education, main = "Education Distribution", 
        xlab = "Limit", horizontal = T)
dev.off()

png(file = "../../images/boxplot-balance.png")
boxplot(credit.quant$Balance, main = "Balance Distribution", 
        xlab = "Balance (in dollars)", horizontal = T)
dev.off()