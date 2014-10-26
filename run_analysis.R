# run_analysis.R
# Coursera - Getting & Cleaning Data - Course Project
# Created by snsavage

# ***** Please note that this R script does not follow the exact order shown
# in the project description.  This was done to simplify handling
# the data.  The steps are marked where completed. *****  

# The data for this project is contained in six seperate files including
# subject, X and Y files for both training and testing datsets. 
# The following reads each of these six files.  Be sure to save the original
# dataset in your current working directory along with this analysis file.
# The original data can be found at: 
# http://archive.ics.uci.edu/ml/machine-learning-databases/
#       00240/UCI%20HAR%20Dataset.zip
#
# Information on the dataset can be found at:
# http://archive.ics.uci.edu/ml/datasets/
#       Human+Activity+Recognition+Using+Smartphones

# These files identify the subject for each feature vector.  
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                            header = FALSE, col.names = c("subject_id"))
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                           header = FALSE, col.names = c("subject_id"))

# These files include the feature vectors that were created from the 
# raw accelerometer and gyroscope data.  These are the explanatory variables.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)

# These files contain the activity being performed by the test subjects as
# the X data was recorded.  These are the response variables.  
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",
        header = FALSE, col.names = c("activity_num"))
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
        header = FALSE, col.names = c("activity_num"))

# The orginal data files don't contain feature names.  These feature names 
# are included in a seperate file packaged with the dataset download.
# Here the feature.txt file in imported and the feature names are applied
# to the X_train and X_test data files.  
variable_names <- read.table("./UCI HAR Dataset/features.txt", header = FALSE,
        col.names = c("column_number", "feature_name"))

names(X_train) <- variable_names$feature_name
names(X_test) <- variable_names$feature_name

# For this analysis, only the mean and standard deviation measurements 
# were kept.  col_to_keep corresponds to the column number for 
# each of those measurements.  
col_to_keep <- c(1, 2, 3, 4, 5, 6,
        41, 42, 43, 44, 45, 46,
        81, 82, 83, 84, 85, 86,
        121, 122, 123, 124, 125, 126,
        161, 162, 163, 164, 165,
        201, 202,
        214, 215,
        227, 228,
        240, 241,
        253, 254,
        266, 267, 268, 269, 270, 271,
        345, 346,347, 348, 349, 350,
        424, 425, 426, 427, 428, 429,
        503, 504,
        516, 517,
        529, 530,
        542, 543)

# ***** STEP 2 *****
# Extracts only the mean and standard deviation measurements 
# required for analysis.  
X_train_extract <- X_train[, col_to_keep]
X_test_extract <- X_test[, col_to_keep]

# Combines the subject identification, explanatory (X) and response (y)
# variables into a single data.frame.  A feature is added to identify 
# the original dataset as train or test.  This is helpful to identify the
# original data source after the train and test datasets are combined in the
# next step.
train <- cbind(subject_train, X_train_extract, y_train, dataset = "train")
test <- cbind(subject_test, X_test_extract, y_test, dataset = "test")

# ***** STEP 1 *****
# Combines the train and test data set into a single data.frame.
all_data <- rbind(train, test)

# ***** STEP 4 *****
# Cleans up remaining variable names.  

feature_names <- names(all_data)

feature_names <- sub("\\(\\)", "", feature_names)
feature_names <- sub("\\-", "_", feature_names)
feature_names <- sub("\\-", "_", feature_names)

names(all_data) <- feature_names

# ***** STEP 3 *****
# Here the activity lables are imported from the inluded activity_labels.txt
# file and merged with all_data to provide descriptive activity 
# names for each feature vector.  
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",
        header = FALSE, col.names = c("activity_num", "activity"))

analysis_data <- merge(x = all_data, y = activity_labels, 
        by.x = "activity_num", by.y ="activity_num", all.x = TRUE)

# ***** STEP 5 *****
library(dplyr)

# dplyr is used to create the final tidy data output.  First, two uneeded 
# columns are dropped activity_num and dataset.  Then, the data is arranged
# by subject_id and activity for easier readability.  The data is then
# grouped suject_id and activity.  Finally, the mean is calculated for each
# group.  
output <- analysis_data %>%
        select(subject_id, activity, tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std) %>%
        arrange(subject_id, activity) %>%
        group_by(subject_id, activity) %>%
        summarise_each(funs(mean))

write.table(output, "analysis_output.txt", row.names= FALSE)





