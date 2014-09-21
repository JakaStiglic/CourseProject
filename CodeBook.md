
=============================================================================================================

CODEBOOK 

==============================================================================================================

RAW DATA

==============================================================================================================
The original data are collected from the from the Samsung Galaxy S smartphone and are 
available on the following website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years and
split between train and test datasets. Each person performed six activities (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). See original dataset on how this data was collected and further
preprocessed.

==============================================================================================================

EXTRACTED DATA

==============================================================================================================
The two datasets were merged from where the mean and std (standard variation) variables were 
extracted for the following signals: 

tBodyAccelerometer-XYZ
tGravityAccelerometer-XYZ
tBodyAccelerometerJerk-XYZ
tBodyGyroscope-XYZ
tBodyGyroscopeJerk-XYZ
tBodyAccelerometerMag
tGravityAccelerometerMag
tBodyAccelerometerJerkMag
tBodyGyroscopeMag
tBodyGyroscopeJerkMag
fBodyAccelerometer-XYZ
fBodyAccelerometerJerk-XYZ
fBodyGyroscope-XYZ
fBodyAccelerometerMag
fBodyAccelerometerJerkMag
fBodyGyroscopeMag
fBodyGyroscopeJerkMag

Used naming convention is as follows:

- 3-axial (XYZ) raw signals from selected accelerometer and gyroscope features are denoted with X, Y or Z 
	(example tAcceleroeter-X and tGyroscope-Z)
- Signals are separted between Body and Gravity acceleration signals (tBodyAccelerometer-XYZ and tGravityAccelerometer-XYZ)
- Jerk denotes linear acceleration and angular velocity (tBodyAccelerometerJerk-XYZ and tBodyGyroscopeJerk-XY)
- Mag denotes the magnitude of these three-dimensional signals.  
- Accelerometer and Gyroscope tells were the feature is coming from
- prefix t denote time and f frequnecy.

In addition, angle() variable measurements were also extracted: 

gravityMean
tBodyAccelerometerMean
tBodyAccelerometerJerkMean
tBodyGyroscopeMean
tBodyGyroscopeJerkMean

Note that all of the features are normalized and bounded within [-1,1].
==============================================================================================================

TIDY DATASET

==============================================================================================================

Extracted dataset was then used to create an independent tidy dataset with 4 variables:

1.) Subject 
2.) Activity
3.) Measure
4.) Average

This data set was created by calculating the average of each variable for each activity and each subject.

- Subject: values from 1-30, showing participants number

- Activity: coresponding to one of the 6 activities:
		-WALKING,
		-WALKING_UPSTAIRS, 
		-WALKING_DOWNSTAIRS, 
		-SITTING, 
  		-STANDING, 
		-LAYING
  
- Measure: correspondin to one of the previously extracted signals 
	(such as tBodyAccelerometer-mean-X,BodyAccelerometer-mean-Y, ... )

- Value: coresponding average value for given Subject, Activity and Measure. As extracted values were 
  	normalized [-1,1], calculated average values will also take this range.
  
  
  
  
  
  

















