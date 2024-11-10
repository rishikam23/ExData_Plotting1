#Loading the dataset
data=read.table("./ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
View(data)

#Subsettig the dataset
data=data[data$Date %in% c("1/2/2007","2/2/2007"),]
#Converting Date and Time
data$DateTime=as.POSIXct(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
View(data)

# Plot 1: Global Active Power Histogram
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()