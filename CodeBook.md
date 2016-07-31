# CodeBook for Getting and Cleaning Data Course Project 
Describes the variables, the data, and any transformations or work that performed to clean up the data.

Below list the script variables defined in run_analysis.R:  
>- features: data frame for the mapping of feature IDs and labels. These labels are removed parentheses, "()", to avoid any potential handling difficulties of special characters for column name.
>- subject: data frame of subject ID, defines the ID of the subject for each measurement, combining data read from subject_train.txt and subject_test.txt.
>- x: date frame read from X_traing.txt and X_test.txt, the core data set.
>- y: date frame read from y_traing.txt and y_test.txt, the activity ID for each measurement.
>- mean_std_x: data frame for column subset of x, which contains the columns of mean() and std().
>- activity_label: character vector, defines the activity names, c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING").
>- activity_mapping: data frame mapping activity ID with activity labels.
>- activity_main: data frame combining subject ID, activity ID and all measurement data.
>- independent_tidy_data_set: data frame of second tidy data set with the average of each variable for each activity and each subject.

Below describe the data defined or transformed in final data set:
> 1. The first two columne, subject_id and and activity, represents the key of the table. They are the numeric ID of subject and descriptive naming of activity respectively. 
> 2. Remaining columns represent the average (calculated by mean function) values of specific features. 
The features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Then a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
The set of variables that were estimated from these signals are average, mean(), and standard deviation, std(). 
Finally, the average of all measured feature values for specific subject doing specific activity is calculated.

> 3. Each row represents a set of average values of features for each subject and corresponding conducted activities. The row names are list below. 

> [1] "subject_id"           "activity"             "tBodyAcc_mean_X"      "tBodyAcc_mean_Y"     
> [5] "tBodyAcc_mean_Z"      "tBodyAcc_std_X"       "tBodyAcc_std_Y"       "tBodyAcc_std_Z"      
> [9] "tGravityAcc_mean_X"   "tGravityAcc_mean_Y"   "tGravityAcc_mean_Z"   "tGravityAcc_std_X"   
> [13] "tGravityAcc_std_Y"    "tGravityAcc_std_Z"    "tBodyAccJerk_mean_X"  "tBodyAccJerk_mean_Y" 
> [17] "tBodyAccJerk_mean_Z"  "tBodyAccJerk_std_X"   "tBodyAccJerk_std_Y"   "tBodyAccJerk_std_Z"  
> [21] "tBodyGyro_mean_X"     "tBodyGyro_mean_Y"     "tBodyGyro_mean_Z"     "tBodyGyro_std_X"     
> [25] "tBodyGyro_std_Y"      "tBodyGyro_std_Z"      "tBodyGyroJerk_mean_X" "tBodyGyroJerk_mean_Y"
> [29] "tBodyGyroJerk_mean_Z" "tBodyGyroJerk_std_X"  "tBodyGyroJerk_std_Y"  "tBodyGyroJerk_std_Z" 
> [33] "fBodyAcc_mean_X"      "fBodyAcc_mean_Y"      "fBodyAcc_mean_Z"      "fBodyAcc_std_X"      
> [37] "fBodyAcc_std_Y"       "fBodyAcc_std_Z"       "fBodyAccJerk_mean_X"  "fBodyAccJerk_mean_Y" 
> [41] "fBodyAccJerk_mean_Z"  "fBodyAccJerk_std_X"   "fBodyAccJerk_std_Y"   "fBodyAccJerk_std_Z"  
> [45] "fBodyGyro_mean_X"     "fBodyGyro_mean_Y"     "fBodyGyro_mean_Z"     "fBodyGyro_std_X"     
> [49] "fBodyGyro_std_Y"      "fBodyGyro_std_Z"     

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

> For more information about the original dataset contact: activityrecognition@smartlab.ws

> License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

> This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

> Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
