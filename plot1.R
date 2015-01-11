#Plot1
rm(list=ls())
text<-read.table("household_power_consumption.txt",
                 header=TRUE,sep=";")
text.Date.conv<-as.Date(text$Date,format="%d/%m/%Y")
index<-(text.Date.conv=="2007-02-01"|text.Date.conv=="2007-02-02")
global_active_power<-as.numeric(text[index,]$Global_active_power)
#Plot1
png(filename="plot1.png",width=480,height=480,units="px")
hist(global_active_power,col="red",xlab="Global Active Power (kilowatts)",
     main="Global Active Power",xaxt='n')
axis(1,at=seq(0,3000,800),labels=seq(0,6,2))
dev.off()
rm(text,text.Date.conv,index)