---
title: "CodeBook"
output: html_document
---

### Original Data Source: 

**Data Source:**    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Data File:**      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 
### Notes: 
**Features Values:** Features are normalized and bounded within [-1,1].  Also in this final tidy dataset the values of the feature numerical columns is the mean calculation of multiple observations from the same subject and activity.  For Example: In these calculations the numerical columns are the mean of several already existing mean observations of the subject and activity.  In addition there are standard deviation values as column which have also had the mean value calculated on them.  

**Feature value units:**  Although the units of Time and Force are prefixed on the column names, they are references to the data in the original data set before the values were normalized and bound to [-1,1].  If the Time and Force indications were removed from the columns names duplicate columns would be created with identical names and thus causing an issue to reconcile the data. Therefore, the units remain in the column names to maintain the distinct columns and as a reference back to the original data source when one wishes to reproduce the outcome of this script.
    
**Column Name Nomenclature:**  Columns names have been modified from the original data source to coincide with tidy data properties.  Abbreviated names such as "Gyro" and "Acc" have been expanded to "Gyroscope" and "Acceleration".  Repeated words have been collapsed into one for cases such as "BodyBody" changed to "Body".  Special characters such as "(", ")", "-" and "," have been removed to avoid issues that may exists in the R environment .  Finally, the use of CamelCase has been implemented to make distinguishing the various words of the column names easier.

**Excluded Columns:**  From the original source dataset, many columns were excluded from this tidy data set.  For the purposes of this project any columns which did not "mean()" or "std()" other than the Subject or Activity columns were removed and not considered part of the final tidy data set.


# DATA DICTIONARY - UCI HAR TIDY DATASET

******
**Subject**    
Data type:  integer      
    1..30   .Subject identifier which is unique for each participant in the study    

******
**Activity**    
  Data type:  character  
    * LAYING                .Laying down activity which the subject participated in and observations were recorded   
    * SITTING               .Sitting in a chair activity which the subject participated in and observations were recorded    
    * STANDING              .Standing in one place without moving activity which the subject participated in and observations were recorded    
    * WALKING               .Walking on a level group while moving forward activity which the subject participated in and observations were recorded    
    * WALKING_DOWNSTAIRS    .Walking down stairs activity which the subject participated in and observations were recorded   
    * WALING_UPSTAIRS       .Walking up stairs activity which the subject participated in and observations were recorded    

******
**TimeBodyAccelerationMeanX**   
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable

******
**TimeBodyAccelerationMeanY**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******  
**TimeBodyAccelerationMeanZ**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationMeanX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******   
**TimeGravityAccelerationMeanY**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationMeanZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkMeanX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkMeanY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkMeanZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeMeanX**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeMeanY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeMeanZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkMeanX**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkMeanY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkMeanZ**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkMagMean**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******   
**ForceBodyAccelerationMeanX**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationMeanY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationMeanZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkMeanX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkMeanY**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkMeanZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeMeanX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeMeanY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******   
**ForceBodyGyroscopeMeanZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******   
**ForceBodyAccelerationJerkMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeJerkMagMean**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******   
**TimeBodyAccelerationStdX**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationStdY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationStdZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationStdX**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationStdY**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationStdZ**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkStdX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkStdY**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkStdZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeStdX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeStdY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeStdZ**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkStdX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkStdY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkStdZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationMagStd**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeGravityAccelerationMagStd**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyAccelerationJerkMagStd**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeMagStd**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**TimeBodyGyroscopeJerkMagStd**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationStdX**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationStdY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationStdZ**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkStdX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkStdY**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkStdZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeStdX**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeStdY**      
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeStdZ**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationMagStd**    
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyAccelerationJerkMagStd **   
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeMagStd**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
******    
**ForceBodyGyroscopeJerkMagStd**     
  Data type:  numeric    
    -1.0000000..1.000000  .unitless value within the range of -1.0 and 1.0 as the data was normalized against the mean value of the column variable
    
    
    
