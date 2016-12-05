library(dplyr)
library(stringr)

test <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
train <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
features <- read.table("C:/Users/vivek/Downloads/Data analysis/Course 3/data/getdata_2Fprojectfiles%2FUCI HAR Dataset/UCI HAR Dataset/features.txt")

test_labels_vector <- test_labels$V1
test_subject_vector <- test_subject$V1
test <- mutate(test,subject = test_subject_vector,activity = test_labels_vector)

train_labels_vector <- train_labels$V1
train_subject_vector <- train_subject$V1
train <- mutate(train,subject = train_subject_vector,activity = train_labels_vector)

completeData <- rbind(test,train)

meansstd <- grep("mean()|std()",features$V2)
completeData <- select(completeData,subject,activity,meansstd)
completeData <- group_by(completeData,subject,activity)
tidyData <- summarise_all(completeData,mean)
print(tidyData)