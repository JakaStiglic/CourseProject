
==========================================================================================

REPO

==========================================================================================

This repository contains the following files:

1.) "README.md"

2.) "The CodeBook.md" : describes the variables, the original data, and 
	transformations to obtain Tidy dataset

3) "run_analysis.R" : R script for performing the analysis and creating TidyData.txt



==========================================================================================

DATASET

==========================================================================================

As an input the following dataset is used:


Human Activity Recognition Using Smartphones Dataset
Version 1.0

==================================================================

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

Data can be downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data was then unziped and placed into ~R\UCI HAR Dataset directory. Folder structure
is crucial as the "run_analysis.R" script is reading the data from there. 

==========================================================================================

run_analysis.R

==========================================================================================

"run_analysis.R" script contains a code to run an analysis and obtain Tidy dataset.

This script does the following 5 steps
 
1) Merges the training and the test sets to create one data set.
2.) Extracts only the measurements on the mean and standard deviation for each measurement. 
3.) Uses descriptive activity names to name the activities in the data set
4.) Appropriately labels the data set with descriptive variable names. 
5.) From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

The script was run on R-3.1.1 version, and reshape2 library was used. To install reshape2
library on your computer, please run "install.packages("reshape2")" prior of running this script.


==========================================================================================


CodeBook.md

==========================================================================================

CodeBook containes all the useful information on the measurements and transformations on obtain 
Tidy dataset, that is created by running run_analysis.R script.



