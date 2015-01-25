setwd("C:/UCIHARDataset/")
getwd()
#Reading Test Data
c(getwd(), "/test/")
test_data <- read.table("/test/X_test.txt")
#Reading Train Data
train_data <- read.table("C:/Users/svadlama/Box Sync/big_data/coursera/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

#Testing number of rows in test data
#nrow(test_data) #2947
#nrow(train_data) #10299

#binding both the data sets
merged_data <- rbind(test_data, train_data)

#Total rows of 10299
#nrow(merged_data) 
