
d <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
d$Format<- as.Date(d$Date,"%d/%m/%Y")
pl <- d[d$Format == '2007-02-01' | d$Format == '2007-02-02',]
pl$DateTime <- strptime(paste(pl$Date, pl$Time), "%d/%m/%Y %H:%M") 


png('plot1.png')
hist(as.numeric(as.character(pl$Global_active_power)),col='red',xlab='Global Active Power (kilowatts)',main="Global Active Power")
dev.off()
