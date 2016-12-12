library("data.table")
hpc<-fread("household_power_consumption.txt",sep = ";",na.strings = "?")
hpc[,Date2:=as.Date(Date,"%d/%m/%Y")]
hpc2<-hpc[(Date2=="2007-02-01") | (Date2=="2007-02-02")]
hpc2[,Date3:=paste(Date,Time,sep = " ")]
stime<-strptime(hpc2$Date3,"%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480,height = 480)
plot(stime,hpc2$Global_active_power,type = "n",xlab = "",ylab = "Global Active Power (kilowatts)")
lines(stime,hpc2$Global_active_power)
dev.off()
