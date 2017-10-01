
#read test data
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt", header =F)
names(subject_test) <- "subject_id"
X_test<-read.table("UCI HAR Dataset/test/X_test.txt", header =F, comment.char="", col.names = feature_names$feature_name)
y_test<-read.table("UCI HAR Dataset/test/y_test.txt", header =F, col.names="activity_id")

#read train data
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt", header =F)
names(subject_train) <- "subject_id"
X_train<-read.table("UCI HAR Dataset/train/X_train.txt", header =F, comment.char="", col.names = feature_names$feature_name)
y_train<-read.table("UCI HAR Dataset/train/y_train.txt", header =F, col.names="activity_id")

#read feature names and activity labels
feature_names<-read.table("UCI HAR Dataset/features.txt", header =F, sep =" " , col.names = c("id", "feature_name"))
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("activity_id", "activity_description"))

#merge test and train data individually
testData<-cbind(subject_test, X_test, y_test)
trainData<-cbind(subject_train, X_train, y_train)

#toal data = train + test
data <- rbind(trainData, testData)

#only get measurements for mean and std, ignore rest
newdata<-data[ , grepl( "subject|mean|std|activity_id" , names( data ) ) ]
newdata<-newdata[ , !grepl( "meanFreq" , names( newdata ) ) ]

#merge the above data with activity labels to get descriptive activities
uciData <- merge(newdata, activity_labels, by.x = "activity_id", by.y = "activity_id", sort = FALSE)
uciData<-uciData[ , !grepl( "activity_id" , names( uciData ) ) ]

#More readable feature names
uciDataNames <- as.vector(names(uciData))
uciDataNames <- gsub("Acc", "_Acceleration", uciDataNames)
uciDataNames <- gsub("Mag", "_Magnitude", uciDataNames)
uciDataNames <- gsub("Jerk", "_jerk", uciDataNames)
uciDataNames <- gsub("Gyro", "_gyro", uciDataNames)
uciDataNames <- gsub("BodyBody", "Body", uciDataNames)
uciDataNames <- tolower(uciDataNames)

names(uciData) <- uciDataNames

#tidy data set with mean for each variable for each subject and activity combination
finalData <- aggregate(. ~subject_id + activity_description, uciData, mean)

#write final data to a file.
write.table(finalData, file="finalData.txt", row.names = FALSE)




