#------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS - ASSIGNMENT 1
# Make sure household_power_consumption.txt is stored in the working-directory!
#------------------------------------------------------------------------------

# Load and subset data
data <- read.csv("household_power_consumption.txt", header=T,na.strings='?',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")
subs <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Initializ and draw png plot
png(filename = "plot1.png", width = 480, height = 480)
hist(subs$Global_active_power,breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)",col="#FF2500")
dev.off()