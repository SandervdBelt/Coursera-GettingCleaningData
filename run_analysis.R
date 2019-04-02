## Getting and Cleaning data course project
## 1. Merges the training and the test sets to create one data set.
library(dplyr)

activity_labels <- read.table(".\\activity_labels.txt")
measurements <- read.table(".\\features.txt") #NOTE: these aren't unique, so make bad column headers, don't use them in a tbl you need to later work with!
test_result <- read.table(".\\test\\X_test.txt")
train_result <- read.table(".\\train\\X_train.txt")
test_activity <- read.table(".\\test\\y_test.txt")
train_activity <- read.table(".\\train\\y_train.txt")
test_subjectID <- read.table(".\\test\\subject_test.txt")
train_subjectID <- read.table(".\\train\\subject_train.txt")

#make into 1 dataset
all_complete <- rbind(
  cbind(test_subjectID, test_activity, test_result),
  cbind(train_subjectID, train_activity, train_result)
)

#remove loaded tables
rm(test_subjectID, test_activity, test_result, train_subjectID, train_activity, train_result)

#=======
#2: Extracts only the measurements on the mean and standard deviation for each measurement.
#=======
#Before I can use measurements$V2 as column names, I need to make them suitable, effectively meaning I have to replace all -'s with _'s
measurements <- gsub("-","_",measurements$V2)

names(all_complete) <- c("subjectID","activity", measurements)

#search for "subjectID", "activity", "mean()" or "std()" in the column names
columns_to_keep <- grepl("subjectID|activity|mean\\(\\)|std\\(\\)", colnames(all_complete))

all_mean_std <- all_complete[, columns_to_keep]

#=======
#3: Uses descriptive activity names to name the activities in the data set
#=======
all_mean_std$activity[which(all_mean_std$activity == 1)] <- "walking"
all_mean_std$activity[which(all_mean_std$activity == 2)] <- "walking_upstairs"
all_mean_std$activity[which(all_mean_std$activity == 3)] <- "walking_downstairs"
all_mean_std$activity[which(all_mean_std$activity == 4)] <- "sitting"
all_mean_std$activity[which(all_mean_std$activity == 5)] <- "standing"
all_mean_std$activity[which(all_mean_std$activity == 6)] <- "laying"

#=======
# 4. Appropriately labels the data set with descriptive variable names.
#=======
all_mean_std_columnnames <- names(all_mean_std)

all_mean_std_columnnames <- gsub("Acc", "Acceleration", all_mean_std_columnnames)
all_mean_std_columnnames <- gsub("Mag", "Magnitude", all_mean_std_columnnames)
#to me, as a human movement scientist, all (other) column names actually make perfect sense to me, just showing here I can change them

names(all_mean_std) <- all_mean_std_columnnames

#=======
## 5. From the data set in step 4, creates a second, independent tidy data set
## with the average of each variable for each activity and each subject.
#=======
grouped <- all_mean_std %>%
  group_by(subjectID, activity) %>%
  summarize_all(mean)                #This only works because I replaced the - by _ in the column names: took me ages to figure that out.

write.table(grouped, file=(".\\means_per_subject_per_activity.txt"), row.names = FALSE)

rm(all_mean_std_columnnames, columns_to_keep, measurements, activity_labels)
