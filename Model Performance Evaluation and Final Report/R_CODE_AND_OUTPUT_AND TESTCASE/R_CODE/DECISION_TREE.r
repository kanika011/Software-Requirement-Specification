train = read.csv("C:/Users/hp1/Desktop/training.csv")
test =  read.csv("C:/Users/hp1/Desktop/test.csv")
library(party)
library(ROCR)
library("caret")
str(train)
tra <-ctree(ACTION ~ROLE_ROLLUP_1+ROLE_TITLE+ROLE_CODE, data =train) # gives fitted decision tree
print(tra) # taken 3 attributes that have maximum importance
plot(tra)
predictedX <- predict(tra, test) # predict using decision tree
plot(predictedX)
table(train$ACTION, predictedX > 0.5) 
ROCRpred = prediction(predictedX, train$ACTION) # make a graph to tell efficiency
auc = as.numeric(performance(ROCRpred, "auc")@y.values)
ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf)
auc # value of AUC


