library("data.table")
hpc<-fread("household_power_consumption.txt",sep = ";",na.strings = "?")
hpc[,Date2:=as.Date(Date,"%d/%m/%Y")]
hpc2<-hpc[(Date2=="2007-02-01") | (Date2=="2007-02-02")]
hpc2[,Date3:=paste(Date,Time,sep = " ")]
stime<-strptime(hpc2$Date3,"%d/%m/%Y %H:%M:%S")
png("plot3.png",width = 480,height = 480)
plot(stime,hpc2$Sub_metering_1,type = "n",xlab = "",ylab = "Energy sub metering")
lines(stime,hpc2$Sub_metering_1,col="black")
lines(stime,hpc2$Sub_metering_2,col="red")
lines(stime,hpc2$Sub_metering_3,col="blue")
legend("topright",lty = c(1,1),col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),inset = 0.07,bty = "n")
dev.off()
