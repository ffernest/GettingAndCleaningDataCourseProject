########################################################################
# Getting and Cleaning Data Course Project
# Student Name: FUNG WAI FUNG
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
features$feature_label <- gsub("\\(\\)", "", features$feature_label)
features$feature_label <- gsub("\\)$", "", features$feature_label)
features$feature_label <- gsub("\\)", "_", features$feature_label)
features$feature_label <- gsub("\\(", "_", features$feature_label)
features$feature_label <- gsub("-", "_", features$feature_label)
# List of volunteer subject IDs
subject <- rbind(read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = c("subject_id"), sep="", colClasses = "factor"), read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = c("subject_id"), sep="", colClasses = "factor"))
# Main data set
x <- rbind(read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE, sep="", col.names = features$feature_label, colClasses = "numeric"), read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE, sep="", col.names = features$feature_label, colClasses = "numeric"))
# Activity association
y <- rbind(read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep="", col.names = c("activity_id"), colClasses = "factor"), read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep="", col.names = c("activity_id"), colClasses = "factor"))

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std_x <- select(x, grep("_mean_|_std_", features$feature_label))

# Step 3: Uses descriptive activity names to name the activities in the data set
# Read the activity labels
activity_label <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("activity_id", "activity_label"), colClasses = "factor")
activity_mapping <- merge(activity_label, y, all = FALSE)
activity_main <- cbind(subject, activity = activity_mapping$activity_label, mean_std_x)

# Step 4: Appropriately labels the data set with descriptive variable names.
# Already done in step 1.

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
independent_tidy_data_set <- aggregate(. ~ subject_id + activity, data = activity_main, mean)
write.table(independent_tidy_data_set, file = "Week4_Course_Project_tidy_data_set.txt", row.name=FALSE)
