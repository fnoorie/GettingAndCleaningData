# GettingAndCleaningData
This repo contains the required scripts and data to analyze the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The is a project for "Getting and Cleaning Data".

# Requirements
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Submission
- source("run_analysis.R")
- View(finalData)
- Data is written into a file called finalData.txt
- The script assumes that the UCI HAR dataset is extracted to the same dierctory as well as dplyr is installed and loaded.
