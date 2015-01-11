rm(list=ls())
text<-read.table("household_power_consumption.txt",
                 header=TRUE,sep=";")
text.Date.conv<-as.Date(text$Date,format="%d/%m/%Y")
index<-(text.Date.conv=="2007-02-01"|text.Date.conv=="2007-02-02")

submetering1<-as.numeric(text[index,]$Sub_metering_1)
submetering2<-as.numeric(text[index,]$Sub_metering_2)
submetering3<-as.numeric(text[index,]$Sub_metering_3)

png(filename="plot3.png",width=480,height=480,units="px")
plot(submetering1,type="l",
     ylab="Energy sub metering",xaxt='n')
axis(1,at=seq(0,2880,2880/3*1.5),labels=c("Thu","Fri","Sat"))
lines(submetering2,col="red")
lines(submetering3,col="blue")
leg.txt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=leg.txt,lty=c(1,1,1),col=c("black","red","blue"))
dev.off()