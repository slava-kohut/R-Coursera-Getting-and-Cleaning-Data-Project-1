# Getting and Cleaning Data: Project 1
## code book for the data processing script 
---
The script *run-analysis.R* performs the following sequence of operations:

1. merges the training and test sets to create one data set
2. extracts only the measurements on the mean and standard deviation for each measurement
3. extracts descriptive activity names to name the activities in the data set
4. appropriately labels the data set with the descriptive activity names
5. from the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Step 1**
---
The training and test sets are loaded into `training_set` and `test_set`, respectively. 
Activities' list for the training and the test sets are loaded into into `activities_training_set` and `activities_test_set`, respectively.
A list of subjects performing activities for the training and test sets are loaded into `subjects_training_set` and `subjects_test_set`, respectively.
The `read.table()` function is used for reading data from external files. 
The six data sets are then combined to form three global data sets for the activities, subjects and data.  

**Step 2**
---

**Step 3**
---

**Step 4**
---

**Step 5**
---


