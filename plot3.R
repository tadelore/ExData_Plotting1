#Exploratyory Data Analysis
#Course project 1, Plot 3
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert data and time variables
data[,1] <- as.Date(as.character(data[,1]), "%d/%m/%Y")
nday <- weekdays(data[,1])

#save file as plot3.png with width and height 480 x 480 pixels 
m <- max(max(data$Sub_metering_1), max(data$Sub_metering_2), max(data$Sub_metering_3))

png(filename = "plot3.png")
plot(c(0, 2880), c(0, m), type = "n",  xaxt = "n", xlab = "", ylab = "Energy sub metering") 
with(data, lines(Sub_metering_1, col = "black"))
with (data, lines(Sub_metering_2, col = "red"))
with(data, lines(Sub_metering_3, col = "blue"))

#vector of x axis labels
v1 <- c(first(which(nday=="Thursday")), first(which(nday=="Friday")), last(which(nday == "Friday")))
v2 <- c("Thu", "Fri", "Sat")
axis(1, at= v1, labels = v2 , las = 0)

#legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1), col = c("black", "red", "blue"))

#turn off png device
dev.off()