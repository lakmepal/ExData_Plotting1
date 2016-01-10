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
# We will get warning message if there are NA records in any of these columns

# Subset the data as requested in the assignment

mydata <- mydata[(mydata$Date=="2007-02-01") | (mydata$Date=="2007-02-02"),]

# Set the destination file name and the expected size

png("plot1.png", width=480, height=480)

# Create the histogram with appropriate labels

hist(mydata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
dev.off()