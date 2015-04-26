library(data.table)
library(dplyr)
library(tidyr)
library(reshape)


# function to load data set, label the columns, and add "subject_id" and "activity_id" 
load_label_extract_data_set <- function(X_file, Y_file, subject_file,
                                        features_file="./features.txt", 
                                        activity_label_file="./activity_labels.txt") {
    # read features, subjects, activities, and activity_labels, adding meaningful column names
    features <- read.table(features_file,col.names=c("col_no","col_name"))
    subjects <- read.table(subject_file,col.names=c("subject_id"))
    activities <- read.table(Y_file,col.names=c("activity_id"))
    activity_names <- read.table(activity_label_file, col.names=c("activity_id","activity_name"))
    # 1. read X observations file, applying column names from features table, 
    # 2. select only mean and std columns, per assigment
    X_data <- read.table(X_file, header=F, col.names=features$col_name) %>%
            select(contains("mean"), contains("std"))
    # prepend "activity_id" and "subject_id" columns to our observations
    X_data <- cbind(activities, subjects, X_data)
    # add activity_name column by joining to activity_names table
    X_data <- merge(activity_names,X_data,by=c("activity_id"))
    # remove activity_id - no longer needed now we have activity_name
    X_data <- select(X_data, -activity_id)
    return(X_data)
}

# Steps 1-4: Load, label & extract desired columns from training and test data sets, and combine them into one table
training_data <- load_label_extract_data_set("train/X_train.txt","train/y_train.txt","train/subject_train.txt")
test_data <- load_label_extract_data_set("test/X_test.txt","test/y_test.txt","test/subject_test.txt")
all_data <- rbind(training_data,test_data)


# Step 5: Create new independent tidy data set with the average of each variable for each activity and each subject.
# Do this by:
# 1. melt the table to narrow format
# 1. group by activity_name, subject_id, and variable name
# 2. summarize to compute the average for each distinct activity, subject, and variable
# Result is a tidy data table, containing one observation per row, in 'narrow' format
tidy_narrow_summary_data <- all_data %>%
    melt(c("activity_name","subject_id")) %>%
    group_by(activity_name,subject_id,variable) %>%
    summarize(avg_value=mean(value)) 

# write the tidy data set to file
opfile="./tidy_narrow_summary_data.txt"
write.table(tidy_narrow_summary_data, opfile, row.names=F)
cat("Summarized data written to file: ", opfile) 

# Done





