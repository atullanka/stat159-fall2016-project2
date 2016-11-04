credit <- read.csv("data/Credit.csv")
library(plyr)

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

#####SAVE BOTH TABLES TO A TXT FILE  

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

########################

# Compute the summary statistics for qualitative variables
qual.var = colnames(credit)[8:11]
credit.qual = credit[qual.var]
# Gender
genderTable = count(credit, 'Gender')
genderTable$RelativeFreq = genderTable$freq / sum(genderTable$freq)
colnames(genderTable)[2] = 'Frequency'
sink('../../data/frequencyTable-gender.txt')
genderTable
sink()
save(genderTable, file = '../../data/frequencyTable-gender.RData')
png('../../images/barchart-gender.png')
barplot(table(credit$Gender), main = 'Barplot of Gender', xlab = 'Gender')
dev.off()

# Student
studentTable = count(credit, 'Student')
studentTable$RelativeFrequency = studentTable$freq / sum(studentTable$freq)
colnames(studentTable)[2] = 'Frequency'
sink('../../data/frequencyTable-student.txt')
studentTable
sink()
save(studentTable, file = '../../data/frequencyTable-student.RData')
png('../../images/barchart-student.png')
barplot(table(credit$Student), main = 'Barplot of Student', xlab = 'Student')
dev.off()
# Married
marriedTable = count(credit, 'Married')
marriedTable$RelativeFrequency = marriedTable$freq / sum(marriedTable$freq)
colnames(marriedTable)[2] = 'Frequency'
sink('../../data/frequencyTable-married.txt')
marriedTable
sink()
save(marriedTable, file = '../../data/frequencyTable-married.RData')
png('../../images/barchart-married.png')
barplot(table(credit$Married), main = 'Barplot of Marital Status', xlab = 'Marital Status')
dev.off()
# Ethnicity
ethnicityTable = count(credit, 'Ethnicity')
ethnicityTable$RelativeFrequency = ethnicityTable$freq / sum(ethnicityTable$freq)
colnames(ethnicityTable)[2] = 'Frequency'
sink('../../data/frequencyTable-ethnicity.txt')
ethnicityTable
sink()
save(ethnicityTable, file = '../../data/frequencyTable-ethnicity.RData')
png('../../images/barchart-ethnicity.png')
barplot(table(credit$Ethnicity), main = 'Barplot of Ethnicity', xlab = 'Ethnicity')
dev.off()

# Association between Balance and the predictors
# Matrix of Correlations among all quantitative variables:
correlationMatrix = cor(credit.quant)
sink('../../data/eda-correlationMatrix.txt')
correlationMatrix
sink()
save(correlationMatrix, file = '../../data/correlation-matrix.RData')
#Scatterplot Matrix
png('../../images/scatterplot-matrix.png')
pairs(~Income+Limit+Rating+Cards+Age+Education+Balance, data = credit.quant, main = 'Simple Scatterplot Matrix', cex = 0.8)
dev.off()

# Anova between Balance and all the qualitative variables
options(contrasts = c("contr.helmert", "contr.poly"))
anovaQualitative = aov(credit$Balance~credit$Gender+credit$Student+credit$Married+credit$Ethnicity, 
                       data = credit.qual)
save(anovaQualitative, file = '../../data/eda-anovaQualitative.RData')

# Conditional boxplots between Balance and the qualitative variables
# On gender
balanceMale = credit$Balance[credit$Gender != 'Female']
balanceFemale = credit$Balance[credit$Gender == 'Female']
png('../../images/boxplot-balanceConditionalOnGender.png')
boxplot(balanceMale, balanceFemale, names = c('Male', 'Female'), main = 'Boxplot of Balance Conditioned on Gender')
dev.off()

# On student
balanceStudent = credit$Balance[credit$Student == 'Yes']
balanceNonStudent = credit$Balance[credit$Student == 'No']
png('../../images/boxplot-balanceConditionalOnStudent.png')
boxplot(balanceStudent, balanceNonStudent, names = c('Student', 'Non-Student'), main = 'Boxplot of Balance Conditioned on Student')
dev.off()
# On marital status
balanceMarried = credit$Balance[credit$Married == 'Yes']
balanceSingle = credit$Balance[credit$Married == 'No']
png('../../images/boxplot-balanceConditionalOnMarried.png')
boxplot(balanceMarried, balanceSingle, names = c('Married', 'Single'), main = 'Boxplot of Balance Conditioned on Marital Status')
dev.off()
# On ethnicity
balanceCaucasian = credit$Balance[credit$Ethnicity == 'Caucasian']
balanceAA = credit$Balance[credit$Ethnicity == 'African American']
balanceAsian = credit$Balance[credit$Ethnicity == 'Asian']
png('../../images/boxplot-balanceConditionalOnEthnicity.png')
boxplot(balanceCaucasian, balanceAA, balanceAsian, names = c('Caucasian', 'African American', 'Asian'), main = 'Boxplot of Balance Conditioned on Ethnicity')
dev.off()

