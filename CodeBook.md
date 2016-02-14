## Codebook for the Data cleaning - Assignment

The data is based on the following file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file was downloaded, unzipped and the train and test data merged.
The train data was obtained from the "X_train.txt" file, the test data from the "X_train.txt" file. Both of these files have a similar structure.

The features were selected which contain the measurements on the mean and standard deviation for each measurement. The feature names were added from the "features.txt" file.

The activity was converted to a factor variable using the "activity_labels.txt" file

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING

The subject (numbered from 1:30) was added to the data as well from the "subject_train.txt" and the  "subject_test.txt" files.

Finally for the new tidy data the mean of each measurement was calculated for each subject and each activity.