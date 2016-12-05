# Getting-and-Cleaning-Data-Course-Project
This file will help to understand how the script works:
1) First of all script will read all the relevant data using read.table from the working directory.
2) Then it will add two new columns to "test" dataframe which are "subject" and "activity".
3) Again it will add two new columns to "train" dataframe which are "subject" and "activity".
4) Now using rbind() "test" and "train" dataframe will be merged together into "completeData" dataframe.
5) "meansstd" is a vector containing column numbers corresponding to mean and standard deviation data.
6) All columns other than "meanstd" will be removed from "completeData" dataframe.
7) Now it is grouped according to subject and activity.
8) The average of each variable for each activity and each subject will be calculated and stored in "tidyData" dataframe.
9)Finally "tidyData" dataframe will be printed into console.
