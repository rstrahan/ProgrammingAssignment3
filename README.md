# README notes for run_analysis.R 

##Use:
To use this script, please set the working directory in R to the "UCI HAR Dataset" directory. 
The working directory must contain files "features.txt", "activity_labels.txt" and the subdirectories "train" and "test"
The following R packages must be installed: data.table, dplyr, tidyr, reshape


##Output file:
The output file - the summarized tidy data set - is written to the working directory as: "tidy_narrow_summary_data.txt"
This data set may easily be read into R, using:
	tidyData <- read.table("tidy_narrow_summary_data.txt",header=T)
	head(tidyData)
The format of the output is an R data table, with headers, in narrow format, with the columns: "activity_name" "subject_id" "variable" "avg_value"
Each row represents the average for a specific variable (identified by "variable"), for a specific subject doing a specific activity.
Variables are described in the files features_info.txt/features.txt - supplied with the data set. Note that variable names have been altered slightly from the original list of variable names (features.txt) as the originals contained special characters not allowed in R column names. These characters "(),-" were replaced by a period character.
The output tidy data text file that meets the principles of tidy data described in course lectures, and on Coursera discussion: https://class.coursera.org/getdata-013/forum/thread?thread_id=31
See "codebook.md" for more information on the output data set.


##Program notes
The code in run_analysis.R works as follows:

1. load required R libraries

2. define a function - load_label_extract_data_set() - which is used to modularize loading and cleaning, to avoid duplication for the two supplied datasets. The required function arguments supply the relative path to the files for X, y, and subject data.
The following logic is performed:
* read features, subjects, activities, and activity_labels, adding meaningful column names to these datasets
* read X observations file, applying column names from features table using the col.names argument of read.data
* use select() to extract only the columns with either 'mean' or 'std' in the feature/column name
* use cbind() to add columns to identify subjects and activities
* use merge() to add the activity_name column by joining to activity_labels using the activity_id
* use select() to remove the activity_id column, which is no longer needed
* return the resulting data table.
	
3. Call function above for both train and test data, and combine observations using rbind()

4. Create the tidy summarized tidy data set by:
    * use melt() to convert the original 'wide' data into 'narrow' data with just 4 columns - activity_name, subject_id, variable, value
	* use group_by() to add grouping on the three factor columns - activity_name, subject_id, variable
	* use summarize to create a new data.table with column "avg_value", containing the mean of the "value" column for each group, 

5. Finally, use write.table() to write the tidy result data set to file, including column headers but no row headers
 

