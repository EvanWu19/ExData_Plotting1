setwd("./ExData_Plotting1")
projec_1<-read.table("/Users/evanmac/Desktop/education/R STUDY/data/household_power_consumption.txt",
                     sep = ";",
                     header = T,stringsAsFactors = F)
x<-as.Date(projec_1$Date,format = "%d/%m/%Y")
projec_1$Date<-x
project_1<-projec_1[which(projec_1$Date>as.Date("2007-01-31")&
                                projec_1$Date<as.Date("2007-02-03")),]
for (i in 3:9){
      project_1[,i]<-as.numeric(project_1[,i])
      
}
project_1$weekdays<-weekdays(project_1$Date,T)
project_1$DateTime<-as.POSIXct(paste(project_1$Date,project_1$Time),
                               format="%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2))
with(project_1, {
      plot(DateTime,Global_active_power, type="l",
                     ylab = "Global Active Power(killowatts)",xlab = "")
      plot(DateTime,Voltage, type="l",xlab = "datetime")
      plot(DateTime,Sub_metering_1,type="l",col="black",
           ylab = "Energy Sub metering",xlab = "")
      lines(DateTime,Sub_metering_2,col="red")
      lines(DateTime,Sub_metering_3,col="blue")
      legend("topright",lty=1,col=c("black","blue","red"),
                    legend=colnames(project_1)[7:9],bty = "n",cex=0.3)
      plot(DateTime,Global_reactive_power,xlab = "datetime",type = "l")
})
dev.off()