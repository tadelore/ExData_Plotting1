#Exploratyory Data Analysis
#Course project 1, Plot 4
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert data and time variables
data[,1] <- as.Date(as.character(data[,1]), "%d/%m/%Y")
nday <- weekdays(data[,1])

#vector of x axis labels
v1 <- c(first(which(nday=="Thursday")), first(which(nday=="Friday")), last(which(nday == "Friday")))
v2 <- c("Thu", "Fri", "Sat")

#print plot 4 to png file
png(filename = "plot4.png", width = 480, height = 480)

#display four sub plots on screen
par(mfrow = c(2,2), mar = c(4,4,2,2))

#1st subplot 
with(data, plot(Global_active_power, type = "l",  xaxt = "n", xlab = "",
                ylab = "Global Active Power"))
axis(1, at= v1, labels = v2 , las = 0)

#2nd subplot
with(data, plot(Voltage, type = "l",  xaxt = "n", xlab = "datetime",
                ylab = "Voltage"))
axis(1, at= v1, labels = v2 , las = 0)

#3rd subplot
m <- max(max(data$Sub_metering_1), max(data$Sub_metering_2), max(data$Sub_metering_3))

plot(c(0, 2880), c(0, m), type = "n",  xaxt = "n", xlab = "", ylab = "Energy sub metering") 
with(data, lines(Sub_metering_1, col = "black"))
with (data, lines(Sub_metering_2, col = "red"))
with(data, lines(Sub_metering_3, col = "blue"))
axis(1, at= v1, labels = v2 , las = 0)

#legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"), bty ="n")

#4th subplot
with(data, plot(Global_reactive_power, type = "l", xaxt ="n",
                xlab = "datetime", ylab = "Global_reactive_power"))
axis(1, at= v1, labels = v2 , las = 0)

#turn off png device
dev.off()