library(dplyr)

#Calculating a rough estimate of how much memory the dataset will require in memory
gb=round(2075259*9*8/10^9, digits=2)  #rows*collums*bytes to gb
if (gb<7){
        print("There is not enought memory to run this program")
        stop()}

setwd("C:/Users/Jolita/Desktop/Ex_Files_Learning_R/datasciencecoursera/4. Exploratory data analysis/Week 1")


data<-read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<- data %>% filter(Date>="2007-02-01" & Date<="2007-02-02")


png(file="plot1.png", width=480, height=480)


hist(data$Global_active_power,
     col="red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     cex.axis=0.8,
     cex.lab=0.8)


dev.off()