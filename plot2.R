# Set up the working directory to the R folder containing the Individual 
# household electric power consumption Dataset.
setwd("C:/Users/Gideon87/Documents/R")

#Extract the dataset into R dataframe.
House_Pwr_Consumption<- read.csv("household_power_consumption.txt",header=TRUE,sep=';', 
                                 na.strings="NA",nrows=2075200,check.names=FALSE, stringsAsFactors=FALSE,
                                 comment.char="",quote='\"')

#Extracts subset of the data collected from January 2, 2007 to February 2,2007.
House_Pwr_Consumption2 <- subset(House_Pwr_Consumption, Date %in% c("1/2/2007","2/2/2007"))

#Format and merge the Date and Time Columns of the dataframe into one Column 'Datetime'.
House_Pwr_Consumption2$Date <- as.Date(House_Pwr_Consumption2$Date, format="%d/%m/%Y")
Date_Time <- paste(as.Date(House_Pwr_Consumption2$Date), House_Pwr_Consumption2$Time)
House_Pwr_Consumption2$Datetime <- as.POSIXct(Date_Time)

# Plot the relationship between Datetime/Global Active Power Consumption in Individual household
# for specified time period using base plotting system.
with(House_Pwr_Consumption2, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

# Save the plot in png file.
dev.copy(png, file="plot2.png",height=480,width=480)

#Shutdown the graphic device.
dev.off()

