train = read.csv("C:/Users/hp1/Desktop/training.csv")
test =  read.csv("C:/Users/hp1/Desktop/test.csv")
library(rpart)
y = glm(ACTION ~ .,data=train, family=binomial) #make model
summary(y) 

predictX = predict(y, type="response") # predict output

table(train$ACTION, predictX > 0.5)
# checking the accuracy
library("ROCR")


ROCRpred = prediction(predictX, train$ACTION)
auc = as.numeric(performance(ROCRpred, "auc")@y.values)

ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf)
