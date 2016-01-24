setwd("C:/Coursera_stuff/Exploratory data analysis/Course project 1")
Data <- read.csv("C:/Coursera_stuff/Exploratory data analysis/Course project 1/household_power_consumption.txt", 
                 sep=";", na.strings=c("NA", "?"))
#Change the class of the date:
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")
#Subset the data:
work_data <- subset(Data, Data$Date >= "2007-02-01" & Data$Date <= "2007-02-02")

#Make Plot 1:
hist(work_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()