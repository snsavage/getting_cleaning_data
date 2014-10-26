# Coursera - Getting & Cleaning Data - Course Project
## Based on the Human Activity Recognition Using Smartphones Data Set
### Created by snsavage

# Code Book
The data for this analysis is based on the Human Activity Recognition Using 
Smartphones Data Set at the UCI Machine Learning Repository.  Information on 
the original dataset can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the original dataset can be found 
[here] (http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).

## Dataset Description
This dataset provides a summary of the original complete dataset.  The data 
provides information on smartphone (Samsung Galaxy S II) embedded accelerometer 
and gyrospoce readings for 30 invidiuals as they each performed six different 
activities including: walking, walking upstairs, sitting, standing, and
laying.

Each row of this dataset shows the average sensor readings for a particular
individual performing a activity.  These are denoted by the subject_id and 
activity variables.  The other variables in each row are the average reading 
for that individual and activity from the smartphone sensors.  

In terms of a tidy data set, a "wide" dataset was selected for this analysis. 
This form was choosen since each row of sensor data is being used to predict
the given activity being performed.  Slicing the data in another way would make
this type of analysis more difficult.  For example, the data is now in a tidy
form that makes it easy to use with machine learning applications.  

These sensor variables were preprossessed in the original datset.  The link 
above provides a detailed explaination of that process.  

For this dataset, only the mean and standard deviation variables were included 
from the original data.  These are labled as "mean" and "std" in the final 
output.  Also, the data provides information on 3-axial signals.  These are 
labled as either X, Y or Z on the variable names.  

Variables labled with tAcc and tGyro are raw signals from the sensor.  The "t"" 
prefix denotes time.  The body and gravity acceleration signals are labled as
tBodyAcc and tGravityAcc.  The jerk signals are labeled as tBodyAccJerk and 
tBodyGyroJerk.  The magnitude of these signals are in variables labeled with 
"Mag".  Variables with an "f" prefix have had a Fast Fourier Transform applied.

Acc variables from the accelerometer are in standard gravity units.  Gyro
variables from the Gyroscope are in radians per second. 

## Variables
The following variables are included in the final analysis output:
* subject_id - ID of each subject in the study.    
* activity - Type of activity being performed for each observation. 
* tBodyAcc_mean_X	
* tBodyAcc_mean_Y	
* tBodyAcc_mean_Z	
* tBodyAcc_std_X	
* tBodyAcc_std_Y	
* tBodyAcc_std_Z	
* tGravityAcc_mean_X	
* tGravityAcc_mean_Y	
* tGravityAcc_mean_Z	
* tGravityAcc_std_X	
* tGravityAcc_std_Y	
* tGravityAcc_std_Z	
* tBodyAccJerk_mean_X	
* tBodyAccJerk_mean_Y	
* tBodyAccJerk_mean_Z	
* tBodyAccJerk_std_X	
* tBodyAccJerk_std_Y	
* tBodyAccJerk_std_Z	
* tBodyGyro_mean_X	
* tBodyGyro_mean_Y	
* tBodyGyro_mean_Z	
* tBodyGyro_std_X	
* tBodyGyro_std_Y	
* tBodyGyro_std_Z	
* tBodyGyroJerk_mean_X	
* tBodyGyroJerk_mean_Y	
* tBodyGyroJerk_mean_Z	
* tBodyGyroJerk_std_X	
* tBodyGyroJerk_std_Y	
* tBodyAccMag_mean	
* tBodyAccMag_std	
* tGravityAccMag_mean	
* tGravityAccMag_std	
* tBodyAccJerkMag_mean	
* tBodyAccJerkMag_std	
* tBodyGyroMag_mean	
* tBodyGyroMag_std	
* tBodyGyroJerkMag_mean	
* tBodyGyroJerkMag_std	
* fBodyAcc_mean_X	
* fBodyAcc_mean_Y	
* fBodyAcc_mean_Z	
* fBodyAcc_std_X	
* fBodyAcc_std_Y	
* fBodyAcc_std_Z	
* fBodyAccJerk_mean_X	
* fBodyAccJerk_mean_Y	
* fBodyAccJerk_mean_Z	
* fBodyAccJerk_std_X	
* fBodyAccJerk_std_Y	
* fBodyAccJerk_std_Z	
* fBodyGyro_mean_X	
* fBodyGyro_mean_Y	
* fBodyGyro_mean_Z	
* fBodyGyro_std_X	
* fBodyGyro_std_Y	
* fBodyGyro_std_Z	
* fBodyAccMag_mean	
* fBodyAccMag_std	
* fBodyBodyAccJerkMag_mean	
* fBodyBodyAccJerkMag_std	
* fBodyBodyGyroMag_mean	
* fBodyBodyGyroMag_std	
* fBodyBodyGyroJerkMag_mean	
* fBodyBodyGyroJerkMag_std
