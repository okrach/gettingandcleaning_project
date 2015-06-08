feat <- read.delim(file="UCI HAR Dataset/features.txt",sep=" ",header=FALSE)
frm <- c("X16","F16")[as.numeric(grepl("-(mean|std)\\(",feat$V2))+1]
x_all <- rbind(read.fortran(file="UCI HAR Dataset/train/X_train.txt",format=frm,header=FALSE),read.fortran(file="UCI HAR Dataset/test/X_test.txt",format=frm,header=FALSE))
names(x_all) <- gsub("-","_",gsub("\\(\\)","",grep("-(mean|std)\\(",feat$V2,value = TRUE)))
y_all <- rbind(read.fortran(file="UCI HAR Dataset/train/y_train.txt",format="F1",header=FALSE),read.fortran(file="UCI HAR Dataset/test/y_test.txt",format="F1",header=FALSE))
act <- read.delim(file="UCI HAR Dataset/activity_labels.txt",header=FALSE,sep=" ")
x_all$activity <- act$V2[y_all$V1]
subject_all <- rbind(read.fortran(file="UCI HAR Dataset/train/subject_train.txt",format="F2",header=FALSE),read.fortran(file="UCI HAR Dataset/test/subject_test.txt",format="F2",header=FALSE))
x_all$subject <- sapply(subject_all$V1,function(i){paste0("subject_",i)})
library(dplyr)
x_summary <- summarise_each(group_by(x_all,activity,subject),funs(mean))
write.table(x_summary, row.names = FALSE, file = "AverageByActivityAndSubject.txt")
