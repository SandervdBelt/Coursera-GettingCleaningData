Original data file can be found via:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

This script relabels some of the frames from the original test:
  measurements = features
  train_result = X-train
  test_result = X-test
  train_activity = y=train
  test_activity = y=test
  test_subjectID = subject_test
  train_subjectID = subject_train

The script creates the following variables:
all_complete = A complete overview of test & training group data, with subjectID, activity & all measurementsd included in the original data
Columns 1 & 2 are integer vectors, all others numeric vectors
10299*563 tbl

all_mean_std = a copy of all_complete, but with only mean() and std() values.
Column 1 is an integer vector, 2 is a chacter vector, all others are numeric vectors
10299*68 tbl

grouped = a copy of all_mean_std, but grouped by the subjectID & activity columns. 
180*68 tbl

The script saves means_per_subject_activity in a .txt file in your working directory.

Have fun!
