train = read.csv("C:/Users/hp1/Desktop/training.csv")
test =  read.csv("C:/Users/hp1/Desktop/test.csv")
summary(train)
View(train)
train.features = train  # checking the features of train 
train.features$ACTION<-NULL # setting target variable to NULL
summary(train.features)
result = kmeans(train.features, 2) # dividing into two clusters
result
summary(result)
