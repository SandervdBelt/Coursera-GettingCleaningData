This script is an addition to to experiment by
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.

Original datafiles and full descriptin of their research can be found at 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


Explaining the run_analysis.R file: 
===================================

Rule 3: open dplyr package because of the use of group_by() in rule 57 & summarise() in rule 58

Rules 5:12: open all required files
Rules 15:21: bind the datasets into 1 large dataset
Rule 27: To avoid there being "-" characters in column names, which is a problem for R, replace - with _
Rule 29: assign the measurements to be column names and apporriately name the first 2 columns on the fly

Rules 32:34: Find all column names with subjectID, activity, mean() or std(), and remove the rest

Rules 39:44: Replace the numbers as used for the activities performed by the subjects by the actual adctivities

Rules 49:55: extract the column names into a vector, replace some shortened terms that may be confusion to people not familiar with movement science, then assign the new column names

Rules 60:62: make a new dataset, grouping the old by subjectID & activity, getting the mean for all other columns, using the dplyr package.

Rule 64: save the grouped dataset to the working directory in a .txt file called "means_per_subject_per_activity.txt"

NOTE: I may have used quite long filenames & variablenames, but that's my style: I like to see what I'm working with.
