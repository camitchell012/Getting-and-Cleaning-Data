---
title: "Getting and Cleaning Data: Course Project CodeBook"
author: "Christopher Mitchell"
date: "Wednesday, April 22, 2015"
output: html_document
---

Getting and Cleaning Data: Course Project
=========================================

Data source
-----------
The original data set for this project was downloaded from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

This data was collected as part of the "Human Activity Recognition Using Smartphones Data Set" project which is discussed here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Feature Selection 
-----------------
The original dataset contains training and testing XYZ accelerometer data from a Samsung phone. Each record in this table corresponds to one subject performing 1 of 6 activities.  The features (columns) that are used in this project are those columns used for 


Run_Analysis.R Script
---------------------
The run_analysis.R script performs the following activities on this dataset:

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  creates a second, independent tidy data set with the average of each variable for each activity and each subject and writes this table to
disk (tidy.txt)


Tidy Data 
----------
The Tidy.txt dataset was created by taking the column means of the scrubbed accelarometer data, grouped and sorted by subject ID and activity.