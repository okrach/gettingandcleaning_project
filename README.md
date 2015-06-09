# gettingandcleaning_project
Material produced to fulfill the formal requirements of the Coursera Getting and Cleaning Data course.

The raw data http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (accessed on 05-JUN-2015) has been transformed using the script run_analysis.R included in this repo producing the output (tidy) dataset https://s3.amazonaws.com/coursera-uploads/user-c50198bb02cf09bc80bb5720/973502/asst-3/6f2769f00dd411e59500e3c7e0ef34d3.txt

The script has been developed and tested using R version 3.2.0 (2015-04-16) on Windows 7 Enterprise SP1 32-bit.

The script takes no argument. It assumes the raw data has been already unzipped into the current working directory.
It utilizes package dplyr in addition to standard R distribution.

Steps of the transformation in the script are:<br>
1. Read descriptive names of the measured variables [feat]<br>
2. Construct format/mask for reading mean & standard deviation variables from master raw data files [frm]<br>
3. Read both master data files (train & test subsamples) into a single data frame [x_all]<br>
4. Clean and assign descriptive names of the variables [names(x_all)]<br>
5. Read activity code for all measurements [y_all]<br>
6. Read descriptive names of activities [act]<br>
7. Label master data rows with descriptive activity names [x_all$activity]<br>
8. Read subject code for all measurements [subject_all]<br>
9. Label masted data rows with semi-descriptive subject names [x_all$subject]<br>
10. Load package [dplyr]<br>
11. Calculate averages of each of the measured variables per subject/activity combination [x_summary]<br>
12. Create the output (tidy data) file in the current working directory [AverageByActivityAndSubject.txt]<br>



