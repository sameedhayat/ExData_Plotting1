
d <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
d$Format<- as.Date(d$Date,"%d/%m/%Y")
pl <- d[d$Format == '2007-02-01' | d$Format == '2007-02-02',]
pl$DateTime <- strptime(paste(pl$Date, pl$Time), "%d/%m/%Y %H:%M") 
png('plot4.png')
par(mfrow = c(2,2))
  plot(pl$DateTime,pl$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(pl$DateTime,pl$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(pl$DateTime,pl$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="",lty=1)
lines(pl$DateTime,pl$Sub_metering_1)
 lines(pl$DateTime,pl$Sub_metering_2,col="red")
 lines(pl$DateTime,pl$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"), cex=.75)
plot(pl$DateTime,pl$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

 dev.off()
