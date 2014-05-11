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

# Initializ and draw png plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2),oma=c(0,0,0,0),mar=c(3,3,1,1)+0.8)
plot(subs$dt,subs$Global_active_power,type='l',ylab="Global Active Power",xlab="")
plot(subs$dt,subs$Voltage,type='l',ylab="Voltage",xlab="datetime")
plot(subs$dt,subs$Sub_metering_1,type = "l",col="black",xlab="",ylab="Energy sub metering",main="")
points(subs$dt,subs$Sub_metering_2,type = "l",col="red")
points(subs$dt,subs$Sub_metering_3,type = "l",col="blue")
legend("topright", lty=1, bty="n", col = c("black","red","blue"), legend = colnames(subs)[8:10])
plot(subs$dt,subs$Global_reactive_power,type='l',ylab="Global Reactive Power",xlab="datetime")
dev.off()