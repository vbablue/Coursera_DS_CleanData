### Course Project: Getting and Cleaning Data

The project is about cleaning the data obtained from the smartphone sensor data. The data is divided into test and train data sets. It has features and the activity descriptions in separate files.

Goal of this R script is to extract the features, subset the feactures, extract the activity and mergin the activity description on to test and train data sets. 

Here's the order of the activities performed in the script :

##Cleaning the Test Data

1.  Read the features.txt file to form the features for both test and train data.
2.  Read the test data and assign the features from step#1 as column names.
3.  Subset the test data with mean and std columns. 
4. 	Read the y_test.txt file for activity data.
5.  Read the activity labels data  and merge the labels data with the actual data to get the activity description for each measurement.
6. 	Read the subject data and assign a column name to it.
7.  Bind all the 3 data sets (data, activity and subject) to form the final data set we will be working on.



### Cleaning the Train data
	Train data has a total of 561 columns and 7352 rows. Of these the columns with mean, and std are extracted and formed a separate data set.
	
	### Merging train and test data
	1.	Merge the two datasets (train and test) with rbind. The merged data set is called merged_test_data.
	
	
	### Create Tidy data
	1. Use the merge data set to create the tidy data. The tidy data contains the mean of the each column grouped at the Subject and activity level. 