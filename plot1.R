plot1 <- function()
{
#read file into table 
pwr<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
#combine date and time columns
pwr$Datetime<-strptime(paste(pwr$Date,pwr$Time),"%d/%m/%Y %H:%M:%S")
#extract data for only 2 days as specified
pwr$Date<-as.Date(pwr$Date,"%d/%m/%Y")
pwr2<-subset(pwr,pwr$Date=="2007-02-01" | pwr$Date=="2007-02-02")
#plot histogram and write to png file
png(filename="plot1.png")
hist(pwr2$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()#cleanup memory
remove(pwr)
remove(pwr2)


}