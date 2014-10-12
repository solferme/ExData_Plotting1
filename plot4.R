x<-read.table('household_power_consumption.txt',sep=";",header=TRUE,colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')

x$TD<-paste(x$Date,x$Time)
x$TD<-strptime(x$TD,"%d/%m/%Y %H:%M:%S")

# Keeping only february 01 and 02 data
mydata<-x[x$TD >= as.POSIXlt("2007-02-01") & x$TD < as.POSIXlt("2007-02-03"),]

#Making plot 4
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(mydata$TD,mydata$Global_active_power,type='l',xlab="",ylab="Global Active Power")
plot(mydata$TD,mydata$Voltage,type='l',xlab="datetime",ylab="Voltage")

with(mydata,plot(mydata$TD,mydata$Sub_metering_1,type='n',ylab="Energy sub metering",xlab=""))
with(mydata,lines(mydata$TD,mydata$Sub_metering_1,type='l',ylab="",xlab=""))
with(mydata,lines(mydata$TD,mydata$Sub_metering_2,type='l',ylab="",xlab=""))
with(mydata,lines(mydata$TD,mydata$Sub_metering_2,type='l',ylab="",xlab="",col="red"))
with(mydata,lines(mydata$TD,mydata$Sub_metering_3,type='l',ylab="",xlab="",col="blue"))
legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),bty="n")

plot(mydata$TD,mydata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()
