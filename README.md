# DataClean
Getting Data &amp; Cleaning

Objective
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_analysis.R
The run_analysis.R code performs the following;

1)	Checks if the data files exist in the working directory of the user

        a.	If the data directory “UCI HAR Dataset” exists then the code proceeds to step 2. 

        b.	Else, 

                i.	The code downloads the data file from the URL above.

                ii.	Unzips the directory and files within in the working directory

2)	Reads the following data files into separate tables

        a.	"X_test.txt"

        b.	"X_train.txt"

        c.	"y_test.txt"

        d.	"y_train.txt"

        e.	"subject_test.txt"

        f.	"subject_train.txt"

        g.	"features.txt"

        h.	"activity_labels.txt"

3)	Combines relevant data together to form the full set of data from both test and train studies

4)	Adds column and row names to the combined data

5)	Extracts the data for mean and standard deviation from the combined set

6)	Writes the data to a text file.
