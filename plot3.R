# Set up the working directory to the R folder containing the Individual 
# household electric power consumption Dataset.
setwd("C:/Users/Gideon87/Documents/R")

#Extract the dataset into R dataframe.
House_Pwr_Consumption<- read.csv("household_power_consumption.txt",header=TRUE,sep=';', 
                                 na.strings="NA",nrows=2075200,check.names=FALSE, stringsAsFactors=FALSE,
                                 comment.char="",quote='\"')

#Extracts subset of the data collected from January 2, 2007 to February 2,2007.
House_Pwr_Consumption3 <- subset(House_Pwr_Consumption, Date %in% c("1/2/2007","2/2/2007"))

#Format and merge the Date and Time Columns of the dataframe into one Column 'Datetime'.
House_Pwr_Consumption3$Date <- as.Date(House_Pwr_Consumption3$Date, format="%d/%m/%Y")
Date_Time <- paste(as.Date(House_Pwr_Consumption3$Date), House_Pwr_Consumption3$Time)
House_Pwr_Consumption3$Datetime <- as.POSIXct(Date_Time)

#plot the relationship between Datetime/Energy Submeterings of different appliances in 
#individual household.

with(House_Pwr_Consumption3, {
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=2, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save the graph in a png file using a base graphic function.
dev.copy(png, file="plot3.png",height=480, width=480)

#Shutdown the graphic device.
dev.off()