x<-read.table('household_power_consumption.txt',sep=";",header=TRUE,colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings='?')

x$TD<-paste(x$Date,x$Time)
x$TD<-strptime(x$TD,"%d/%m/%Y %H:%M:%S")

# Keeping only february 01 and 02 data
mydata<-x[x$TD >= as.POSIXlt("2007-02-01") & x$TD < as.POSIXlt("2007-02-03"),]

# Making the histogram for Global Active Power
png(filename = "plot1.png",width = 480, height = 480)
hist(mydata$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col=c("red"))
dev.off()

