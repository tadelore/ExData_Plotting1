#Exploratyory Data Analysis
#Course project 1, Plot 2
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

#dates before 1/2/2007 and after 2/2/2007 
#manually removed from text file to accomodate memory limitations 
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert data and time variables
dateTime <- strptime((paste(data[,1], data[,2])), "%d/%m/%Y %H:%M:%S")
                
#plot 2
with(data, plot(dateTime, Global_active_power, type = "l",  xlab = "",
                ylab = "Global Active Power (kilowatts)"))

#save file as plot2.png with width and height 480 x 480 pixels 
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()