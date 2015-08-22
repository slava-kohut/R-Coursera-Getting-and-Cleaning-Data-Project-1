#
# set up the directory
#

library(dplyr)
setwd("~/Desktop/DSS/3-getting-and-cleaning-data/data-set/UCI HAR Dataset/")

# STEP 1: merge the training and test sets
#
# 1.1 load the training set
# 1.2 load the test set
# 1.3 merge them
#
# run ncol() to see the sets have the same number of columns
#
# the size of the training set is 7352x561
# the size of the test set is 2497x561
#

training_set<-read.table("./train/X_train.txt")
activities_training_set<-read.table("./train/y_train.txt")
subjects_training_set<-read.table("./train/subject_train.txt")

test_set<-read.table("./test/X_test.txt")
activities_test_set<-read.table("./test/y_test.txt")
subjects_test_set<-read.table("./test/subject_test.txt")

subjects<-rbind(subjects_training_set,subjects_test_set)
activities<-rbind(activities_training_set,activities_test_set)
data_set<-rbind(training_set,test_set)

# STEP 2: extract only the measurements on the mean and standard deviation for each variable
# 2.1 load the features
# 2.2 identify measurements on the mean and standard deviation of each variable and extract them from the global data set
#

features<-readLines("./features.txt")
features<-read.table(text=features,colClasses = "character",sep=" ")
data_set<-data_set[,grep("^.+([s,S]td|[m,M]ean).+$",features[,2])]
data_set<-cbind(subjects,activities,data_set)


# STEP 3: use descriptive activity names to name the activities in the data set
# 3.1 load the labels
# 3.2 replace numbers with the corresponding strings in the data set
#

activities_labels<-readLines("./activity_labels.txt")
activities_labels<-read.table(text=activities_labels,colClasses = c("integer","character"),sep=" ")

# STEP 4: appropriately labels the data set with descriptive variable names
# 4.1 extract the variables' names
# 4.2 rename the columns
#

data_set_column_names<-c("subjects","activities",features[,2][grep("^.+([s,S]td|[m,M]ean).+$",features[,2])])
colnames(data_set)<-data_set_column_names
data_set$activities<-activities_labels[data_set$activities,2]

# STEP 5: create a tidy data set with the average of each variable for each activity and each subject

unique(data_set$activities)
tidy_data_set<-data_set %>% group_by(subjects,activities) %>% summarise_each(funs(mean))

# STEP 6: write out the data set

write.table(tidy_data_set,file="~/Desktop/DSS/3-getting-and-cleaning-data/tidy_data_set.txt",row.names=FALSE)
