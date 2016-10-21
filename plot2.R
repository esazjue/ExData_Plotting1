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
with(houseP, plot(TimeDate,Global_active_power,main="Global Active Power",ylab="Global Active Power (kilowatts)",type="l",xlab = ""))

#Opening the PNG device
png(file="plot2.png",width=480,height=480)
#Plotting the histogram on the PNG device
with(houseP, plot(TimeDate,Global_active_power,main="Global Active Power",ylab="Global Active Power (kilowatts)",type="l",xlab = ""))
#Closing the device
dev.off()