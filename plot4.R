rm(list=ls())
text<-read.table("household_power_consumption.txt",
                 header=TRUE,sep=";")
text.Date.conv<-as.Date(text$Date,format="%d/%m/%Y")
index<-(text.Date.conv=="2007-02-01"|text.Date.conv=="2007-02-02")

global_active_power<-as.numeric(text[index,]$Global_active_power)
submetering1<-as.numeric(text[index,]$Sub_metering_1)
submetering2<-as.numeric(text[index,]$Sub_metering_2)
submetering3<-as.numeric(text[index,]$Sub_metering_3)

png(filename="plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
plot(global_active_power,ylab="Global Active Power",type="l",xaxt='n',yaxt='n')
axis(2,at=seq(0,3000,800),labels=seq(0,6,2))
axis(1,at=seq(0,2880,2880/3*1.5),labels=c("Thu","Fri","Sat"))

voltage<-as.numeric(text[index,]$Voltage)
plot(voltage,ylab="Voltage",xlab = "datetime", type="l",xaxt='n',yaxt='n')
axis(2,at=seq(813,2165,-(813-2165)/3),labels=seq(234,246,4))
axis(1,at=seq(0,2880,2880/3*1.5),labels=c("Thu","Fri","Sat"))

plot(submetering1,type="l",
     ylab="Energy sub metering",xaxt='n')
axis(1,at=seq(0,2880,2880/3*1.5),labels=c("Thu","Fri","Sat"))
lines(submetering2,col="red")
lines(submetering3,col="blue")
leg.txt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend=leg.txt,lty=c(1,1,1),col=c("black","red","blue"))

global_reactive_power<-as.numeric(text[index,]$Global_reactive_power)
plot(global_reactive_power,ylab="Global_reactive_power",xlab = "datetime", type="l",xaxt='n',yaxt='n')
axis(2,at=seq(min(global_reactive_power),max(global_reactive_power),
              (max(global_reactive_power)-min(global_reactive_power))/5),labels=seq(0,.5,.1))
axis(1,at=seq(0,2880,2880/3*1.5),labels=c("Thu","Fri","Sat"))
dev.off()
rm(text,text.Date.conv,index)