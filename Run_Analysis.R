##############################################################################################################################################################
#		Run_analysis.R does the following.
#
#		1. Merges the training and the test datasets to create one data set.
#		2. Extracts only the measurements on the mean and standard deviation for each measurement.
#		3. Uses descriptive activity names to name the activities in the data set
#		4. Appropriately labels the data set with descriptive variable names.
#		5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#################################################################################################################################################################

#libraries 
library(reshape2)

#################################################################################################################################################################
#
#	PART - 1: Create a merged dataset using Train and Test files, and combining Activity, Subject labels.
#
#################################################################################################################################################################

#constants
cons_colNamesSubject <- "Subject"
cons_colNamesYfile <- "Activity"
rowno<- "rowno"
Activity<-"Activity"
colActivities<- c("Activity","Activity Name")

#read features to get features column names
featuresRec <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
colFeatures<-featuresRec[,2]

#Clean up Xtrain Column Names
colFeatures<- gsub("[()]","",colFeatures)

#make names descriptive,tidy separators. 
colFeatures<- gsub("^t","time-",colFeatures)
colFeatures<- gsub("^f","freq-",colFeatures)
colFeatures<- gsub("(Body){2}","Body",colFeatures)
colFeatures<- gsub("Body","Body-",colFeatures)
colFeatures<- gsub("Acc","Acceleration-",colFeatures)
colFeatures<- gsub("Gyro","AngularVelocity-",colFeatures)
colFeatures<- gsub("Jerk","Jerk-",colFeatures)
colFeatures<- gsub("Mag","Magnitude",colFeatures)
colFeatures<- gsub("Gravity","Gravity-",colFeatures)
colFeatures<- gsub("std","standard-deviation",colFeatures)
colFeatures<- gsub("--","-",colFeatures)

#read Desc Activity labels
activitiesRec <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names=colActivities,header=FALSE)


#read Train files.
subject_train <- read.csv("./UCI HAR Dataset/train/subject_train.txt",col.names=cons_colNamesSubject,header=FALSE)
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=colFeatures,sep="",header=FALSE,check.names=FALSE)
Ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt",sep="",col.names=cons_colNamesYfile,header=FALSE,check.names=FALSE)

#get Columns that have mean or std
meanOrStdCols <- grepl("-mean|-standard",colFeatures)
meanAndStdFeatures <- colFeatures[meanOrStdCols]

#get only relevant columns from Xtrain
Xtrain<-Xtrain[,meanAndStdFeatures]

#add additional columns in order to match. 

subject_train$rowno <- 1:nrow(subject_train)
Xtrain$rowno <- 1:nrow(Xtrain)
Ytrain$rowno <- 1:nrow(Ytrain)

#merge on column rowno. 
activityFile <- merge(Ytrain,activitiesRec,by=Activity)
tempMergeData <- merge(subject_train,activityFile,by=rowno)
mergedTrainData <- merge(tempMergeData,Xtrain,by=rowno)


#read Test files.
subject_test <- read.csv("./UCI HAR Dataset/test/subject_test.txt",col.names=cons_colNamesSubject,header=FALSE)
Xtest <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=colFeatures,sep="",header=FALSE,check.names=FALSE)
Ytest <- read.table("./UCI HAR Dataset/test/y_test.txt",sep="",col.names=cons_colNamesYfile,header=FALSE,check.names=FALSE)

#get only relevant columns from Xtest
Xtest <-Xtest[,meanAndStdFeatures]

#add additional columns in order to match. 
subject_test$rowno <- 1:nrow(subject_test)
Xtest$rowno <- 1:nrow(Xtest)
Ytest$rowno <- 1:nrow(Ytest)

#merge on column rowno. 
activityFile <- merge(Ytest,activitiesRec,by=Activity)
tempMergeData <- merge(subject_test,activityFile,by=rowno)
mergedTestData <- merge(tempMergeData,Xtest,by=rowno)

#vertical merge of Train and Test Data
allData <- rbind(mergedTrainData, mergedTestData)

#tidy the columns, drop rowno
drops <- c("rowno")
allData <- allData[,!(names(allData) %in% drops)]

#################################################################################################################################################################
#
#	PART - 2: Summarising Means.
#
#################################################################################################################################################################

#summarising averages to create a tidy dataset.
idColumns<- c("Subject","Activity","Activity.Name")
variableFeatures <- meanAndStdFeatures

allDataMelt <- melt(allData,id=idColumns,measure.vars=variableFeatures)
summaryData <- dcast(allDataMelt,Subject+Activity.Name~variable,mean)

# Write to file
write.table(summaryData, file="tidy_data.txt")