#Exploratyory Data Analysis
#Course project 1, Plot 4
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert data and time variables
dateTime <- strptime((paste(data[,1], data[,2])), "%d/%m/%Y %H:%M:%S")

#print plot 4 to png file
png(filename = "plot4.png", width = 480, height = 480)

#display four sub plots on screen
par(mfrow = c(2,2), mar = c(4,4,2,2))

#1st subplot 
with(data, plot(dateTime, Global_active_power, type = "l",  xlab = "",
                ylab = "Global Active Power"))

#2nd subplot
with(data, plot(dateTime, Voltage, type = "l", xlab = "datetime",
                ylab = "Voltage"))

#3rd subplot
plot(dateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering") 
lines(dateTime, data$Sub_metering_2, col = "red")
lines(dateTime, data$Sub_metering_3, col = "blue")

#legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"), bty ="n")

#4th subplot
with(data, plot(dateTime, Global_reactive_power, type = "l",
                xlab = "datetime", ylab = "Global_reactive_power"))

#turn off png device
dev.off()