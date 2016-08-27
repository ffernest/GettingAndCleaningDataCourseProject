# Getting And Cleaning Data Course Project
Coursera - Getting And Cleaning Data (Course Project)

The R script, run_analysis.R, is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

Reference and Data Source: 
>- A full description is available at the site where the data was obtained:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
>- Here are the data for the project:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To execute my script with aforesaid data, unzip the downloaded files (entire "UCI HAR Dataset" folder) and put my script to the working directory of RStudio. Then simple execute the script by sourcing it, i.e.

> \> source('run_analysis.R')

For ease of executing my script, I added the commands to download data scource from internet to R working directory if "UCI HAR Dataset" folder does not exist.

As my script requires some functions of dplyr and reshape2 packages, it will load these libraries in the very beginning.

The major data tidy up actions follows the criteria steps stated in the project assignment. The requirement steps include:
>1.	Merges the training and test data sets to create one combined data set. (Use read.table and rbind functions to import data of training and test data sets and combined them.)
>2.	Extracts only the measurements on the mean and standard deviation value for each measurement. (Use select function with regular expression to extract only the columns with mean() and std() in column name.)
>3.	Uses descriptive activity names to name the activities in the data set. (Adopt levels function to convert activity ID to labels. Use merge and cbind functions to join the data frame of activity names with core data frames.)
>4.	Appropriately labels the data set with descriptive variable names. (Apply the column names read from features.txt to each data frame during read.table. Use make.names and gsub with regular expression to rename the column names to appropriate and supported characters. The variable names is intentionally maintained to avoid unnecessary misleading and for ease of reference from the original data source description.)
>5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. (Use aggreate function to calculate required average.)

Finally the tidy data set created in step 5 of above instructions will be created as a txt file created with write.table() using row.name=FALSE. It will generates a tidy data text file that meets below principles:
>1. Each variable forms a column. (First two columns are subject ID and the activity performed, each of remaining columns represent one type (mean or standard deviation ) of features.
>2. Each observation forms a row. (Each row represents the observation of features relate to specific activity performed by specific subject.)
>3. Each type of observational unit forms a table. (The result data set table represents the average (calculated by the mean function of R) of each variable for each activity and each subject.)

In order to read the final data set for later analysis, the output file can be read by the below command
> \> read.table("Week4_Course_project_tidy_data_set.txt", header=TRUE)
