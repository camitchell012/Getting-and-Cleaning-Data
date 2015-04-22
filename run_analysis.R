#  Getting and Cleanind Data: Course Project
#  This R script is used to tidy up the accelerometer datasets
library(plyr)

# First, lets get the column names that we are interested. We will use this 
# information later to subset the data (and reduce memory usage)
col_names <- read.table("UCI HAR Dataset/features.txt")

# get columns indices and names with mean() or std() at the end of their names
mean_and_std_idx <- grep("-(mean|std)\\(\\)", col_names[, 2])
mean_and_std_names <- as.character(col_names[mean_and_std_idx, 2])

#
# Read the training datasets
#
# Read the data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
# subset the desired columns
x_train <- x_train[, mean_and_std_idx]
# Read activity table
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
# Read subject table
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
# Cobmine all three tables; column-wise
train_data <- cbind(subject_train, y_train, x_train)
# correct the column names
names(train_data) <- c("subject","activity",mean_and_std_names)

#
# Read the testing datasets
#
# Read the data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
# subset the desired columns
x_test <- x_test[, mean_and_std_idx]
# Read activity table
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
# Read subject table
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
# Cobmine all three tables; column-wise
test_data <- cbind(subject_test, y_test, x_test)
# correct the column names
names(test_data) <- c("subject","activity",mean_and_std_names)

# Combine the traing and testing data row-wise
all_data <- rbind (train_data, test_data)

# Update the activities column with descriptive strings
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
all_data[, 2] <- activities[all_data[, 2], 2]

# Compute the column means, group by subject and activity
average_data <- ddply(all_data, .(subject, activity), function(x) colMeans(subset(x, select=mean_and_std_names)))

# Write the average data to disk
write.table(average_data, "tidy.txt", row.name=FALSE)

