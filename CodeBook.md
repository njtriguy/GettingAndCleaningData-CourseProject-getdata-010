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
    
    
# APPENDIX

### ORIGINAL CODE BOOK

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.    

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).    

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).    

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.   

tBodyAcc-XYZ   
tGravityAcc-XYZ   
tBodyAccJerk-XYZ   
tBodyGyro-XYZ   
tBodyGyroJerk-XYZ   
tBodyAccMag   
tGravityAccMag   
tBodyAccJerkMag   
tBodyGyroMag   
tBodyGyroJerkMag   
fBodyAcc-XYZ   
fBodyAccJerk-XYZ   
fBodyGyro-XYZ   
fBodyAccMag   
fBodyAccJerkMag   
fBodyGyroMag   
fBodyGyroJerkMag   

The set of variables that were estimated from these signals are:    

mean(): Mean value   
std(): Standard deviation   
mad(): Median absolute deviation    
max(): Largest value in array   
min(): Smallest value in array   
sma(): Signal magnitude area   
energy(): Energy measure. Sum of the squares divided by the number of values.    
iqr(): Interquartile range    
entropy(): Signal entropy   
arCoeff(): Autorregresion coefficients with Burg order equal to 4   
correlation(): correlation coefficient between two signals   
maxInds(): index of the frequency component with largest magnitude   
meanFreq(): Weighted average of the frequency components to obtain a mean frequency   
skewness(): skewness of the frequency domain signal    
kurtosis(): kurtosis of the frequency domain signal    
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.   
angle(): Angle between to vectors.   

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:   

gravityMean   
tBodyAccMean   
tBodyAccJerkMean   
tBodyGyroMean   
tBodyGyroJerkMean   

The complete list of variables of each feature vector is available in 'features.txt'   
