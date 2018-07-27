#1.Merges the training and the test sets to create one data set.
#1.1 read data

subject_test <- read.table("./test/subject_test.txt", sep = "", header = FALSE)
x_test <- read.table("./test/X_test.txt", sep = "", header = FALSE)
y_test <- read.table("./test/y_test.txt", sep = "", header = FALSE)

subject_train <- read.table("./train/subject_train.txt", sep = "", header = FALSE)
x_train <- read.table("./train/X_train.txt", sep = "", header = FALSE)
y_train <- read.table("./train/y_train.txt", sep = "", header = FALSE)

features <- read.table("./features.txt", sep = "", header = FALSE)

#1.2 combine data to one dataset

test <- cbind(subject_test, y_test, x_test)
train <- cbind(subject_train, y_train, x_train)
total <- rbind(test, train)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.

ms_features <- grep("mean|std", features[,2])
ms_total <- ms_features +2
sub <- subset(total, select = c(1, 2, ms_total))

#3.Appropriately labels the data set with descriptive variable names.

fnames <- as.character(features[ms_features, 2])
colnames <- c("subject_id", "activity", fnames)
colnames(sub) <- colnames

#4.Uses descriptive activity names to name the activities in the data set.

library(dplyr)

activity1 <- filter(sub, activity == "1")
activity2 <- filter(sub, activity == "2")
activity3 <- filter(sub, activity == "3")
activity4 <- filter(sub, activity == "4")
activity5 <- filter(sub, activity == "5")
activity6 <- filter(sub, activity == "6")

activity1 <- mutate(activity1, activity = "WALKING")
activity2 <- mutate(activity2, activity = "WALKING_UPSTAIRS")
activity3 <- mutate(activity3, activity = "WALKING_DOWNSTAIRS")
activity4 <- mutate(activity4, activity = "SITTING")
activity5 <- mutate(activity5, activity = "STANDING")
activity6 <- mutate(activity6, activity = "LAYING")

sub2 <- bind_rows(activity1, activity2, activity3, activity4, activity5, activity6)


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

sub_group <- group_by(sub2, subject_id, activity)
newdataset <- summarise_at(sub_group, -(1:2), mean)

write.table(newdataset, file = "cleandata.txt", row.names=FALSE)
