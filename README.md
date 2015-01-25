---
title: "README"
output: html_document
---

**Course Name: **    Getting and Cleaning Data   
**Coursera Course:** getdata-010     

This is an **README** document for the project for Getting and Cleaning Data offered through Coursera and John Hopkins University January 2015.  This document will explain how to execute this attached R script run_analysis.R which will download a zip file, extract it, load the data into R and perform transformations on it and then return the resulting output to the user in the format of a text file.     

### Original Data Source

**Data Source:**    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Data File:**      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

### Prerequisits to execute this script:

The following conditions must be met to successfully execute this script.

1.  An R project is open with the below script saved in the current working directory of the project   
    
  + **R Script file:**  run_analysis.R

2.  The following R version and libraries must be installed.

  + **R Version:**  R Version 3.1.2

  + **Required Libraries:**  
    plyr Version 1.8.1    
    dplyr Version 0.3.0.2

3.  Must have one or the other of the following

  + An active internet connection **OR**   
  + have the "UCI HAR Dataset" downloaded, unzipped and present in the current working directory of the project.

### What does this script do?

This R script is a fully automated script and will perform in one of two ways.  Download the data if the data folder doesn't exists in the working directory or if the data has already been downloaded execute using the pre-existing data folder.

If the prerequisites are meet, the script will depending on the prerequisite conditions download the zipped source data file, unzip the file, load the data into R, perform transformations on the data and output a tidy data set.  This data set can then be used for peer review of the course project.

If the folder already exists then the script will load the data into R, perform transformations on the data and output a tidy data set.  This data set can then be used for peer review of the course project.

A brief summary of what this script does from the project page:   
**1.** Merges the training and the test sets to create one data set.   
**2.** Extracts only the measurements on the mean and standard deviation for each measurement.    
**3.** Uses descriptive activity names to name the activities in the data set    
**4.** Appropriately labels the data set with descriptive variable names.     
**5.** From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.   

### How do I run the script?

1.  You first must load the script using the "source" command at the R command line with the path to the file run_analysis.R    

2.  Once the file is loaded execute the below command in R.  This command will execute the script and return a data.frame that consists of the transformed and tidy data set.

> UCI_HAR_Tidy_Dataset<-runanalysis()

### How do I output the resulting data frame to a file.

1.  If you just executed the script there should be a file called "UCI_HAR_Tidy_Dataset.txt" in the current working directory of the project.

2.  If for some reason after executing the script you do not have the file "UCI_HAR_Tidy_Dataset.txt" in the working directory you can manually create the output by using the below command.   

> write.table(UCI_HAR_Tidy_Dataset,file="UCI_HAR_Tidy_Dataset.txt",row.names=FALSE)   

### If I have previously executed the script, how do I load the pre-existing data file into R    

1.  To load the previously executed data file into R, execute the below command at the R command prompt.   

> UCI_HAR_Tidy_Dataset<-read.table("UCI_HAR_Tidy_Dataset.txt",header=TRUE)    

### How does this code work?   

This code works through performing a series of configurations of the R environment, setting some defaults used for file names for storing and retrieving the data and then goes through a series of transformations to merge the data, eliminate or modify the data, column names and consolidates it from a complex federated data structure to one simplified table which is much easier to read and access by the user.    

1.  The first initial set of the code execution is to configure the environment.  The command "options(scipen=999)" is initially used to prevent R from interpreting and displaying the numerical values in scientific notation.  The scientific notation can cause problems for some mathematical library packages.  Therefore it is easiest to eliminate the use of scientific notation to avoid this problem.   

> options(scipen=999)

  + **How does "options(scipen=999)" contribute to making a tidy data set?**  The use of the "options(scipen=999)" helps make a tidy dataset by ensuring all the numerical values are represented in the same numerical format. 

2.  The script then loads the "plyr" and "dplyr" libraries to make accessible several methods and procedures needed to clean up and summarize the data later on in the script.    

> library(plyr)   
> library(dplyr)    

3.  These next lines of code create constants which the script will use for loading in the writing out the data files.   

>  sourcefilename  <- "getdata-projectfiles-UCI HAR Dataset.zip"      
>  sourcefileurl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"    
>  sourceroot      <- "UCI HAR Dataset"    
>  finaloutputfile <- paste(getwd(),"UCI_HAR_Tidy_Dataset.txt",sep="/")    

4.  This next segment of code will check if the source data folder exists in the working directory.  If it does not exist, it will download the file and unzip it so it is available for the script to manipulate.

>  if (!file.exists(sourcefilename)) {   
>    download.file(sourcefileurl,sourcefilename,mode="wb")    
>    unzip(sourcefilename,overwrite=TRUE)    
>  }   

5.  This next step reads in two files which contain the activity labels which each subject has performed and reads in the features which will eventually become the column names of the merged data set.

  + **How do these commands contribute to making a tidy data set?**  These command contribute to making a tidy data set by beginning the process of consolidating the separate table files in the source data folder into R, so they can be merged into one data table.

>  activity_labels <- read.table(paste(".",sourceroot,"activity_labels.txt",sep="/"),stringsAsFactors=FALSE) 
>  features        <- read.table(paste(".",sourceroot,"features.txt",sep="/"))    

6.  These next lines of code perform transformations on the features table and identifies which columns are going to be eliminated because the column names don't contain mean() and std() in the names.  

  + **How do these commands contribute to making a tidy data set?**  The first command transposes the features table from rows to column to align the names with the data columns table so they can be consolidated into one file.  The remaining lines of code identify the columns with mean() or std() in the column names, then identifies the index of those columns so any other columns can be removed from the file.  This helps create a tidy data set for eliminating columns which have confusing names and ensures that all the data in the table is of consistent quality and consistency for easy manipulation and interpretation.

>  features       <- t(features)                                               
>  col_names_mean <- features[grep("mean\\()",features,ignore.case = TRUE)]   
>  col_names_std  <- features[grep("std\\()",features,ignore.case = TRUE)]    
>  col_mean_idx   <- which(features[2, ] %in% col_names_mean,arr.ind=TRUE)    
>  col_std_idx    <- which(features[2, ] %in% col_names_std,arr.ind=TRUE)     

7.  The follow commands perform various manipulations on the features table to clean-up potential problematic character, normalize and make consistent column name formats and ensure abbreviated terms are converted into the full words so there isn't any confusion to what the terms mean.     

  + **How do these commands contribute to making a tidy data set?**  These command contribute to making a tidy data set by converting individual works in the column name to CamelCase to make them easily readable and distinguishable.  The commands also remove redundant terms such as "BodyBody".  While also removing redundant terms, the expansion of terms is also critical to making a tidy data set.  Abbreviated terms such as"Acc" to "Acceleration", and "Gyro" to "Gryoscope" clarify what the terms mean and continue to prevent confusion.  Finally, special characters are removed from the column names such as "(", ")", "-" and ","  as they can occasionally cause problems in R procedures and methods as they can have special meaning in the R language.

>  features[2, ] <- gsub("mean","Mean",features[2, ])          
>  features[2, ] <- gsub("std","Std",features[2, ])            
>  features[2, ] <- gsub("BodyBody","Body",features[2, ])      
>  features[2, ] <- gsub("Acc","Acceleration",features[2, ])   
>  features[2, ] <- gsub("Gyro","Gyroscope",features[2, ])     
>  features[2, ] <- gsub("\\(","",features[2, ])               
>  features[2, ] <- gsub("\\)","",features[2, ])               
>  features[2, ] <- gsub("\\-","",features[2, ])               
>  features[2, ] <- gsub("\\,","",features[2, ])

8.  The next commands make a few more additional changes to the column names to clarify terms.  In the original source data file the column names were prefixed with a "t" or "f" to indicate t=Time or f=Force.  These abbreviations are being expanded out to make their meaning more clear and stay inline with the original data source terms.  The possibility existed to remove these abbreviations from the column names, however there are a number of column names which are duplicated when the terms are removed.  For the sack of eliminating the need to explain duplicate columns the Time and Force terms were not removed but expanded out to prevent the issue of duplicate columns.

  + **How do these commands contribute to making a tidy data set?**  The commands contribute to a tidy data set by making clear what columns align which the original data set.  Without these terms the data and values could be confused with other values and preventing the miss-interpretation of the data.

>  features[2, ] <- gsub("tBody","TimeBody",features[2, ])         
>  features[2, ] <- gsub("tGravity","TimeGravity",features[2, ])   
>  features[2, ] <- gsub("fBody","ForceBody",features[2, ])        

9.  The below lines of code read the test and training data and subject table into data.frames into R.   

  + **How do these commands contribute to making a tidy data set?**  These command contribute to a tidy data set by continuing to set the stage to consolidate the data into a single data table.  Although nothing physically happens to the data at this point, the staging of these data is critical to the final consolidation and output.

>  X_test  <- read.table(paste(".",sourceroot,"test","X_test.txt",sep="/"))    
>  y_test  <- read.table(paste(".",sourceroot,"test","y_test.txt",sep="/"))    
>  X_train <- read.table(paste(".",sourceroot,"train","X_train.txt",sep="/"))  
>  y_train <- read.table(paste(".",sourceroot,"train","y_train.txt",sep="/"))   

10.  The below lines of code assign and modify column names of the previously loaded data.frames, the final two lines of code remap the subject activities from numbers to human readable terms.    

  + **How do these commands contribute to making a tidy data set?**  These manipulations of the X and y tables for the test and training data set so to modify the column names ensure the columns are readable by the user.  In addition, making these manipulations on the train and test data set in parallel will ensure data columns are not confused and inter-mixed leading to incorrect data being aligned and producing an end result.  Additionally the remapping of the activity value to human readable terms makes the values easily readable.

>  colnames(X_test)  <- features[2, ]     
>  colnames(y_test)  <- "Activity"        
>  colnames(X_train) <- features[2, ]     
>  colnames(y_train) <- "Activity"        
>  y_test$Activity   <- mapvalues(y_test$Activity,activity_labels[, 1],activity_labels[, 2])   
>  y_train$Activity  <- mapvalues(y_train$Activity,activity_labels[, 1],activity_labels[, 2])  

11.  The below two lines of code remove any columns which did not contain the terms mean() or std() from the original data set.

  + **How do these commands contribute to making a tidy data set?**  These steps contribute to creating a tidy data set be eliminated un-needed columns which do not service the purpose of this project.  Excess data columns in a data set make it more difficult to utilize the date and convey the intended purpose of the create of the tidy data set.  

>  X_test  <- X_test[c(col_mean_idx,col_std_idx)]   
>  X_train <- X_train[c(col_mean_idx,col_std_idx)]   

12.  The next lines of code read in the subject table which indicates the subject number that generated the data for each observation.  In addition to reading in the table the column name is defined so it is easily know that the column represents the subject number.

  + **How do these commands contribute to making a tidy data set?**  These command continue to consolidate the data and make appropriate labels and column names so it is clear to the user what the column represents.

>  subject_test            <- read.table(paste(".",sourceroot,"test","subject_test.txt",sep="/"))    
>  subject_train           <- read.table(paste(".",sourceroot,"train","subject_train.txt",sep="/"))  
>  colnames(subject_test)  <- "Subject"   
>  colnames(subject_train) <- "Subject" 

13.  This next step combines the individual columns together for the test and training sets into their respective tables.

  + **How do these commands contribute to making a tidy data set?**  This is the next major step in consolidating and making a tidy data set.  Combining the separated columns which existed in the original data set folder structure helps to eliminate complexity and confusion on how to find values for the training and test data set for this project. 

>  X_test  <- cbind(subject_test,y_test,X_test)     
>  X_train <- cbind(subject_train,y_train,X_train)   

14.  This command is the last step to combining all the data from the the source data files into one data set.    

  + **How do these commands contribute to making a tidy data set?**  This command performs the final combine of all the rows between the two data set (training and test) into one data table.  Once this step is completed all the data is consolidated into one table and organized with column names, data values and structured in the manner which is consistent of a tidy data set.  By performing this it is easy to review the data, perform analysis and manipulate the data for other purpose than in the original format provided by the data source provider.

>  X_Total <- rbind(X_test,X_train)

15.  Execute the group by command to define groups within the data set for further manipulation.

>  X_Total_Group_by<-group_by(X_Total,Subject,Activity) 

16.  This summarize command create an even more compact data set through calculating the mean of each data column and grouping those values by the subject and activity columns.


>  X_Total_Summarize<-summarize(X_Total_Group_by,TimeBodyAccelerationMeanX=mean(TimeBodyAccelerationMeanX),
>                               TimeBodyAccelerationMeanY=mean(TimeBodyAccelerationMeanY),
                               TimeBodyAccelerationMeanZ=mean(TimeBodyAccelerationMeanZ),
                               TimeGravityAccelerationMeanX=mean(TimeGravityAccelerationMeanX),
                               TimeGravityAccelerationMeanY=mean(TimeGravityAccelerationMeanY),
                               TimeGravityAccelerationMeanZ=mean(TimeGravityAccelerationMeanZ),
                               TimeBodyAccelerationJerkMeanX=mean(TimeBodyAccelerationJerkMeanX),
                               TimeBodyAccelerationJerkMeanY=mean(TimeBodyAccelerationJerkMeanY),
                               TimeBodyAccelerationJerkMeanZ=mean(TimeBodyAccelerationJerkMeanZ),
                               TimeBodyGyroscopeMeanX=mean(TimeBodyGyroscopeMeanX),
                               TimeBodyGyroscopeMeanY=mean(TimeBodyGyroscopeMeanY),
                               TimeBodyGyroscopeMeanZ=mean(TimeBodyGyroscopeMeanZ),
                               TimeBodyGyroscopeJerkMeanX=mean(TimeBodyGyroscopeJerkMeanX),
                               TimeBodyGyroscopeJerkMeanY=mean(TimeBodyGyroscopeJerkMeanY),
                               TimeBodyGyroscopeJerkMeanZ=mean(TimeBodyGyroscopeJerkMeanZ),
                               TimeBodyAccelerationMagMean=mean(TimeBodyAccelerationMagMean),
                               TimeGravityAccelerationMagMean=mean(TimeGravityAccelerationMagMean),
                               TimeBodyAccelerationJerkMagMean=mean(TimeBodyAccelerationJerkMagMean),
                               TimeBodyGyroscopeMagMean=mean(TimeBodyGyroscopeMagMean),
                               TimeBodyGyroscopeJerkMagMean=mean(TimeBodyGyroscopeJerkMagMean),
                               ForceBodyAccelerationMeanX=mean(ForceBodyAccelerationMeanX),
                               ForceBodyAccelerationMeanY=mean(ForceBodyAccelerationMeanY),
                               ForceBodyAccelerationMeanZ=mean(ForceBodyAccelerationMeanZ),
                               ForceBodyAccelerationJerkMeanX=mean(ForceBodyAccelerationJerkMeanX),
                               ForceBodyAccelerationJerkMeanY=mean(ForceBodyAccelerationJerkMeanY),
                               ForceBodyAccelerationJerkMeanZ=mean(ForceBodyAccelerationJerkMeanZ),
                               ForceBodyGyroscopeMeanX=mean(ForceBodyGyroscopeMeanX),
                               ForceBodyGyroscopeMeanY=mean(ForceBodyGyroscopeMeanY),
                               ForceBodyGyroscopeMeanZ=mean(ForceBodyGyroscopeMeanZ),
                               ForceBodyAccelerationMagMean=mean(ForceBodyAccelerationMagMean),
                               ForceBodyAccelerationJerkMagMean=mean(ForceBodyAccelerationJerkMagMean),
                               ForceBodyGyroscopeMagMean=mean(ForceBodyGyroscopeMagMean),
                               ForceBodyGyroscopeJerkMagMean=mean(ForceBodyGyroscopeJerkMagMean),
                               TimeBodyAccelerationStdX=mean(TimeBodyAccelerationStdX),
                               TimeBodyAccelerationStdY=mean(TimeBodyAccelerationStdY),
                               TimeBodyAccelerationStdZ=mean(TimeBodyAccelerationStdZ),
                               TimeGravityAccelerationStdX=mean(TimeGravityAccelerationStdX),
                               TimeGravityAccelerationStdY=mean(TimeGravityAccelerationStdY),
                               TimeGravityAccelerationStdZ=mean(TimeGravityAccelerationStdZ),
                               TimeBodyAccelerationJerkStdX=mean(TimeBodyAccelerationJerkStdX),
                               TimeBodyAccelerationJerkStdY=mean(TimeBodyAccelerationJerkStdY),
                               TimeBodyAccelerationJerkStdZ=mean(TimeBodyAccelerationJerkStdZ),
                               TimeBodyGyroscopeStdX=mean(TimeBodyGyroscopeStdX),
                               TimeBodyGyroscopeStdY=mean(TimeBodyGyroscopeStdY),
                               TimeBodyGyroscopeStdZ=mean(TimeBodyGyroscopeStdZ),
                               TimeBodyGyroscopeJerkStdX=mean(TimeBodyGyroscopeJerkStdX),
                               TimeBodyGyroscopeJerkStdY=mean(TimeBodyGyroscopeJerkStdY),
                               TimeBodyGyroscopeJerkStdZ=mean(TimeBodyGyroscopeJerkStdZ),
                               TimeBodyAccelerationMagStd=mean(TimeBodyAccelerationMagStd),
                               TimeGravityAccelerationMagStd=mean(TimeGravityAccelerationMagStd),
                               TimeBodyAccelerationJerkMagStd=mean(TimeBodyAccelerationJerkMagStd),
                               TimeBodyGyroscopeMagStd=mean(TimeBodyGyroscopeMagStd),
                               TimeBodyGyroscopeJerkMagStd=mean(TimeBodyGyroscopeJerkMagStd),
                               ForceBodyAccelerationStdX=mean(ForceBodyAccelerationStdX),
                               ForceBodyAccelerationStdY=mean(ForceBodyAccelerationStdY),
                               ForceBodyAccelerationStdZ=mean(ForceBodyAccelerationStdZ),
                               ForceBodyAccelerationJerkStdX=mean(ForceBodyAccelerationJerkStdX),
                               ForceBodyAccelerationJerkStdY=mean(ForceBodyAccelerationJerkStdY),
                               ForceBodyAccelerationJerkStdZ=mean(ForceBodyAccelerationJerkStdZ),
                               ForceBodyGyroscopeStdX=mean(ForceBodyGyroscopeStdX),
                               ForceBodyGyroscopeStdY=mean(ForceBodyGyroscopeStdY),
                               ForceBodyGyroscopeStdZ=mean(ForceBodyGyroscopeStdZ),
                               ForceBodyAccelerationMagStd=mean(ForceBodyAccelerationMagStd),
                               ForceBodyAccelerationJerkMagStd=mean(ForceBodyAccelerationJerkMagStd),
                               ForceBodyGyroscopeMagStd=mean(ForceBodyGyroscopeMagStd),
                               ForceBodyGyroscopeJerkMagStd=mean(ForceBodyGyroscopeJerkMagStd))
                               
17.   This final step writes the resulting summarize table to the local working directory.  

> write.table(X_Total_Summarize,file=finaloutputfile,row.names=FALSE)


## APPENDIX:

### Original Source Dataset README file:

Original data set prior to any manipulations for the run_analysis() script for this course project.

==================================================================    
Human Activity Recognition Using Smartphones Dataset     
Version 1.0    
==================================================================    
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.    
Smartlab - Non Linear Complex Systems Laboratory   
DITEN - Università degli Studi di Genova.   
Via Opera Pia 11A, I-16145, Genoa, Italy.   
activityrecognition@smartlab.ws   
www.smartlab.ws    
==================================================================    

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.



