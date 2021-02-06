library('MASS');


setwd('E:/studiaMGR/Analiza Procesów Uczenia/Lab4');
file_data <- read.csv("smartfony.csv");


train_data_precent <- 0.7
ind <- createDataPartition(file_data, p = train_data_precent, list = F)
train_data <- dataset[ind,]
test_data<- dataset[-ind,]


dataset <- data.frame(Ocena=file_data$Ocena, wyswietlacz=file_data$wyswietlacz, pamiec_RAM=file_data$pamiec_RAM, pamiec_wbudowana=file_data$pamiec_wbudowana, aparat_foto=file_data$aparat_foto)
dataset$Ocena <- as.factor(dataset$Ocena)
dataset$wyswietlacz <- as.factor(dataset$wyswietlacz)
dataset$pamiec_RAM <- as.factor(dataset$pamiec_RAM)
dataset$pamiec_wbudowana <- as.factor(dataset$pamiec_wbudowana)
dataset$aparat_foto <- as.factor(dataset$aparat_foto)

train_data_precent <- 0.7
ind <- createDataPartition(dataset, p = train_data_precent, list = F)
train_data <- dataset[-ind,]
test_data<- dataset[ind,]
library(C50)
oneTree <- C5.0(formula = Ocena ~ ., data = train_data)
summary(oneTree)
plot(oneTree)
ind <- createDataPartition(dataset, p = train_data_precent, list = F)
ind <- createDataPartition(file_data, p = train_data_precent, list = F)
train_data <- dataset[-ind,]
test_data<- dataset[ind,]
library(C50)
oneTree <- C5.0(formula = Ocena ~ ., data = train_data)
summary(oneTree)
plot(oneTree)
ind <- createDataPartition(file_data, p = train_data_precent, list = F)
train_data <- dataset[ind,]
test_data<- dataset[-ind,]
library(C50)
oneTree <- C5.0(formula = Ocena ~ ., data = train_data)
summary(oneTree)
plot(oneTree)
library(e1071)
bstTreePred <- predict(oneTree, test_data)
postResample(bstTreePred, test_data$Ocena)
