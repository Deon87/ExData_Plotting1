# Set up the working directory to the R folder containing the Individual 
# household electric power consumption Dataset.
setwd("C:/Users/Gideon87/Documents/R")

#Extract the dataset into R dataframe.
House_Pwr_Consumption<- read.csv("household_power_consumption.txt",header=TRUE,sep=';', 
                          na.strings="NA",nrows=2075200,check.names=FALSE, stringsAsFactors=FALSE,
                          comment.char="",quote='\"')

#Extracts subset of the data collected from January 2, 2007 to February 2,2007.
House_Pwr_Consumption4 <- subset(House_Pwr_Consumption, Date %in% c("1/2/2007","2/2/2007"))

#Format and merge the Date and Time Columns of the dataframe into one Column 'Datetime'.
House_Pwr_Consumption4$Date <- as.Date(House_Pwr_Consumption4$Date, format="%d/%m/%Y")
Date_Time <- paste(as.Date(House_Pwr_Consumption4$Date), House_Pwr_Consumption4$Time)
House_Pwr_Consumption4$Datetime <- as.POSIXct(Date_Time)

# Plot out 4 relationships, Datetime/Global Active Power, Datetime/Voltage, Datetime/
# Energy SubMetering, and Datetime/Global Reactive Power of the household energy consumptions
# using the base plotting system.
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(House_Pwr_Consumption4, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_Reactive_Power (kilowatts)",xlab="")
})

#Create a Png file of the Plots.
dev.copy(png, file="plot4.png",width=480,height=480)

#Shutdown the graphic device.
dev.off()