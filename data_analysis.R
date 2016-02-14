## Downloading and unzipping the data

setwd("D:/Projects/Coursera/03-Data_cleaning/w4/data-cleaning-assignment")
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "dataset.zip"
download.file(url, filename)
unzip(filename)


## Loading common data
activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

## Loading train data
train.data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train.activity <- read.table("./UCI HAR Dataset/train/y_train.txt")
train.subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Loading test data
test.data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test.activity <- read.table("./UCI HAR Dataset/test/y_test.txt")
test.subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## 1 Merging train and test data
merged.data <- rbind(train.data, test.data)

## 2 Extracting mean and std measurements
cols <- grep("mean\\(\\)|std\\(\\)", features[, 2])
selected.data <- merged.data[, cols]

## 4 Adding the feature names
names(selected.data) <- features[cols, 2]

## 3 Naming the activities
activity <- factor(rbind(train.activity, test.activity)[, 1], labels = activity.labels[, 2])

subject <- rbind(train.subjects, test.subjects)
names(subject) = "subject"

selected.data <- cbind(subject, activity, selected.data)

## 5 Creating new tidy data
new.tidy.data <- aggregate(. ~ subject+activity, data = selected.data, FUN = mean, na.rm = TRUE)
write.table(new.tidy.data, file = "tidy_data.txt", row.names = FALSE)
