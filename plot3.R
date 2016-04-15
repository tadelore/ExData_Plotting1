#Exploratyory Data Analysis
#Course project 1, Plot 3
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert data and time variables
dateTime <- strptime((paste(data[,1], data[,2])), "%d/%m/%Y %H:%M:%S")

#save file as plot3.png with width and height 480 x 480 pixels 
png(filename = "plot3.png", width = 480, height = 480)

plot(dateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
lines(dateTime, data$Sub_metering_2, col = "red")
lines(dateTime, data$Sub_metering_3, col = "blue")

#legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

#turn off png device
dev.off()