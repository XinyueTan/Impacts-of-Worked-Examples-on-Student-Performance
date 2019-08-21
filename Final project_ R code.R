#################################
## DATA CLEANING AND PREPARATION
#################################

# Install and Load xlsx package
library("xlsx")

# Load data and read the first excel sheet
getwd()
data<- read.xlsx(file= "hw-dec2006-paper-tests-detailed.xls",1)

# Dimention of the matrix
dim(data)
# Print the first 6 rows of a matrix
head(data) 

# Subset a data frame with variable "Teacher", "Condition", "Units", 
# "Pre.Post.Test", "A.B.Form", "Item" and "Score"   
data1<- data[,c(2,5,6,8,9,10,14)]
dim(data1) 

# Visualize the missing data
library(mice)
# Characterize the missingness
par("oma"= c(1,0,0,0))
md.pattern(data1, plot= TRUE, rotate.names = TRUE)
mtext(text = "Missing Data Patterns", side = 1, cex=1.5, line = -3)

# Delete rows with missing data
data1<- data1[!is.na(data1[,"Condition"]),]
str(data1)

# Encode vectors as factors
# e.g.: Vairbale Units is a number, but it supposed to be a 
# factor, where 7 represents "Unit 7" and 9 represents "Unit 9"
data1$Teacher<- factor(data1$Teacher, levels= c("Conko", "Schoming"),
                       labels = c("Conko", "Schoming"))
data1$Condition<- factor(data1$Condition, levels = c("control", "treatment"),
                         labels = c("control", "treatment"))
data1$Units<- factor(data1$Units, levels = c("7", "9"), labels = c("7", "9"))
data1$Pre.Post.Test<- factor(data1$Pre.Post.Test, levels= c("Post", "Pre"))
data1$A.B.Form<- factor(data1$A.B.Form, levels = c("A", "B"), 
                        labels = c("A", "B"))
data1$Item<- factor(data1$Item)
data1$Score<- factor(data1$Score, levels= c("0", "1"), labels = c("0", "1"))
str(data1)


#####################################################
## RESEARCH QUESTION ONE: ACCURACY RATE OF EACH ITEM
####################################################

# The accuracy rate of each item in Unit 7 and 9
unit7<- data1[which(data1$Units == "7"),]
unit9<- data1[which(data1$Units == "9"),]

# Seperate A/B Form
unit7_a<- unit7[which(unit7$A.B.Form == "A"),]
unit7_b<- unit7[which(unit7$A.B.Form == "B"),]
unit9_a<- unit9[which(unit9$A.B.Form == "A"),]
unit9_b<- unit9[which(unit9$A.B.Form == "B"),]

# Unit 7- Test Form A
dev.off()
par("mfrow"= c(2,1))
par("oma"= c(0,3,3,0))
par(mar=c(3,1,1,0)+0.1)

# Two-way table of questions by score
t1<-table(unit7_a$Score, unit7_a$Item)
# Accuracy rate for each item (question)
(t2<-prop.table(t1, margin = 2))  
barplot(height= t2, xlab = "", ylab = "", ylim = c(0,1), 
        main = "", col = c(rgb(1,0,0,3/4), rgb(0,1,0,1/4)))
# Add sub title for the plot
mtext(text = "Test Form A",
      side = 1, line = 2)
mtext(text = "Probability", side = 2, line = 2)
# Add grid lines.
abline( h = seq(0, 1, 0.1),
        col = "lightgray", lty = 2)
# Replot parplot (with add = TRUE)
barplot(height= t2, xlab = "", ylab = "", ylim = c(0,1), 
        main = "", col = c(rgb(1,0,0,1), rgb(0,1,0,1/4)),
        add = TRUE)
# Add grid lines.
abline( h = 0.5,
        col = "black", lty = 3, lwd= 2)

# Add a legend to the plot
legend("topleft",
       legend = c("Incorrect","Correct"),
       col = c(rgb(1,0,0,3/4), rgb(0,1,0,2/4)),
       lty= 3, cex= 0.8,
       pch = 15, 
       pt.cex = 1.2)

# Unit 7- Test Form B
t3<-table(unit7_b$Score, unit7_b$Item)
# Accuracy rate for each item (question)
(t4<-prop.table(t3, margin = 2))  
barplot(height= t4, xlab = "", ylab = "", ylim = c(0,1), 
        main = "", col = c(rgb(1,0,0,3/4), rgb(0,1,0,1/4)))
# Add sub title for the plot
mtext(text = "Test Form B",
      side = 1, line = 2)
mtext(text = "Probability", side = 2, line = 2)
# Add grid lines.
abline( h = seq(0, 1, 0.1),
        col = "lightgray", lty = 2)
# Replot parplot (with add = TRUE)
barplot(height= t4, xlab = "", ylab = "", ylim = c(0,1), 
        main = "", col = c(rgb(1,0,0,1), rgb(0,1,0,1/4)),
        add = TRUE)
# Add grid lines.
abline( h = 0.5,
        col = "black", lty = 3, lwd= 2)

# Main label
mtext(text = "Accuracy Rate of Each Question in the Unit 7", 
      side = 3, outer = TRUE, cex = 1.1) 



# Unit 9- Test Form A
dev.off()
par("mfrow"= c(2,1))
par("oma"= c(0,3,3,0))
par(mar=c(3,1,1,0)+0.1)
t5<-table(unit9_a$Score, unit9_a$Item)

# Accuracy rate for each item (question)
(t6<-prop.table(t5, margin = 2))  
barplot(height= t6, xlab = "", ylab = "", ylim = c(0,1), 
        main = "", col = c(rgb(1,0,0,3/4), rgb(0,1,0,1/4)))
# Add sub title for the plot
mtext(text = "Test Form A",
      side = 1, line = 2)
mtext(text = "Probability", side = 2, line = 2)
# Add grid lines.
abline( h = seq(0, 1, 0.1),
        col = "lightgray", lty = 2)
# Replot parplot (with add = TRUE)
barplot(height= t6, xlab = "", ylab = "", ylim = c(0,1), 
        main = "", col = c(rgb(1,0,0,1), rgb(0,1,0,1/4)),
        add = TRUE)
# Add grid lines.
abline( h = 0.5,
        col = "black", lty = 3, lwd= 2)

# Add a legend to the plot
legend("topleft",
       legend = c("Incorrect","Correct"),
       col = c(rgb(1,0,0,3/4), rgb(0,1,0,2/4)),
       lty= 3, cex= 0.8,
       pch = 15, 
       pt.cex = 1.2)



# Unit 9- Test Form B
t7<-table(unit7_b$Score, unit7_b$Item)

# Accuracy rate for each item (question)
(t8<-prop.table(t7, margin = 2))  
barplot(height= t8, xlab = "", ylab = "", ylim = c(0,1),
        main = "", col = c(rgb(1,0,0,3/4), rgb(0,1,0,1/4)))
# Add sub title for the plot
mtext(text = "Test Form B",
      side = 1, line = 2)
mtext(text = "Probability", side = 2, line = 2)
# Add grid lines.
abline( h = seq(0, 1, 0.1),
        col = "lightgray", lty = 2)
# Replot parplot (with add = TRUE)
barplot(height= t8, xlab = "", ylab = "", ylim = c(0,1),
        main = "", col = c(rgb(1,0,0,1), rgb(0,1,0,1/4)),
        add = TRUE)
# Add grid lines.
abline( h = 0.5,
        col = "black", lty = 3, lwd= 2)

# Main label
mtext(text = "Accuracy Rate of Each Question in the Unit 9", 
      side = 3, outer = TRUE, cex = 1.1) 


############################################
## RESEARCH QUESTION TWO: CONDITION VS SCORE
############################################
# Spineplots are used to plot the realtionships between cross-
# classified categorical variables. Spineplots are useful in that
# they can visually represent lack of independence. If the variables
# are independent, we expect the proportions within each category
# to be roughly the same. Departures from independence yield 
# differing proportional distributions by category.

#### Score and Condition #######
dev.off()
par("mar"= c(6, 5, 5, 3))
spineplot(Score ~ Condition,
          data = data1,
          col = c(rgb(1,1,0.2,1), rgb(0.2,1,1,1)),
          cex= 1.5, font = 4)
          
mtext(text= "Cross-Classification of Score by Condition", side= 3, 
      line= 3, cex= 1.4)

# Add an horizontal axis at the top to show the control/treatment
# group proportions.
axis(side = 3)


# Run a chi-squared test for association. The null hypothesis 
# is the independence of Score and Condition. The alternative hypothesis 
# is that they are dependent. The test assumes data points 
# are independent, that both variables are categorical variables, 
# and that the sample size is large enough (300 in control group,
# 240 in treatment group)

tab_scorecondition <- table(data1$Score, data1$Condition)
(ch1 <- chisq.test(tab_scorecondition))
# X-squared = 7.8348, df = 1, p-value = 0.005125

# Since the p-value is less than or equal to 0.05, we reject the null
# hypothesis of independence. Thus, there is evidence of a dependency between
# Score and Condition

# Express the table as proportions
prop.table(tab_scorecondition) # overall proportions (divided by total sample size)
prop.table(tab_scorecondition, 1) # proportions w.r.t. row totals
prop.table(tab_scorecondition, 2) # proportions w.r.t. col totals

#### Pre/ Post Test and Condition #######
(tab_ppcondition<- table(data1$Pre.Post.Test, data1$Condition))
(chi_abcondition<- chisq.test(tab_ppcondition))
# X-squared = 5.8414, df = 1, p-value = 0.01565 
# Since the p-value is less than or equal to 0.05, we reject the null
# hypothesis of independence. Thus, there is evidence of a dependency between
# Pre/ Post and Condition.

#### A/B Form and Condition #######
(tab_abcondition<- table(data1$A.B.Form, data1$Condition))
(chi_abcondition<- chisq.test(tab_abcondition))
# X-squared = 0.011266, df = 1, p-value = 0.9155 
# Since the p-value is greater to 0.05, we cannot reject the null
# hypothesis of independence. Thus, there is no evidence of a dependency between
# A/B Form and Condition

#### Units and Condition #######
(tab_unitcondition<- table(data1$Units, data1$Condition))
(chi_unitcondition<- chisq.test(tab_unitcondition))
# X-squared = 37.264, df = 1, p-value = 1.032e-09
# Since the p-value is less than or equal to 0.05, we reject the null
# hypothesis of independence. Thus, there is evidence of a dependency between
# Units and Condition.


# Visualize data using parallel histogram
# Barplot of Units by Condition

# Subset Control and Treatment group
control<- data1[which(data1$Condition == "control"),]
treatment<- data1[which(data1$Condition == "treatment"),]

dev.off()
par("mfrow"= c(2,1))

# Reduce bottom and top margins.
par("mar" = c(2, 8, 0, 0) + .1) 
# Add outer margins for overall axes.
par("oma" = c(2, 0, 6, 3)) 


# Control Group and Units
control_table<- table(control$Units)
barplot(height = control_table, xlab = "", ylab = "", 
        ylim = c(0, 250), ## Get y-axis on the same scale 
        main = "", # suppress labels and horizontal axes axes
        col = c("#00AFBB", "#E7B800"),
        axes = FALSE)
# Add grid lines.
abline( h = seq(0, 250, 50),
        col = "lightgray", lty = 2)
# Replot parplot (with add = TRUE)
barplot(height = control_table, xlab = "", ylab = "", 
        ylim = c(0, 250), main = "", col = c("#00AFBB", "#E7B800"),
        axes = FALSE, add= TRUE)
# Horizontal axis
mtext(text = "Control Group",
      side = 1, line = 1)
# Vertical axis
axis(side = 2, las = 2)
mtext(text= "Frequency", side = 2, las= 2, line = 3)



# Treatment Group and Units 
par("mar" = c(2, 8, 0, 0) + .1)

treatment_table<- table(treatment$Units)
barplot(height= treatment_table, xlab = "", ylab = "", 
        ylim = c(0, 250),main = "", col = c("#00AFBB", "#E7B800"),
        axes = FALSE)

# Add grid lines.
abline( h = seq(0, 250, 50),
        col = "lightgray", lty = 2)
# Replot parplot (with add = TRUE)
barplot(height = treatment_table, xlab = "", ylab = "", 
        ylim = c(0, 250), main = "", col = c("#00AFBB", "#E7B800"),
        axes = FALSE, add= TRUE)

# Horizontal axis
mtext(text = "Treatment Group",
      side = 1, line = 1)
# Vertical axis
axis(side = 2, las = 2)
mtext(text= "Frequency", side = 2, las= 2, line = 3)

# Main label
mtext(text = "Bar Chart of Units by Condition", 
      side = 3, outer = TRUE, line = 1, cex = 1.5) 

# Add a legend to the plot
legend("topright",
       legend = c("Unit 7","Unit 9"),
       col = c("#00AFBB", "#E7B800"),
       lty= 3, cex= 0.6,
       pch = 15, 
       pt.cex = 0.6,
       bty = "n" )



#################################################
## RESEARCH QUESTION THREE: REGRESSION ANALYSIS 
##################################################
# LOGISTIC REGRESSION MODEL
# Remove Vairble "Item" from regression analysis

# Load libraries
library(caTools)

# Split the data
split<- sample.split(data1, SplitRatio = 0.8)
split
train<- subset(data1, split== "TRUE")
test<- subset(data1, split== "FALSE")

# Train the model using the training data, set the p-value to be 0.05
# Use glm, the general linear model function 
# The family argument should be binomial to make the glm() function
# do logistic regression, as opposed to some other type of generalized linear model

mymodel<- glm(Score~ Teacher+Condition+Units+Pre.Post.Test+A.B.Form, data = train, 
              family= "binomial")
summary(mymodel)

# Remove the varibale Teacher 
# Since it is not a useful predictor due to its large p-value
mymodel2<- glm(Score~ Condition+Units+Pre.Post.Test+A.B.Form, data = train, 
               family= "binomial")
summary(mymodel2)

# Remove the varibale A.B.Form
mymodel3<- glm(Score~ Condition+Units+Pre.Post.Test, data = train, family= "binomial")
summary(mymodel3)

# Remove the varibale Condition
mymodel4<- glm(Score~ Units+Pre.Post.Test, data = train, family= "binomial")
summary(mymodel4)

# Remove the varibale Pre/Post Test
mymodel5<- glm(Score~ Units, data = train, family= "binomial")
summary(mymodel5)

# Deviance Residuals are close to being centered on 0, and are 
# roughly symmetrical, which is good.

# Both p-values are well below 0.05, and thus, the log (odds)
# and the log (odds ratios) are statistically significant.

# Null deviance and residual deviance can be used to compare models,
# compute R^2 and an overall p value.

# The AIC is the residual deviance adjusted for the number of 
# parameters in the model. AIC can also be used to compare one 
# model to another.

# The logistic regression model: Score= -0.5317 + 1.0562 * Units 
# The variable, Units is equal to 1 when it is unit 9, 
# and 0 when it is unit 1


# Run the test data through the model
res_test<- predict(mymodel5, test, type= "response")
res_test

res_train<- predict(mymodel5, train, type= "response")
res_train

# Validate the model- Confusion Matrix 
# (look at predictions versus the actual values on the training data)
confmatrix_train<- table(Actual_value= train$Score, Predicted_value= res_train>0.5)
confmatrix_train

# If it is predicted FALSE and it was actually false (e.g.; 194),
# or it is predicted TRUE and it was actually true (e.g.: 49), the model 
# predicted correctly
# Others are predicted incorrectly

# Percentage Accuracy on the training data
(confmatrix_train [1,1] + confmatrix_train [[2,2]])/ sum(confmatrix_train)
# The accuracy rate is 62.9%

# Validate the model- Confusion Matrix on the testing data
confmatrix_test <- table(Actual_value= test$Score, Predicted_value= res_test>0.5)
confmatrix_test

# Percentage Accuracy on the testing data
(confmatrix_test [1,1] + confmatrix_test [[2,2]])/ sum(confmatrix_test)
# The accuracy rate is 61.7%



