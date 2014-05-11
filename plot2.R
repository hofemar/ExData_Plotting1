#------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS - ASSIGNMENT 1
# Make sure household_power_consumption.txt is stored in the working-directory!
#------------------------------------------------------------------------------

# Load and subset data
data <- read.csv("household_power_consumption.txt", header=T,na.strings='?',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")
subs <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# Convert date/time
dt <- strptime(paste(subs$Date,subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
subs <- cbind(dt,subs)

# Initializ and draw png plot
png(filename = "plot2.png", width = 480, height = 480)
plot(subs$dt,subs$Global_active_power,type='l',ylab="Global Active Power (kilowatts)",xlab="")
dev.off()