train = read.csv("C:/Users/hp1/Desktop/training.csv")
test =  read.csv("C:/Users/hp1/Desktop/test.csv")

library(e1071) # library load to do SVM
model <- svm(ACTION ~ ., data = train) # make model
predictedX <- predict(model, test) # predict output
plot(predictedX) # plot predicted output
