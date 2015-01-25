run_analysis <- function() {
  ###### R SETTINGS FOR LOADING DATA #####
  ## Disable scienfitic notataion so scientific notation represented number don't 
  ## cause issues with the final summary table
  options(scipen=999)      
  
  ###### LOAD NEEDED LIBARIES ######
  ## It is assume  you have already downloaded and installed the plyr and dplyr R libraries
  ## failure to have these libraries installed on your system will result in the script failing.
  library(plyr)
  library(dplyr)
  
  ## This portion of the script assumes you have a project open and the current directory 
  ## is the working directory for the scirpt. In addition it assumes you either have an active 
  ## internet connect OR you have the "UCI HAR Dataset" present and unzipped in your currently 
  ## working directory.  Failure to have either of the above conditions may result in the script 
  ## failing up execution.
  
  ## define project script constants
  sourcefilename  <- "getdata-projectfiles-UCI HAR Dataset.zip"                                                  # define the source data file name
  sourcefileurl   <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"    # define the location where the source data file name can be downloaded from
  sourceroot      <- "UCI HAR Dataset"                                                                           # define the source data folder name
  finaloutputfile <- paste(getwd(),"UCI_HAR_Tidy_Dataset.txt",sep="/")                                           # define the output path and file name

  ###### DOWNLOAD AND UNZIP THE SOURCE FILE IF NEEDED ######
  # Checks to see if the source file exists in the current working directory
  if (!file.exists(sourcefilename)) {
    download.file(sourcefileurl,sourcefilename,mode="wb")  # If file doesn't exist download the source file as a binary
    unzip(sourcefilename,overwrite=TRUE)                   # Unzip the downloaded file and overwrite the existing folder and files
  }
  
  ###### READ ACTIVITY LABELS AND FEATURES DATA FILES INTO TABLES ######
  activity_labels <- read.table(paste(".",sourceroot,"activity_labels.txt",sep="/"),stringsAsFactors=FALSE)   # Load Activity Labels file into a data.frame
  features        <- read.table(paste(".",sourceroot,"features.txt",sep="/"))                                 # Load Features file into a data.frame
  
  ###### TRANSPOSE THE FEATURES TABLE AND IDENTIFY FEATURES VALUES WITH MEAN() AN STD() AND INDEX LOCATIONS ######
  features       <- t(features)                                              # Transpose the features data.frame into rows instead of columns 
  col_names_mean <- features[grep("mean\\()",features,ignore.case = TRUE)]   # Get column names with mean in the name
  col_names_std  <- features[grep("std\\()",features,ignore.case = TRUE)]    # Get column names with std in the name
  col_mean_idx   <- which(features[2, ] %in% col_names_mean,arr.ind=TRUE)    # Identify indexes of column names with mean
  col_std_idx    <- which(features[2, ] %in% col_names_std,arr.ind=TRUE)     # Identigy indexes of column locations with std
  
  ###### CLEAN UP FEATURES COLUMN NAMES BY REMOVING CHARACTERS WHICH COULD CAUSE ISSUES ######
  features[2, ] <- gsub("mean","Mean",features[2, ])          # Replace mean with Mean to maintain CamelCase
  features[2, ] <- gsub("std","Std",features[2, ])            # Replace std with Std to maintain CamelCase
  features[2, ] <- gsub("BodyBody","Body",features[2, ])      # Replace BodyBody with Body to remove duplicate words
  features[2, ] <- gsub("Acc","Acceleration",features[2, ])   # Replace Acc with Acceleration to be more descriptive
  features[2, ] <- gsub("Gyro","Gyroscope",features[2, ])     # Replace Gyro with Gyroscope to be more descriptive
  features[2, ] <- gsub("\\(","",features[2, ])               # Remove "(" open parenthasises from features column name
  features[2, ] <- gsub("\\)","",features[2, ])               # Remove "(" close parenthasises from features column name
  features[2, ] <- gsub("\\-","",features[2, ])               # Remove "-" minus sign  from features column name
  features[2, ] <- gsub("\\,","",features[2, ])               # Remove "," comma from features column name
  
  ## BELOW LINES MODIFY THE PREFIX UNIT REPRESENTATION OF "t" FOR TIME AND "f" FOR FORCE
  ## UNITS IN NAMED COLUMNS HAD TO BE MAINTAINED TO AVOID HAVING DUPLICATE COLUMN NAMES
  features[2, ] <- gsub("tBody","TimeBody",features[2, ])         # Replace "t" for tBody time unit with TimeBody to prevent duplicate column names
  features[2, ] <- gsub("tGravity","TimeGravity",features[2, ])   # Replace "t" for tGravity time unit with TimeGravity to prevent duplicate column names
  features[2, ] <- gsub("fBody","ForceBody",features[2, ])        # Replace "f" for fBody time unit with ForceBody to prevent duplicate column names
  
  ###### READ THE X AND Y FILES INTO TABLES ######
  X_test  <- read.table(paste(".",sourceroot,"test","X_test.txt",sep="/"))    # Load X file into a data.frame
  y_test  <- read.table(paste(".",sourceroot,"test","y_test.txt",sep="/"))    # Load y file into a data.frame
  X_train <- read.table(paste(".",sourceroot,"train","X_train.txt",sep="/"))  # Load X file into a data.frame
  y_train <- read.table(paste(".",sourceroot,"train","y_train.txt",sep="/"))  # Load y file into a data.frame 
  
  ###### ADD COLUMN NAMES TO X AND Y FILES, REMAP ACTIVITY VALUES TO HUMAN READABLE TEXT ######
  colnames(X_test)  <- features[2, ]     # Assign Feature (column names) to the X table
  colnames(y_test)  <- "Activity"        # Assign Activity as the column name for the data.frame
  colnames(X_train) <- features[2, ]     # Assign Feature (column names) to the X table
  colnames(y_train) <- "Activity"        # Assign Activity as the column name for the data.frame
  y_test$Activity   <- mapvalues(y_test$Activity,activity_labels[, 1],activity_labels[, 2])   # Remap Activity value numbers to the human readable version
  y_train$Activity  <- mapvalues(y_train$Activity,activity_labels[, 1],activity_labels[, 2])  # Remap Activity value numbers to the human readable version
  
  ##### REMOVE ALL OTHER COLUMNS WITHOUT MEAN AND STD IDENTIFIED EARLIER #####
  X_test  <- X_test[c(col_mean_idx,col_std_idx)]   # Remove columns that are not in the above two index lists
  X_train <- X_train[c(col_mean_idx,col_std_idx)]  # Remove columns that are not in the above two index lists  
  
  ###### READ SUBJECT TEST DATA FILE AND ADD COLUMN NAME TO FILE
  subject_test            <- read.table(paste(".",sourceroot,"test","subject_test.txt",sep="/"))    # Load Subject file into a data.frame
  subject_train           <- read.table(paste(".",sourceroot,"train","subject_train.txt",sep="/"))  # Load Subject file into a data.frame
  colnames(subject_test)  <- "Subject"   # Assign Subject as the column name for the Subjects data.frame
  colnames(subject_train) <- "Subject"   # Assign Subject as the column name for the Subjects data.frame
  
  ###### COMBINE SUBJECT TEST, Y AND X FILES INTO ONE TABLE AND MAP ACTIVITY ######
  X_test  <- cbind(subject_test,y_test,X_test)     # Add the Subject column to the X table
  X_train <- cbind(subject_train,y_train,X_train)  # Add the Subject column to the X table
  
  X_Total <- rbind(X_test,X_train)                      # Performs the final row binding of the X_test and X_train tables
  
  X_Total_Group_by<-group_by(X_Total,Subject,Activity)  # Creates table groups by the Subject and Activty Columns
  
  ## BELOW LINE OF CODE SUMMARIZE ALL THE COLUMNS (EXCEPT THE GROUPED COLUMNS - Subject and Activity) 
  ## BY CALCULATING THE MEAN OF THE GROUPS THEN OUTPUTS A DATA FRAME WHICH IS STORED IN MEMORY
  X_Total_Summarize<-summarize(X_Total_Group_by,TimeBodyAccelerationMeanX=mean(TimeBodyAccelerationMeanX),
                               TimeBodyAccelerationMeanY=mean(TimeBodyAccelerationMeanY),
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
  
  # WRITE OUT THE TIDY DATA SET TO A FILE IN THE WORKING DIRECTORY WITHOUT ROW NAMES
  write.table(X_Total_Summarize,file=finaloutputfile,row.names=FALSE)
  
  X_Total_Summarize   # Return Cleaned and Summarized Data For Viewing in R
}