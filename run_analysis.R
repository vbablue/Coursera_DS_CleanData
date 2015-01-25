setwd("C:/UCIHARDataset/")

#Reading Test Data

test_data <- read.table(paste(getwd(), "/test/x_test.txt", sep=""))

features<- read.table(paste(getwd(), "/features.txt", sep=""))

featureList <-as.character(features[,2])
featureList <- make.names(featureList, unique=TRUE)
colnames(test_data) <- featureList

#subsetting the merged_test_data with the columns having mean and std.
subset_test_data  <- test_data[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]
nrow(subset_test_data)

#Reading the activity labels data and the description and merging
y_test <- read.table(paste(getwd(), "/test/y_test.txt", sep="")
colnames(y_test)  <- c("activity")


#Reading and merging the activity description with the actual data.
activity_labels <- read.table(paste(getwd(), "/activity_labels.txt", sep=""))
colnames(activity_labels) <- c("activity", "activity_description")
y_test_activity_description <- merge(y_test, activity_labels, all.y_test=TRUE)

#Reading the subject data and assigning a column_name to it 
subject_test <- read.table(paste(getwd(), "/test/subject_test.txt", sep=""))
colnames(subject_test) <- c("Subject")

#Merging the 3data sets -- subject, activity description and the test data
merged_test_data <- cbind(subject_test, y_test_activity_description, subset_test_data)

####Reading train Data
train_data <- read.table(paste(getwd(), "/train/X_train.txt", sep=""))
colnames(train_data) <- featureList

#subsetting the merged_train_data with the columns having mean and std.
subset_train_data  <- train_data[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543)]

nrow(subset_train_data)

#Reading the activity labels data and the description and merging
y_train <- read.table(paste(getwd(), "/train/y_train.txt", sep=""))
colnames(y_train)  <- c("activity")


#Reading and merging the activity description with the actual data.
activity_labels <- read.table(paste(getwd(), "/activity_labels.txt", sep=""))
colnames(activity_labels) <- c("activity", "activity_description")
y_train_activity_description <- merge(y_train, activity_labels, all.y_train=TRUE)

#Reading the subject data and assigning a column_name to it 
subject_train <- read.table(paste(getwd(), "/train/subject_train.txt", sep=""))
colnames(subject_train) <- c("Subject")

#Merging the 3data sets -- subject, activity description and the train data
merged_train_data <- cbind(subject_train, y_train_activity_description, subset_train_data)



#Merging Test and train data
merged_data_all <- rbind(merged_test_data, merged_train_data)
before_tidy <- merged_data_all[,-2]


tidy <-aggregate(before_tidy[,3:68], by=list(merged_data_all$Subject,merged_data_all$activity_description), 
                    FUN=mean, na.rm=TRUE)
write.table(colnames(tidy), "c:/tidy_col.txt")

write.table(tidy, "C:/tidy.txt", row.name=FALSE)