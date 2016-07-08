# CodeBook for Getting and Cleaning Data Course Project 
Describes the variables, the data, and any transformations or work that performed to clean up the data.

Below list the variables defined in run_script.R  
>- nElements: define the number of element of Inertial Signals data, which defined as 128.
>- activity_label: character vector, defines the activity names, c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING").
>- subject: data frame of subject ID, defines the ID of the subject for each measurement, combining data read from subject_train.txt and subject_test.txt.
>- x: date frame read from X_traing.txt and X_test.txt, the core data set.
>- y: date frame read from y_traing.txt and y_test.txt, the activity ID for each measurement.
>- readInertialSignals: function for reading training and test data set of Inertial Signals and combine to a data frame.
>- body_acc_x: data frame for body_acc_x data combined from body_acc_x_train.txt and body_acc_x_test.txt.
>- body_acc_y: data frame for body_acc_y data combined from body_acc_y_train.txt and body_acc_y_test.txt.
>- body_acc_z: data frame for body_acc_z data combined from body_acc_z_train.txt and body_acc_z_test.txt.
>- body_gyro_x: data frame for body_gyro_x data combined from body_gyro_x_train.txt and body_gyro_x_test.txt.
>- body_gyro_y: data frame for body_gyro_y data combined from body_gyro_y_train.txt and body_gyro_y_test.txt.
>- body_gyro_z: data frame for body_gyro_z data combined from body_gyro_z_train.txt and body_gyro_z_test.txt.
>- total_acc_x: data frame for total_acc_x data combined from total_acc_x_train.txt and total_acc_x_test.txt.
>- total_acc_y: data frame for total_acc_y data combined from total_acc_y_train.txt and total_acc_y_test.txt.
>- total_acc_z: data frame for total_acc_z data combined from total_acc_z_train.txt and total_acc_z_test.txt.
>- mean_std_x: data frame for column subset of x, which contains the columns of mean() and std().
>- activity_mapping: data frame mapping activity ID with activity labels.
>- activity_main: data frame combining subject ID, activity ID and all measurement data.
>- activity_main_2: data frame of second tidy data set with the average of each variable for each activity and each subject.

Below describe the data defined or transformed in final data set:
> 1. Each column represent all average (calculated by mean function) values of each variable (row) for each activity and each subject. The column name is in <subject_ID>.<activity_label> format. E.g. The column of 2.LAYING contains all avergae measurement values conduct by subject 2 during LAYING.
> 2. Each row represent specific average value of features for all subjects and conducted activities. Th row names are list below. 

> [1] "tBodyAcc_mean_X"      "tBodyAcc_mean_Y"      "tBodyAcc_mean_Z"      "tBodyAcc_std_X"       "tBodyAcc_std_Y"      
> [6] "tBodyAcc_std_Z"       "tGravityAcc_mean_X"   "tGravityAcc_mean_Y"   "tGravityAcc_mean_Z"   "tGravityAcc_std_X"   
> [11] "tGravityAcc_std_Y"    "tGravityAcc_std_Z"    "tBodyAccJerk_mean_X"  "tBodyAccJerk_mean_Y"  "tBodyAccJerk_mean_Z"  
> [16] "tBodyAccJerk_std_X"   "tBodyAccJerk_std_Y"   "tBodyAccJerk_std_Z"   "tBodyGyro_mean_X"     "tBodyGyro_mean_Y"     
> [21] "tBodyGyro_mean_Z"     "tBodyGyro_std_X"      "tBodyGyro_std_Y"      "tBodyGyro_std_Z"      "tBodyGyroJerk_mean_X"  
> [26] "tBodyGyroJerk_mean_Y" "tBodyGyroJerk_mean_Z" "tBodyGyroJerk_std_X"  "tBodyGyroJerk_std_Y"  "tBodyGyroJerk_std_Z"   
> [31] "fBodyAcc_mean_X"      "fBodyAcc_mean_Y"      "fBodyAcc_mean_Z"      "fBodyAcc_std_X"       "fBodyAcc_std_Y"        
> [36] "fBodyAcc_std_Z"       "fBodyAccJerk_mean_X"  "fBodyAccJerk_mean_Y"  "fBodyAccJerk_mean_Z"  "fBodyAccJerk_std_X"    
> [41] "fBodyAccJerk_std_Y"   "fBodyAccJerk_std_Z"   "fBodyGyro_mean_X"     "fBodyGyro_mean_Y"     "fBodyGyro_mean_Z"      
> [46] "fBodyGyro_std_X"      "fBodyGyro_std_Y"      "fBodyGyro_std_Z"     

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
