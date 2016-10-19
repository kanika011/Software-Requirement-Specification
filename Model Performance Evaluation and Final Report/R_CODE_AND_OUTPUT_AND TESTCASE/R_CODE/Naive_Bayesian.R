train = read.csv("C:/Users/hp1/Desktop/training.csv")
test =  read.csv("C:/Users/hp1/Desktop/test.csv")

library(e1071) # load library
rb = naiveBayes(as.factor(ACTION) ~ ., data = train) # make model
rb$levels # tell levels in model
str(rb)  
rb  # show the probabilities
predictedX<-predict(rb,test) # predict output
predictedX
