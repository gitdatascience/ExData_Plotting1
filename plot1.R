##plot1.R
##read dat2set
dat<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?", 
              nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote='\"')
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

##filter dat2set by relevant dates for plot
dat2<-subset(dat,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(dat)

##convert dates
datetime<-paste(as.Date(dat2$Date),dat2$Time)
dat2$Datetime<-as.POSIXct(datetime)

##create plot
hist(dat2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency", col="Red")

##create png
dev.copy(png, file="plot1.png",height=480,width=480)
dev.off()