########################################################################
# Getting and Cleaning Data Course Project
# Student Name: FUNG WAI FUNG
# Last Update: 2016/8/27
#
# This R script is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
# Reference and Data Source: 
# A full description is available at the site where the data was obtained:
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Here are the data for the project:
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
# The steps of this script:
# 1.	Merges the training and the test sets to create one data set.
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.	Uses descriptive activity names to name the activities in the data set
# 4.	Appropriately labels the data set with descriptive variable names.
# 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
########################################################################

# Download the data source file if it does not exist.
if (!file.exists("UCI HAR Dataset")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","datasrc.zip")
  unzip("datasrc.zip", exdir = getwd())
}

# Load requried libraries
library(dplyr)
library(reshape2)

# Step 1: Merges the training and the test sets to create one data set.
# Define the features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE, col.names = c("feature_id","feature_label"), sep="", colClasses = c("numeric","character"))
# List of volunteer subject IDs
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("subject_id"), sep="", colClasses = "factor")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("subject_id"), sep="", colClasses = "factor")
subject_combined <- rbind(subject_train, subject_test)
# Main data set
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep="", col.names = features$feature_label, colClasses = "numeric")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep="", col.names = features$feature_label, colClasses = "numeric")
x_combined <- rbind(x_train, x_test)
# Activity association
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep="", col.names = c("activity_id"), colClasses = "factor")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep="", col.names = c("activity_id"), colClasses = "factor")
y_combined <- rbind(y_train, y_test)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_x <- select(x_combined, grep("mean\\(\\)|std\\(\\)", features$feature_label))

# Step 3: Uses descriptive activity names to name the activities in the data set
# Read the activity labels
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("activity_id", "activity_label"), colClasses = "factor")
activity_mapping <- merge(activity_label, y_combined, all = FALSE)
activity_main <- cbind(subject_combined, activity = activity_mapping$activity_label, mean_std_x)

# Step 4: Appropriately labels the data set with descriptive variable names.
# Remove unnecessary dot(s)
names(activity_main) <- gsub("\\.$", "", gsub("\\.+", "\\.", make.names(names(activity_main))))

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
independent_tidy_data_set <- aggregate(. ~ subject_id + activity, data = activity_main, mean)
write.table(independent_tidy_data_set, file = "Week4_Course_Project_tidy_data_set.txt", row.name=FALSE)


