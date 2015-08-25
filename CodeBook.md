The data source and code book were obtained from the following links

Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Code book: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Objective
To tidy the data-. this step includes loading and combining the test and train data sets. Add user friendly column and row labels for the data to form a complete and useful data set
Extract the data for mean and standard deviation from the combined data set

Data definition
The set of variables that were estimated from these signals are:
t: time
f:frequency domain signals
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


run_analysis.R

The wd variables stores the working directory of the user.

The url and fil variables store the URL from which the data file must be downloaded and the destination file it must be saved as.

The analysis() described in this code requires 8 parameters fil1 to fil8. Each of the points to a separate data file downloaded.
- fil1= "X_test.txt"
- fil2= "X_train.txt"
- fil3= "y_test.txt"
- fil4= "y_train.txt"
- fil5= "subject_test.txt"
- fil6= "subject_train.txt"
- fil7= "features.txt"
- fil8= "activity_labels.txt"

Each of these files are read into the following variables
- VARIABLE=FILE READ
- fXtest= "X_test.txt"
- fXtrain= "X_train.txt"
- fAtest= "y_test.txt"
- fAtrain= "y_train.txt"
- fStest= "subject_test.txt"
- fStrain= "subject_train.txt"
- rF= "features.txt"
- rAL= "activity_labels.txt"

The test and train files are combined and stored in the following variables
- rA= Activity data
- rS= Subject data
- rX= Features data

The labels are matched up for user friendly names in the following variables
- The activity labels are matched for user friendly text in rA
- The rS and rA variables containing the subject and activity labels are merged with the data in rX to form row labels
- The rF variable containing the features labels is merged with the data in rX to form the column labels

The rXms variable stores the labels matched for mean and standard deviation texts
The rMS variables stores the subset of rX for the mean and standard deviation data and this variable is written to a text file as the final tidy data.
