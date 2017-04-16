#Read the table
AllData<-read.table('household_power_consumption.txt',header=TRUE,na.strings='?',sep=';')

#Change the Date format
AllData$Date<-as.Date(AllData$Date,'%d/%m/%Y')

#Determine the Data set over the required 2 days
Data<-subset(AllData,Date>='2007-02-01' & Date<='2007-02-02')

#Change the Date and Time format and assign a new varible DT
Data$DT<-strptime(paste(Data$Date,Data$Time),'%Y-%m-%d%H:%M:%S')
Data$DT<-as.POSIXct(Data$DT)

#Construct the plot and save it as plot4.png
png('plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(Data,{
plot(Global_active_power~DT,type='l',xlab='',ylab='Global Active Power')
plot(Voltage~DT,type='l',xlab='datetime',ylab='Voltage')
with(Data,{plot(Sub_metering_1~DT,xlab='',ylab='Energy sub metering',type='n')
points(Sub_metering_1~DT,type='l',col='black')
points(Sub_metering_2~DT,type='l',col='red')
points(Sub_metering_3~DT,type='l',col='blue')
})
legend('topright',lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
plot(Global_reactive_power~DT,type='l',xlab='datetime',ylab='Global_reactive_power')
})
dev.off()
