# Set the working directory
# I have commented it as it is already set
# setwd("D:/Documents/Coursera/Exploratory Data Analysis/Week 1")

# Read the source file into a data frame

mydata <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE)
mydata <- na.omit(mydata)

# View the data frame once to check if it is properly loaded
# View(mydata)

# Set the class of the columns to be used in the plot appropriately
# lapply(mydata, class)

mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)
mydata$Voltage <- as.numeric(mydata$Voltage)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
# We will get warning message if there are NA records in any of these columns

# Subset the data as requested in the assignment

mydata <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]

# Create one column that has both date and time as it will go into X axis

mydata <- transform(mydata, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# Set the destination file name and the expected size

png("plot4.png", width=480, height=480)

# Below defines that the plots are to be displayed in a 2 * 2 matrix

par(mfrow = c(2, 2)) 

# First Plot

plot(mydata$timestamp,mydata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Second Plot

plot(mydata$timestamp,mydata$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Third Plot

plot(mydata$timestamp,mydata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(mydata$timestamp,mydata$Sub_metering_2,col="red")
lines(mydata$timestamp,mydata$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), cex = 0.5, bty = "n") 

# Fourth Plot

plot(mydata$timestamp,mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()