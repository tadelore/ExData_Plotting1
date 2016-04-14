#Exploratyory Data Analysis
#Course project 1, Plot 2
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#convert data and time variables
data[,1] <- as.Date(as.character(data[,1]), "%d/%m/%Y")
nday <- weekdays(data[,1])

#plot 2
with(data, plot(Global_active_power, type = "l",  xaxt = "n",
                ylab = "Global Active Power (kilowatts)"))

#vector of x axis labels
v1 <- c(first(which(nday=="Thursday")), first(which(nday=="Friday")), last(which(nday == "Friday")))
v2 <- c("Thu", "Fri", "Sat")
axis(1, at= v1, labels = v2 , las = 0)

#save file as plot2.png with width and height 480 x 480 pixels 
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()