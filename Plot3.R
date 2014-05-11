#The text file to be saved in the working directory

#read data
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#create a datetime column
x <- within(x, DateTime <- paste(Date, Time, sep=" "))
x$DateTime = as.POSIXct(strptime(x$DateTime, format = "%d/%m/%Y %H:%M:%S"))

#filter data of two days of feb as given in the problem
sdata = subset(x, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

# create the graph
png(filename = "plot3.png", width = 480, height = 480, units = "px")
cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(sdata$DateTime, sdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sdata$DateTime, sdata$Sub_metering_2, type="l", col="red")
lines(sdata$DateTime, sdata$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
dev.off()
