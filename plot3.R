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
png("plot3.png")
with(project_1,plot(DateTime,Sub_metering_1,type="l",col="black",
                    ylab = "Energy Sub metering"))
with(project_1,lines(DateTime,Sub_metering_2,col="red"))
with(project_1,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","blue","red"),
       legend=colnames(project_1)[7:9])
dev.off()
