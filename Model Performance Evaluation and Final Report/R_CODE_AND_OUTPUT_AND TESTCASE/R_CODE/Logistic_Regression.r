# logistic regression
train = read.csv("C:/Users/hp1/Desktop/training.csv")
test =  read.csv("C:/Users/hp1/Desktop/test.csv")
library(ROCR)
library(pROC)
x <-sort(rnorm(100))
set.seed(114)
y <- c(sample(x=c(0,1),size=30,prob=c(0.9,0.1),re=T),       sample(x=c(0,1),size=20,prob=c(0.7,0.3),re=T),       sample(x=c(0,1),size=20,prob=c(0.3,0.7),re=T),       sample(x=c(0,1),size=30,prob=c(0.1,0.9),re=T)) 
m1 <- lm(y~x)
m2 <- glm(y~x,family=binomial(link=logit)) # make model
y2 <- predict(m2,data=x,type='response')  #predict output
par(mar=c(5,4,0,0))
plot(y~x);abline(m1,lwd=3,col=2)
points(x,y2,type='l',lwd=3,col=3)
summary(m2)
f1 = roc(ACTION ~ ROLE_ROLLUP_1+ROLE_TITLE+ROLE_CODE, data=train)
f1


