setwd("C:/DataScience")

library(ff)

#Reading the CSV file as a ff data frame
cuckoosff <- read.table.ffdf(
  file = "cuckoos.csv",
  FUN = "read.csv")

#Displaying the column names
names(cuckoosff)

library(biglm)

#Creating the linear regression model
model <- biglm(
  formula =  breadth ~ length ,
  data = cuckoosff)

#Creating a scatterplot
plot(
  x = cuckoosff$length[],
  y = cuckoosff$breadth[],
  main = "Cuckoos Length vs Breadth",
  xlab = "Length",
  ylab = "Breadth")
  
summary(model)

#Getting the coefficient from the model
coef <- summary(model)$mat[1,1]

#Getting the slope from the model
breadth <- summary(model)$mat[2,1]

#Drawing the regression line on the plot
lines(
  x = cuckoosff$length[],
  y = breadth * cuckoosff$length[] + coef,
  col = "red",
  lwd = 3)

#Predicting values
predict(
  object = model,
  newdata = data.frame(
    length = c(20, 22.5, 25),
    breadth = c(0, 0, 0)))

