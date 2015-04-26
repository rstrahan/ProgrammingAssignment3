# Human Activity Recognition Using Smartphones - Tidy Summarized Data Set 

Codebook for summarized tidy data set: tidy_narrow_summary_data.txt
April 26, 2015

# Data Set Creation
The dataset was produced using R script - run_analysis.R
The script processes a subset of the input data obtained from UCI Machine Learning Repository website - please reference description at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
A detailed description of the input dataset is provided in the the data download file: README.txt & features_info.txt


# Data Set Information
The data set contains 15480 observations (1 per row), with 4 variables, described as follows:
- $ activity_name: Factor w/ 6 levels "LAYING","SITTING",..: 1 1 1 1 1 1 1 1 1 1 ...
- $ subject_id   : int  1 1 1 1 1 1 1 1 1 1 ...
- $ variable     : Factor w/ 86 levels "angle.tBodyAccJerkMean..gravityMean.",..: 47 48 49 79 80 81 53 54 55 63 ...
- $ avg_value    : num  0.2216 -0.0405 -0.1132 -0.2489 0.7055 ...
 
## activity_name
A 6-level factor describing the activity associated with the observation 
Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS

## subject_id
Identifier representing the anonymous participant (out of 30) in the tests - 1:30

## variable
An 86-level factor containing the name of the variable identified in the observation - a subset of the 561 variables (or 'features') described in the input data set file - the subset represents only the mean and standard deviation variables from the input.
Refer to "features_info.txt" contained in the input data set for more detail related to the source and semantics of these variables.
(NOTE: special characters ['(),-] contained in the original names of the variables are replaced by "." to generate unique names compliant with R column naming requirements)
 [1] tBodyAcc.mean...X                    tBodyAcc.mean...Y                    tBodyAcc.mean...Z                   
 [4] tGravityAcc.mean...X                 tGravityAcc.mean...Y                 tGravityAcc.mean...Z                
 [7] tBodyAccJerk.mean...X                tBodyAccJerk.mean...Y                tBodyAccJerk.mean...Z               
[10] tBodyGyro.mean...X                   tBodyGyro.mean...Y                   tBodyGyro.mean...Z                  
[13] tBodyGyroJerk.mean...X               tBodyGyroJerk.mean...Y               tBodyGyroJerk.mean...Z              
[16] tBodyAccMag.mean..                   tGravityAccMag.mean..                tBodyAccJerkMag.mean..              
[19] tBodyGyroMag.mean..                  tBodyGyroJerkMag.mean..              fBodyAcc.mean...X                   
[22] fBodyAcc.mean...Y                    fBodyAcc.mean...Z                    fBodyAcc.meanFreq...X               
[25] fBodyAcc.meanFreq...Y                fBodyAcc.meanFreq...Z                fBodyAccJerk.mean...X               
[28] fBodyAccJerk.mean...Y                fBodyAccJerk.mean...Z                fBodyAccJerk.meanFreq...X           
[31] fBodyAccJerk.meanFreq...Y            fBodyAccJerk.meanFreq...Z            fBodyGyro.mean...X                  
[34] fBodyGyro.mean...Y                   fBodyGyro.mean...Z                   fBodyGyro.meanFreq...X              
[37] fBodyGyro.meanFreq...Y               fBodyGyro.meanFreq...Z               fBodyAccMag.mean..                  
[40] fBodyAccMag.meanFreq..               fBodyBodyAccJerkMag.mean..           fBodyBodyAccJerkMag.meanFreq..      
[43] fBodyBodyGyroMag.mean..              fBodyBodyGyroMag.meanFreq..          fBodyBodyGyroJerkMag.mean..         
[46] fBodyBodyGyroJerkMag.meanFreq..      angle.tBodyAccMean.gravity.          angle.tBodyAccJerkMean..gravityMean.
[49] angle.tBodyGyroMean.gravityMean.     angle.tBodyGyroJerkMean.gravityMean. angle.X.gravityMean.                
[52] angle.Y.gravityMean.                 angle.Z.gravityMean.                 tBodyAcc.std...X                    
[55] tBodyAcc.std...Y                     tBodyAcc.std...Z                     tGravityAcc.std...X                 
[58] tGravityAcc.std...Y                  tGravityAcc.std...Z                  tBodyAccJerk.std...X                
[61] tBodyAccJerk.std...Y                 tBodyAccJerk.std...Z                 tBodyGyro.std...X                   
[64] tBodyGyro.std...Y                    tBodyGyro.std...Z                    tBodyGyroJerk.std...X               
[67] tBodyGyroJerk.std...Y                tBodyGyroJerk.std...Z                tBodyAccMag.std..                   
[70] tGravityAccMag.std..                 tBodyAccJerkMag.std..                tBodyGyroMag.std..                  
[73] tBodyGyroJerkMag.std..               fBodyAcc.std...X                     fBodyAcc.std...Y                    
[76] fBodyAcc.std...Z                     fBodyAccJerk.std...X                 fBodyAccJerk.std...Y                
[79] fBodyAccJerk.std...Z                 fBodyGyro.std...X                    fBodyGyro.std...Y                   
[82] fBodyGyro.std...Z                    fBodyAccMag.std..                    fBodyBodyAccJerkMag.std..           
[85] fBodyBodyGyroMag.std..               fBodyBodyGyroJerkMag.std..          

## avg_value
A numeric value, containing the average of all the inputs for the specified variable, for the specified activity and subject.
> summary(data$avg_value)
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.99770 -0.94480 -0.29460 -0.38430 -0.01599  0.97450 
> str(data$avg_value)
 num [1:15480] 0.2216 -0.0405 -0.1132 -0.2489 0.7055 ...
 
 
 