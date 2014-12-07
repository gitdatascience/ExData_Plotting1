##plot3.R
#read datset
dat<-read.csv("household_power_consumption.txt",header=T,sep=';',na.strings="?", 
              nrows=2075259,check.names=F,stringsAsFactors=F,comment.char="",quote='\"')
dat$Date<-as.Date(dat$Date,format="%d/%m/%Y")

##filter dataset by relevant dates for plot
dat2<-subset(dat,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(dat)

##convert dates
datetime<-paste(as.Date(dat2$Date),dat2$Time)
dat2$Datetime<-as.POSIXct(datetime)

##create plot
with(dat2,{
  plot(Sub_metering_1~Datetime,type="l",
       ylab="Global Active Power (kilowatts)",xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",col=c("black","red","blue")
       , lty=1, lwd=2, 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##create png
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()