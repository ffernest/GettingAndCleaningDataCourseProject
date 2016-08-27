# CodeBook for Getting and Cleaning Data Course Project 
Describes the variables, the data, and any transformations or work that performed to clean up the data.

Below list the script variables defined in run_analysis.R:  
>- features: data frame for the mapping of feature IDs and labels. 
>- subject_train: training set of subject data, data frame of subject ID, defines the ID of the subject for each measurement
>- subject_test: test set of subject data, data frame of subject ID, defines the ID of the subject for each measurement
>- subject_combined: combining data frame from subject_train and subject_test.
>- x_train: training set of core measurement data, date frame read from X_traing.txt.
>- x_test: test set of core measurement data, date frame read from X_test.txt.
>- x_combined: combined date frame from x_train and x_test.
>- y_train: date frame read from y_traing.txt, the activity ID for each measurement.
>- y_test: date frame read from y_test.txt, the activity ID for each measurement.
>- y_combined: combined date frame from y_traing and y_test.
>- mean_std_x: data frame for column subset of x, which contains the columns of mean() and std().
>- activity_label: character vector, defines the activity names, c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING").
>- y_label: descriptive label of activities stated in y.
>- activity_main: data frame combining subject ID, activity label and all measurement data.
>- independent_tidy_data_set: data frame of second tidy data set with the average of each variable for each activity and each subject.

Below describe the data defined or transformed in final data set:
> 1. The first two columne, subject_id and and activity, represents the key of the table. They are the ID of subject and descriptive naming of activity respectively. 

> 2. Remaining columns represent the average (calculated by mean function) values of specific features as the variable names. 
The features come from the accelerometer and gyroscope 3-axial raw signals tAcc.XYZ and tGyro.XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc.XYZ and tGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk.XYZ and tBodyGyroJerk.XYZ). Then a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc.XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
The set of variables that were estimated from these signals are average, mean(), and standard deviation, std(). 
Finally, the average of all measured feature values for specific subject doing specific activity is calculated.

> 3. Each row represents a set of average values of features for each subject and corresponding conducted activities. The row names are list below. 

> [1] "subject_id"                "activity"                  "tBodyAcc.mean.X"           "tBodyAcc.mean.Y"          
> [5] "tBodyAcc.mean.Z"           "tBodyAcc.std.X"            "tBodyAcc.std.Y"            "tBodyAcc.std.Z"           
> [9] "tGravityAcc.mean.X"        "tGravityAcc.mean.Y"        "tGravityAcc.mean.Z"        "tGravityAcc.std.X"        
> [13] "tGravityAcc.std.Y"         "tGravityAcc.std.Z"         "tBodyAccJerk.mean.X"       "tBodyAccJerk.mean.Y"      
> [17] "tBodyAccJerk.mean.Z"       "tBodyAccJerk.std.X"        "tBodyAccJerk.std.Y"        "tBodyAccJerk.std.Z"       
> [21] "tBodyGyro.mean.X"          "tBodyGyro.mean.Y"          "tBodyGyro.mean.Z"          "tBodyGyro.std.X"          
> [25] "tBodyGyro.std.Y"           "tBodyGyro.std.Z"           "tBodyGyroJerk.mean.X"      "tBodyGyroJerk.mean.Y"     
> [29] "tBodyGyroJerk.mean.Z"      "tBodyGyroJerk.std.X"       "tBodyGyroJerk.std.Y"       "tBodyGyroJerk.std.Z"      
> [33] "tBodyAccMag.mean"          "tBodyAccMag.std"           "tGravityAccMag.mean"       "tGravityAccMag.std"       
> [37] "tBodyAccJerkMag.mean"      "tBodyAccJerkMag.std"       "tBodyGyroMag.mean"         "tBodyGyroMag.std"         
> [41] "tBodyGyroJerkMag.mean"     "tBodyGyroJerkMag.std"      "fBodyAcc.mean.X"           "fBodyAcc.mean.Y"          
> [45] "fBodyAcc.mean.Z"           "fBodyAcc.std.X"            "fBodyAcc.std.Y"            "fBodyAcc.std.Z"           
> [49] "fBodyAccJerk.mean.X"       "fBodyAccJerk.mean.Y"       "fBodyAccJerk.mean.Z"       "fBodyAccJerk.std.X"       
> [53] "fBodyAccJerk.std.Y"        "fBodyAccJerk.std.Z"        "fBodyGyro.mean.X"          "fBodyGyro.mean.Y"         
> [57] "fBodyGyro.mean.Z"          "fBodyGyro.std.X"           "fBodyGyro.std.Y"           "fBodyGyro.std.Z"          
> [61] "fBodyAccMag.mean"          "fBodyAccMag.std"           "fBodyBodyAccJerkMag.mean"  "fBodyBodyAccJerkMag.std"  
> [65] "fBodyBodyGyroMag.mean"     "fBodyBodyGyroMag.std"      "fBodyBodyGyroJerkMag.mean" "fBodyBodyGyroJerkMag.std" 

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
