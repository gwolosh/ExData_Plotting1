##################################################################
#
# PrepData.R - Prep household power data for 
# Programmming assignment 1
# Exploratory Data Analysis
#
##################################################################

getData <- function(){
    if (! file.exists("data")) {dir.create("data")}
    curdir<-getwd()
    setwd("data")
    if (! file.exists("household_power_consumption.txt")) {
        url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, "household_power_consumption.zip", method="curl")
        unzip("household_power_consumption.zip")
    }
    tempdata<-grep('^[1,2]/2/2007|Date',readLines("household_power_consumption.txt"), value=TRUE)
    tf<-tempfile()
    writeLines(tempdata, tf)
    pd<-read.csv(tf, na.strings=c("?"), sep=";")
    unlink(tf)
    pd$datetime<-strptime(paste(as.Date(pd$Date , "%d/%m/%Y"), pd$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
    saveRDS(pd, "power.rds")
    setwd(curdir)
    return(pd)
}
