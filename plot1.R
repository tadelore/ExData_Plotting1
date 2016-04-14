#Exploratyory Data Analysis
#Course project 1, Plot 1
#Loading data 

setwd("C:/Users/datacent52/Documents/Temilade Adelore_Office/DataScienceCourse/ExploratoryDataAnalysis/CourseProject1")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#plot 1
with(data, hist(Global_active_power, col = "red", main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"))

#save file as plot1.png with width and height 480 x 480 pixels 
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()