#Read in the 7 data sources.  Features are the measurements/variable/column names.
library(dplyr)
#dat are the measurements, 1 from test/1 from train
#activity are the 6 activities, 1 from test/1 from train
#subject is the person being measured, 1 from test/1 from train
dat <- read.table("X_test.txt")
activity <- read.table("y_test.txt")
subj <- read.table("subject_test.txt")
traindat <- read.table("X_train.txt")
trainactivity <- read.table("y_train.txt")
trainsubj <- read.table("subject_train.txt")
vars <- read.table("features.txt")
vars <- as.character(vars[,2])  #turn into simple list of variable names
vars <- make.names(vars, unique=TRUE, allow_ = TRUE)
#Merge the training and the test sets to create one data set.
test <- bind_cols(subj, activity, dat)   #put test set data together
train <- bind_cols(trainsubj, trainactivity, traindat)  #put train set data together
names(test)[1] <- "subject"
names(test)[2] <- "activity"
names(train)[1] <- "subject"
names(train)[2] <- "activity"
data <- bind_rows(test, train)   #put test and train full data together
names(data)[3:563] <- vars  #apply measurement names to columns
#
#Extracts only the measurements on the mean and standard deviation for each measurement. 
#
datameanstd <- select(data, subject, activity, contains("ean"), contains("std"))
#Uses descriptive activity names to name the activities in the data set

#Appropriately labels the data set with descriptive variable names. 

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.