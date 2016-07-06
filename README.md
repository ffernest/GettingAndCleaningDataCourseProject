# Getting And Cleaning Data Course Project
Coursera - Getting And Cleaning Data (Course Project)

The R script, run_analysis.R, is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Reference and Data Source: 
A full description is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To execute my script with aforesaid data, unzip the downloaded files (entire "UCI HAR Dataset" folder) and put my script to the working directory of RStudio. Then simple execute the script by sourcing it, i.e.

> source run_analysis.R

As my script requires some function of dplyr, it will load dplyr library in the very beginning.

Then one constant variable, nElement, will be defined. It is the number of elements of Inertial Signals.

The major data tidy up actions follows the criteria steps stated in the project assignment. The requirement steps include:
1.	Merges the training and the test sets to create one data set. (Use read.table and rbind to import data of trainging and test set and combined them.)
2.	Extracts only the measurements on the mean and standard deviation for each measurement. (Use select function to extract columns with mean() and std() in column name only.)
3.	Uses descriptive activity names to name the activities in the data set. (Use merge and cbind functions to join the data frame of activity names with other data frames.)
4.	Appropriately labels the data set with descriptive variable names. (Use gsub function to rename the column names to supported characters. Apply the column names to each data frame during read.table.)
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (Use sapply and split to calculate required average. Remove the columns without activity data.)

Finally the tidy data set created in step 5 of above instructions will be created as a txt file created with write.table() using row.name=FALSE.
