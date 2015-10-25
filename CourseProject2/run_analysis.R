library(dplyr)

features <- read.table("UCI HAR Dataset/features.txt")
features <- features[,2]
xtest  <- read.table("UCI HAR Dataset/test/X_test.txt", nrows = -1)
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", nrows = -1)
alldata <- rbind(xtest, xtrain)

ytest <- read.table("UCI HAR Dataset/test/y_test.txt", nrows = -1)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt", nrows = -1)
labels <- rbind(ytest, ytrain)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
labels <- activity_labels[unlist(labels),2]

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", nrows = -1)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", nrows = -1)
subjects <- rbind(subject_test, subject_train)
subjects <- subjects[,1]

meanl <- grepl('mean', features)
stdl  <- grepl('std',  features)
meanstdl <- meanl | stdl

alldata <- alldata[,meanstdl]

names(alldata) <- features[meanstdl]

alldata$activity <- labels
alldata$subject  <- subjects

group <- group_by(alldata, activity, subject)
tidydata<- summarise_each(group, funs(mean))

names <- names(alldata)
names(tidydata) <- c('activity','subject',paste0('mean_of_',names[1:79]))
tidydata
