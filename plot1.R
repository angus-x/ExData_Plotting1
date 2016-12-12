library("data.table")
hpc<-fread("household_power_consumption.txt",sep = ";",na.strings = "?")
hpc[,Date2:=as.Date(Date,"%d/%m/%Y")]
hpc2<-hpc[(Date2=="2007-02-01") | (Date2=="2007-02-02")]
png("plot1.png",width = 480,height = 480)
with(hpc2,hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main = "Global Active Power"))
dev.off()