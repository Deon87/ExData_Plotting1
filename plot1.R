
# Set up the working directory to the R folder containing the Individual 
# household electric power consumption Dataset.
setwd("C:/Users/Gideon87/Documents/R")

#Extract the dataset into R dataframe.
House_Pwr_Consumption<- read.csv("household_power_consumption.txt",header=TRUE,sep=';', 
                                 na.strings="NA",nrows=2075200,check.names=FALSE, stringsAsFactors=FALSE,
                                 comment.char="",quote='\"')

#Extracts subset of the data collected from January 2, 2007 to February 2,2007.
House_Pwr_Consumption1 <- subset(House_Pwr_Consumption, Date %in% c("1/2/2007","2/2/2007"))

#Format and merge the Date and Time Columns of the dataframe into one Column 'Datetime'.
House_Pwr_Consumption1$Date <- as.Date(House_Pwr_Consumption1$Date, format="%d/%m/%Y")

# plot the relationship between Global Active Power Consumption in individual 
#household and their frequencies using the base plot histogram function.
with(House_Pwr_Consumption1,{hist(as.numeric(House_Pwr_Consumption1$Global_active_power),freq=TRUE, 
                              main="Global Active Power", xlab="Global Active Power (kilowatts)", 
                              ylab="Frequency", col="Red")})

#save the graph as a png file.
dev.copy(png, file="plot1.png",height=480,width=480)

#shutdown the graphic device.
dev.off()


