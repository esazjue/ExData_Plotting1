#Loading the data file
housePower <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#Getting the data for the dates of interest
houseP <- subset(housePower,Date %in% c("1/2/2007","2/2/2007"))
#Freeing up memory
rm(housePower)

#Converting Date and Time to a new column as POSIXct with a USA timezone
houseP$TimeDate<- with(houseP,as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S",zt="EST"))

# Changing the locale to get the days in English 
Sys.setlocale("LC_TIME", "English")

#Plotting on the screen
par(mfrow=c(2,2)) 

with(houseP, plot(TimeDate,Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab = ""))
with(houseP, plot(TimeDate,Voltage,type="l",xlab = "datetime"))



with(houseP, plot(TimeDate,Sub_metering_1,ylab="Energy Sub metering",type="l",xlab="",width=480,height=480))
lines(houseP$TimeDate,houseP$Sub_metering_2,col="red")
lines(houseP$TimeDate,houseP$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"),lty=c(1,1,1),bty ="n")

with(houseP, plot(TimeDate,Global_reactive_power,type="l",xlab = "datetime"))



#Opening the PNG device
png(file="plot4.png",width=480,height=480)
#Plotting the plots on the PNG device
par(mfrow=c(2,2)) 

with(houseP, plot(TimeDate,Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab = ""))
with(houseP, plot(TimeDate,Voltage,type="l",xlab = "datetime"))

with(houseP, plot(TimeDate,Sub_metering_1,ylab="Energy Sub metering",type="l",xlab="",width=480,height=480))
lines(houseP$TimeDate,houseP$Sub_metering_2,col="red")
lines(houseP$TimeDate,houseP$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"),lty=c(1,1,1),bty ="n")

with(houseP, plot(TimeDate,Global_reactive_power,type="l",xlab = "datetime"))
#Closing the device
dev.off()