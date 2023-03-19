##### DO NOT hard code the working directory
##### only use below format to read the data

data_independent  <- read.csv(file = 'data - for student - independent variables.csv') 
data_dependent <- read.csv(file = 'data - for student - dependent variable.csv')
y <- data_dependent$AmountWines 

first_name<-'Akhil'
last_name<-'Mandula'

##### This example is using average to predict AmountWines
mean.y<-mean(y)

#####  write the prediction function name "model"
model<-function(new_data_independent) { 
  pred<-vector(length=nrow(new_data_independent)) # set up the output prediction
  for(i in 1:nrow(new_data_independent)) {
    # in this example, you only use the average of y to predict.
    # In actual work, you need to define what variables to use to predict in this function
    pred[i] <- mean.y
  }
  return(pred)
}

##### note the input "new_data" needs to be in the SAME format as data_independent
##### note that in this example, it only used mean of y to predict. It did not use any independent variable
new_data <- data.frame(data_independent$Kid_home, data_independent$AmountMeat)

##### use below code to calculate your RMSE
preds <- model(new_data)
rmse<- sqrt(mean((y - preds)^2))
output<-data.frame(first_name,last_name,rmse)
write.table(output,file="finaloutput.csv",append=TRUE,col.names=FALSE,row.names=TRUE,sep=",")



##### keep below code, but don't run it when you are checking your codes, it is for my machine
source("predictdata.R")

