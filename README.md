# This is the project for Getting and Cleaning data course
This script serves to combine and clean the data from a study using Sumsang smart phone to monitor human activities. The steps are:
Step 1. Download and understand the datasets
- There are two sets of data: the test and training data. Each set includes three files, the subject (listing subject id), x (observations for 561 variables), and y (list of activity code). 
- The features.txt file lists the names of the 561 variables for table x.
- The activity_labels.txt file gives the names of the activities coded in table y.

Step 2. Merges the training and the test sets to create one data set. This is done by combine the subject, x, and y tables by column for both test and train datasests and merge the two datasets by rows.

Step 3. Extracts only the measurements on the mean and standard deviation for each measurement. This is to only select the variables with either mean or std in their names.

Step 4. Appropriately labels the data set with descriptive variable names. This is to give the correspondent variable names from features.txt file to each variable, in addition to "subject_id" and "activity".

Step 5. Uses descriptive activity names to name the activities in the data set. This is done by seperate the datasets by activity codes, change the code to activity names, and merge the datasets again.

Step 6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. This is to group the dataframe by subject_id and activity. Each group pair has 60 observations. And the mean of those observations will be calculated for all variables and summarized to a new dataset.

