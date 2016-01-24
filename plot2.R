setwd("C:/Coursera_stuff/Exploratory data analysis/Course project 1")
Data <- read.csv("C:/Coursera_stuff/Exploratory data analysis/Course project 1/household_power_consumption.txt", 
                 sep=";", na.strings=c("NA", "?"))
#Change the class of the date:
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
#Subset the data:
work_data <- subset(Data, Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02")
#Change the class of the Time:
work_data$Time <- paste(as.Date(work_data$Date), work_data$Time)
work_data$Time <- strptime(work_data$Time, "%Y-%m-%d %H:%M:%S")

#Make Plot 2:

plot(work_data$Time, work_data$Global_active_power, main = "", ylab = "Global Active Power (kilowatts)",
     type = "l", xlab = "")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()