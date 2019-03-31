# Coursera-GettingCleaningData
Peer-graded assessment for "getting and cleaning data" course on Coursera

Explaining the "run_analysis.R" file.

Rule 3: open dplyr package because of the use of group_by() in rule 57 & summarise() in rule 58

Rules 5:18: open alle required files and give them proper column names immediately
Rules 21:33: rewrite the coded activiies to proper names
Rules 36:39: bind 6 dataframes together. Doing this in 1 set to not have to create even more variables

Rules 42 & 43: extract means & stdevs from the different measurements, exclusing the subject_Id & activity (hence only columns 3:563)
Rules 44 & 45: Bind the means & stdevs together and make sure they're a data frame, then load their proper column names

Rule 55: make a new dataset, with columns 1 & 2 being identical to the all_complete dataframe, but all other columns being combined into their mean
Rules 56:58: group the new dataframe and summarise them into printing their means as asked.
Rule 60: save the new file.

NOTE: I may have used quite long filenames & variablenames, but that's my style: I like to see what I'm working with.
