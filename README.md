# Getting and Cleaning Data Course Project

The task was developing an R program to clean the source datasets from the **Human Activity Recognition Using Smartphones project**.

        ** Run_analysis.R** does the following.

	1. Merges the training and the test datasets to create one data set.
		* reads features.txt dataset to get features
		* reads activity_labels.txt to get the Activity names.
		* makes variable names descriptive
		* reads the X_train.txt , Subject_train.txt and Y_train.txt  
		* merges them based on row numbers; mind the order of the merge to retain Subject and Activity at first.
		* reads the X_test.txt , Subject_test.txt and Y_test.txt  
		* merges them based on row numbers; mind the order of the merge to retain Subject and Activity at first.
		* Also, mind to keep the same order as the train datasets.
		* merges the train and test datasets using rbind.
	2. Extracts only the measurements on the mean and standard deviation for each measurement.
		* searches for "-mean" and "-standard" in names of the resultant set.
	3. Creates a independent tidy data set with the average of each variable for each activity and each subject.
	4. Writes the tidy data set into a file.


This version of the project retains the source files from the Human Activity Recognition Using SmartPhones project in the same folder structure and adds the following files as part of the cleaning and tidying of the summary project. 

	a. **RunAnalysis.R** - the main code described as above.
	b. **tidy_data.txt** - the output file from the analysis.
	c. **CodeBook.md** - describes the fields and the contents of the tidy data set.

The RunAnalysis.R is designed to work if it is kept along side the "UCI HAR Dataset" folder containing the source files.

# This has been developed as an exercise from the "Getting and Cleaning Data" module course on Coursera.	 
