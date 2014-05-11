#The text file to be saved in the working directory
#read data
x<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#create a datetime column
x <- within(x, DateTime <- paste(Date, Time, sep=" "))
x$DateTime = as.POSIXct(strptime(x$DateTime, format = "%d/%m/%Y %H:%M:%S"))

#filter data of two days of feb as given in the problem
sdata = subset(x, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

# create the graph
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(sdata$Global_active_power),xlab="Global Active Power (kilowatts)",col="red", main="Global Active Power")
dev.off()
