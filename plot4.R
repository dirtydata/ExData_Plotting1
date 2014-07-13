plot4 <- function()
{
  #read file into table 
  pwr<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
  #combine date and time columns
  pwr$Datetime<-strptime(paste(pwr$Date,pwr$Time),"%d/%m/%Y %H:%M:%S")
  #extract data for only 2 days as specified
  pwr$Date<-as.Date(pwr$Date,"%d/%m/%Y")
  pwr2<-subset(pwr,pwr$Date=="2007-02-01" | pwr$Date=="2007-02-02")
  #plot 4 graphs and write to png file
  png(filename="plot4.png")
  
  par(mfrow=c(2,2))
  
  plot(pwr2$Datetime,pwr2$Global_active_power,type='l',ylab="Global Active Power",xlab="")
  plot(pwr2$Datetime,pwr2$Voltage,type='l',ylab="Voltage",xlab="datetime")
  plot(pwr2$Datetime,pwr2$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(pwr2$Datetime,pwr2$Sub_metering_2,type="l",col="red")
  lines(pwr2$Datetime,pwr2$Sub_metering_3,type="l",col="blue")
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)
  plot(pwr2$Datetime,pwr2$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")
  
  dev.off()
  #cleanup memory
  remove(pwr)
  remove(pwr2)
  
}