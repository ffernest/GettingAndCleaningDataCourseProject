# CodeBook for Getting and Cleaning Data Course Project 
Describes the variables, the data, and any transformations or work that performed to clean up the data.

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
