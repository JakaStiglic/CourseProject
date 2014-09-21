#This script does the following 5 steps 

#1)Merges the training and the test sets to create one data set.
#2.)Extracts only the measurements on the mean and standard deviation for each measurement. 
#3.)Uses descriptive activity names to name the activities in the data set
#4.)Appropriately labels the data set with descriptive variable names. 
#5.)From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.


#1.)
# Reading in set, labels and subjects for Test data set
x_test <-read.table("./data/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
test_labels <- read.table("./data/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
test_data <- cbind(subject_test,test_labels, x_test)


# Reading in set, labels and subjects for Train data set
x_train <-read.table("./data/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
train_labels <- read.table("./data/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
train_data <- cbind(subject_train, train_labels, x_train)

#Merging Test and Train data into MergedData
MergedData <- rbind(train_data,test_data)

# Reading in features and naming varaibles
feature_list <- read.table("./data/UCI HAR Dataset/features.txt",header = FALSE, sep = "")
names(MergedData) <- c("Subject", "Activity", as.character(feature_list$V2))


#2.)
#
# Extracting the measurments on mean and standard deviation (mean() and max() in the name)
#
#Note that measurments such as gravitymean, meanFreq, ... were also extracted
#
#Getting the number of Columns we want to extract
nCol <- grep("mean|std", names(MergedData), ignore.case = TRUE)
# Extracting Data
MergedData <- MergedData[,c(1,2,nCol)]



#3.)
#
# Reading in Activities and their related numbers
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt",header = FALSE, sep = "",
                              col.names = c("Number","Activity"))
#Renaming activities based on read in activity labels
for (i in 1:6) {
        MergedData$Activity <- gsub(activity_labels$Number[i],activity_labels$Activity[i],
                                       MergedData$Activity)
}

#4.)
#
# Removing "()" from the names
names(MergedData) <- gsub("()", "", names(MergedData), fixed = TRUE)
# substituting "BodyBody" for "Body"
names(MergedData) <- gsub("BodyBody", "Body", names(MergedData), fixed = TRUE)
# Sustituting Acc as Accelerometer and Gyro as Gyroscope.
names(MergedData) <- gsub("Acc", "Accelerometer", names(MergedData), fixed = TRUE)
names(MergedData) <- gsub("Gyro", "Gyroscope", names(MergedData), fixed = TRUE)

#5.)
#Creating Tidy Data (narrow representation with 4 columns)
#

library(reshape2)
#MeltData <- melt(Selected_Data,id=c("Subject","Activity"),measure.vars=c(-1,-2))
MeltData <- melt(MergedData,id=c("Subject","Activity"))
# changing "variable" name to "Measure"
names(MeltData)[3] <- "Measure"
TidyData <- ddply(MeltData, .(Subject, Activity, Measure), summarise, Average = mean(value))
# Writing data into TidyData.txt
write.table(TidyData, file = "TidyData.txt", row.name=FALSE)