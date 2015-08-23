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
The six data sets are then combined to form three global data sets `subjects`,`activities`, and `data_set`.   

**Step 2**
---
A list of features is read from a file into `features`.
The measurements on the mean and standard deviation are extracted from `data_set` using the `grep` function supplied with a regular expression. 
After such measurements are extracted, `data_set` is merged with `subjects` and `activities`.

**Step 3**
---
A list of activities' labels is read from a file into the list `activities_labels`.

**Step 4**
---
The columns in `data_set` are labeled with the descriptive variable names. 
The first two columns represent subjects and activities at this point.
Activities' decriptive indices are further replaced with their names from `activities_labels`.

**Step 5**
---
A tidy data set that contains with the average of each variable for each activity and each subject is created from `data_set` using the `summarise_each` function.
This data set is written out to the file `tidy_data_set.txt`.


