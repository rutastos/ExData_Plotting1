library(dplyr)
Sys.setlocale("LC_TIME", "English")
#Calculating a rough estimate of how much memory the dataset will require in memory
gb=round(2075259*9*8/10^9, digits=2)  #rows*collums*bytes to gb
if (gb>7){
        print("There is not enought memory to run this program")
        quit()}

setwd("C:/Users/Jolita/Desktop/Ex_Files_Learning_R/datasciencecoursera/4. Exploratory data analysis/Week 1")

data<-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<- data %>% filter(Date>="2007-02-01" & Date<="2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time)
data$date_time <- as.POSIXct(datetime)


png(file="plot3.png", width=480, height=480)

plot(data$date_time, data$Sub_metering_1,
     type="l",
     ylab = "Energy sub metering",
     xlab="")
lines(data$date_time,data$Sub_metering_2, col="red")
lines(data$date_time,data$Sub_metering_3, col="blue")
legend("topright",
       c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=1,
       cex = 0.8,
       col=c("black","red", "blue"))


dev.off()