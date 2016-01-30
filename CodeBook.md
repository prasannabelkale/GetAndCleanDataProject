The task was about using th.e **Human Activity Recognition Using Smartphones Dataset** conduted by the following team:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The field descriptions of the original source are specified in the features_info.txt file under UCI HAR Dataset folder.

The output tidy_data.txt has obtained by running Run_Analysis.R on the datasets from UCI Har Dataset. Effectively, Run_Analysis.R:

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

The tidy data set contains the above data set summarised as average of means of standard deviation data at subject and activitiy level and contains the Subject, Activity Name and 79 additional fields, as mentioned below. 

* Subject
* Activity.Name
* time-Body-Acceleration-mean-X
* time-Body-Acceleration-mean-Y
* time-Body-Acceleration-mean-Z
* time-Body-Acceleration-standard-deviation-X
* time-Body-Acceleration-standard-deviation-Y
* time-Body-Acceleration-standard-deviation-Z
* time-Gravity-Acceleration-mean-X
* time-Gravity-Acceleration-mean-Y
* time-Gravity-Acceleration-mean-Z
* time-Gravity-Acceleration-standard-deviation-X
* time-Gravity-Acceleration-standard-deviation-Y
* time-Gravity-Acceleration-standard-deviation-Z
* time-Body-Acceleration-Jerk-mean-X
* time-Body-Acceleration-Jerk-mean-Y
* time-Body-Acceleration-Jerk-mean-Z
* time-Body-Acceleration-Jerk-standard-deviation-X
* time-Body-Acceleration-Jerk-standard-deviation-Y
* time-Body-Acceleration-Jerk-standard-deviation-Z
* time-Body-AngularVelocity-mean-X
* time-Body-AngularVelocity-mean-Y
* time-Body-AngularVelocity-mean-Z
* time-Body-AngularVelocity-standard-deviation-X
* time-Body-AngularVelocity-standard-deviation-Y
* time-Body-AngularVelocity-standard-deviation-Z
* time-Body-AngularVelocity-Jerk-mean-X
* time-Body-AngularVelocity-Jerk-mean-Y
* time-Body-AngularVelocity-Jerk-mean-Z
* time-Body-AngularVelocity-Jerk-standard-deviation-X
* time-Body-AngularVelocity-Jerk-standard-deviation-Y
* time-Body-AngularVelocity-Jerk-standard-deviation-Z
* time-Body-Acceleration-Magnitude-mean
* time-Body-Acceleration-Magnitude-standard-deviation
* time-Gravity-Acceleration-Magnitude-mean
* time-Gravity-Acceleration-Magnitude-standard-deviation
* time-Body-Acceleration-Jerk-Magnitude-mean
* time-Body-Acceleration-Jerk-Magnitude-standard-deviation
* time-Body-AngularVelocity-Magnitude-mean
* time-Body-AngularVelocity-Magnitude-standard-deviation
* time-Body-AngularVelocity-Jerk-Magnitude-mean
* time-Body-AngularVelocity-Jerk-Magnitude-standard-deviation
* freq-Body-Acceleration-mean-X
* freq-Body-Acceleration-mean-Y
* freq-Body-Acceleration-mean-Z
* freq-Body-Acceleration-standard-deviation-X
* freq-Body-Acceleration-standard-deviation-Y
* freq-Body-Acceleration-standard-deviation-Z
* freq-Body-Acceleration-meanFreq-X
* freq-Body-Acceleration-meanFreq-Y
* freq-Body-Acceleration-meanFreq-Z
* freq-Body-Acceleration-Jerk-mean-X
* freq-Body-Acceleration-Jerk-mean-Y
* freq-Body-Acceleration-Jerk-mean-Z
* freq-Body-Acceleration-Jerk-standard-deviation-X
* freq-Body-Acceleration-Jerk-standard-deviation-Y
* freq-Body-Acceleration-Jerk-standard-deviation-Z
* freq-Body-Acceleration-Jerk-meanFreq-X
* freq-Body-Acceleration-Jerk-meanFreq-Y
* freq-Body-Acceleration-Jerk-meanFreq-Z
* freq-Body-AngularVelocity-mean-X
* freq-Body-AngularVelocity-mean-Y
* freq-Body-AngularVelocity-mean-Z
* freq-Body-AngularVelocity-standard-deviation-X
* freq-Body-AngularVelocity-standard-deviation-Y
* freq-Body-AngularVelocity-standard-deviation-Z
* freq-Body-AngularVelocity-meanFreq-X
* freq-Body-AngularVelocity-meanFreq-Y
* freq-Body-AngularVelocity-meanFreq-Z
* freq-Body-Acceleration-Magnitude-mean
* freq-Body-Acceleration-Magnitude-standard-deviation
* freq-Body-Acceleration-Magnitude-meanFreq
* freq-Body-Acceleration-Jerk-Magnitude-mean
* freq-Body-Acceleration-Jerk-Magnitude-standard-deviation
* freq-Body-Acceleration-Jerk-Magnitude-meanFreq
* freq-Body-AngularVelocity-Magnitude-mean
* freq-Body-AngularVelocity-Magnitude-standard-deviation
* freq-Body-AngularVelocity-Magnitude-meanFreq
* freq-Body-AngularVelocity-Jerk-Magnitude-mean
* freq-Body-AngularVelocity-Jerk-Magnitude-standard-deviation
* freq-Body-AngularVelocity-Jerk-Magnitude-meanFreq

The time- fields are on time domain and those with freq- are in the frequency domain. The fields have been expanded to be more meaningful. 

Note: In this version, the Run_Analysis.R expects it is kept in the same folder as the folder "UCI HAR Dataset" of the source project.

