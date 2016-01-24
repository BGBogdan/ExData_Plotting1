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

#Make plot 4:
par(mfrow=c(2,2), mar = c(4,4,0.5,1))
plot(work_data$Time, work_data$Global_active_power, main = "", ylab = "Global Active Power (kilowatts)",
     type = "l", xlab = "")
plot(work_data$Time, work_data$Voltage, main = "", ylab = "Voltage",
     type = "l", xlab = "datetime")
plot(work_data$Time, work_data$Sub_metering_1, main = "", ylab = "Energy sub metering",
     type = "l", xlab = "")
lines(work_data$Time, work_data$Sub_metering_2, col = "red")
lines(work_data$Time, work_data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1,
       col=c("black", "red", "blue"))
plot(work_data$Time, work_data$Global_reactive_power, main = "", ylab = "Global_reactive_power",
     type = "l", xlab = "datetime")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()