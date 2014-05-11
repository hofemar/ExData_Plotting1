#------------------------------------------------------------------------------
# EXPLORATORY DATA ANALYSIS - ASSIGNMENT 1
# Make sure household_power_consumption.txt is stored in the working-directory!
#------------------------------------------------------------------------------

# Load and subset data
data <- read.csv("household_power_consumption.txt", header=T,na.strings='?',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")
subs <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#Convert date/time
dt <- strptime(paste(subs$Date,subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
subs <- cbind(dt,subs)

# Initializ and draw png plot including legend
png(filename = "plot3.png", width = 480, height = 480)
plot(subs$dt,subs$Sub_metering_1,type = "l",col="black",xlab="",ylab="Energy sub metering",main="")
points(subs$dt,subs$Sub_metering_2,type = "l",col="red")
points(subs$dt,subs$Sub_metering_3,type = "l",col="blue")
legend("topright", lty=1, col = c("black","red","blue"), legend = colnames(subs)[8:10])
dev.off()