Original data file can be found via:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

This script relabels some of the frames from the original test:
  measurement_headers = features
  train_result = X-train
  test_result = X-test
  train_activity = y=train
  test_activity = y=test
  test_subjectID = subject_test
  train_subjectID = subject_train

The script creates the follwoing variables:
all_complete = A complete overview of test & training group data, with subjectID, activity & all measurementsd included in the original data
means_sd_measurements = a 561*2 tbl containing means & standard deviation for all 561 measurements. Is the average for all subjects over all activities
rowMeans = the mean for all measurements taken per row in the original dataset
means_per_subject_activity = rowMeans but grouped per subjectID & activity: rule 1 contains the mean across all measurements for subjectID == 1 & activity == 1 ("laying")

The script saves means_per_subject_activity in a .txt file in your working directory.

Have fun!
