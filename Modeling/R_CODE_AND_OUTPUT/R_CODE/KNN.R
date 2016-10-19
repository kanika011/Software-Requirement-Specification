library(class)
library(ROCR)
normalize <- function(x){ # to normalize data
  num <-x-min(x)
   denom <- max(x)-min(x)
   return (num/denom)
}
Dset <- as.data.frame(lapply(train, normalize))
summary(train)
responseY <- as.matrix(train[,dim(train)[2]])
model.knn <- knn(train=train, test=test, cl=responseY, k=19, prob=T)  # making the model
plot(model.knn)
predictedX <- predict(model, train) # predicting output
# testing the predict
table(train$ACTION, predictedX > 0.5)
ROCRpred = prediction(predictedX, train$ACTION)
auc = as.numeric(performance(ROCRpred, "auc")@y.values)
ROCRperf = performance(ROCRpred, "tpr", "fpr")
plot(ROCRperf)
auc
