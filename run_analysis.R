analysis<- function(fil1="X_test.txt",fil2="X_train.txt",fil3="y_test.txt",fil4="y_train.txt",fil5="subject_test.txt",fil6="subject_train.txt",fil7="features.txt",fil8="activity_labels.txt"){
  library(dplyr)

#Checking if data files exist
  wd=getwd()

  fdir="UCI HAR Dataset"
  if(!dir.exists(fdir)){
    url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    fil="dcproject.zip"
    download.file(url,fil)
    unzip(fil)
  }

#reading activity, subject, feature data and labels
  fdir=paste(wd,"UCI HAR Dataset/test",fil1,sep="/")

  fXtest<-read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset/test",fil3,sep="/")
  fAtest<-read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset/test",fil5,sep="/")
  fStest<-read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset/train",fil2,sep="/")

  fXtrain<-read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset/train",fil4,sep="/")
  fAtrain<-read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset/train",fil6,sep="/")
  fStrain<-read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset",fil7,sep="/")
  rF<- read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

  fdir=paste(wd,"UCI HAR Dataset",fil8,sep="/")
  rAL<- read.table(fdir,header=F,blank.lines.skip=T,stringsAsFactors=F,na.strings=c("NA","Not Available"," "))

#merging activity, subject and features data
  rA<-rbind(fAtrain,fAtest)
  rS<-rbind(fStrain,fStest)
  rX<-rbind(fXtrain,fXtest)
#naming columns and row
  rA <- left_join(rA,rAL,by="V1")
  colnames(rX)<-rF$V2
  cSA<- cbind(rS,rA$V2)
  colnames(cSA)<-c("subject","activity")
  rX<-cbind(cSA,rX)


#Extracting data for mean or standard deviation
  rXms<-rF$V2[grep("mean\\(\\)|std\\(\\)", rF$V2)]
  rMS<-subset(rX,select=c("subject", "activity",rXms))

#Tidy mean & standard deviation data output
  write.table(rMS,"tidydata.txt")
}
