#Loading the dataset
data=read.table("./ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
View(data)

#Subsettig the dataset
data=data[data$Date %in% c("1/2/2007","2/2/2007"),]
#Converting Date and Time
data$DateTime=as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
View(data)

par(mfrow=c(2,2))
png("plot4.png",width=480,height=480)

# Plot 4: Combined plots

# Plot 1: Global Active Power over time
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1,at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels=c("Thu","Fri","Sat"))

# Plot 2: Voltage over time
plot(data$DateTime,data$Voltage,type="l",xlab="datetime",ylab="Voltage",xaxt="n")
axis(1,at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels=c("Thu","Fri","Sat"))

# Plot 3: Energy sub metering
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",xaxt="n")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
axis(1,at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

# Plot 4: Global Reactive Power over time
plot(data$DateTime, data$Global_reactive_power,type="l",xlab="datetime",ylab="Global Reactive Power",xaxt="n")
axis(1,at=as.POSIXct(c("2007-02-01","2007-02-02","2007-02-03")),labels=c("Thu","Fri","Sat"))

dev.off()
