d <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
d$Format<- as.Date(d$Date,"%d/%m/%Y")
pl <- d[d$Format == '2007-02-01' | d$Format == '2007-02-02',]
pl$DateTime <- strptime(paste(pl$Date, pl$Time), "%d/%m/%Y %H:%M") 

png('plot2.png')
 plot(pl$DateTime,pl$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
