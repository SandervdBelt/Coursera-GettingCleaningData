## Getting and Cleaning data course project
## 1. Merges the training and the test sets to create one data set.
library(dplyr)

activity_labels <- read.table(".\\activity_labels.txt")
measurement_headers <- read.table(".\\features.txt")
test_result <- read.table(".\\test\\X_test.txt")
  colnames(test_result) <- measurement_headers$V2
train_result <- read.table(".\\train\\X_train.txt")
  colnames(train_result) <- measurement_headers$V2
test_activity <- read.table(".\\test\\y_test.txt")
  colnames(test_activity) <- "activity"
train_activity <- read.table(".\\train\\y_train.txt")
  colnames(train_activity) <- "activity"
test_subjectID <- read.table(".\\test\\subject_test.txt")
  colnames(test_subjectID) <- "subjectID"
train_subjectID <- read.table(".\\train\\subject_train.txt")
  colnames(train_subjectID) <- "subjectID"

## Just to get myself familiar with the data, I recode the activities from numbers to actuals activities
test_activity$activity[which(test_activity$activity == 1)] <- "walking"
test_activity$activity[which(test_activity$activity == 2)] <- "walking_upstairs"
test_activity$activity[which(test_activity$activity == 3)] <- "walking_downstairs"
test_activity$activity[which(test_activity$activity == 4)] <- "sitting"
test_activity$activity[which(test_activity$activity == 5)] <- "standing"
test_activity$activity[which(test_activity$activity == 6)] <- "laying"

train_activity$activity[which(train_activity$activity == 1)] <- "walking"
train_activity$activity[which(train_activity$activity == 2)] <- "walking_upstairs"
train_activity$activity[which(train_activity$activity == 3)] <- "walking_downstairs"
train_activity$activity[which(train_activity$activity == 4)] <- "sitting"
train_activity$activity[which(train_activity$activity == 5)] <- "standing"
train_activity$activity[which(train_activity$activity == 6)] <- "laying"

## now make 1 dataset
all_complete <- rbind(
  cbind(test_subjectID, test_activity, test_result),
  cbind(train_subjectID, train_activity, train_result)
)
 
## 2. Extract only the measurements on the mean and standard deviation for each measurement.
means_measurements <- apply(all_complete[3:563], 2, mean)
stdevs_measurements <- apply(all_complete[3:563], 2, sd)
means_sd_measurements <- as.data.frame(rbind(means_measurements, stdevs_measurements))
colnames(means_sd_measurements) <- measurement_headers$V2

## 3. Uses descriptive activity names to name the activities in the data set
  ## Already did that in rules 21 to 33

## 4. Appropriately labels the data set with descriptive variable names.
  ## Already did that in rules 8, 10 & 45, I like my data to make sense as soon as possible.

## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
rowMeans <- data.frame(subjectID=all_complete[,1], activity=all_complete[,2], means=rowMeans(all_complete[,-(1:2)]))
means_per_subject_activity <- rowMeans %>%
  group_by(subjectID, activity) %>%
  summarise(mean(means))

write.table(means_per_subject_activity, file=(".\\means_per_subject_per_activity.txt"))
