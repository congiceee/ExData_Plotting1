#Read the table
AllData<-read.table('household_power_consumption.txt',header=TRUE,na.strings='?',sep=';')

#Change the Date format
AllData$Date<-as.Date(AllData$Date,'%d/%m/%Y')

#Determine the Data set over the required 2 days
Data<-subset(AllData,Date>='2007-02-01' & Date<='2007-02-02')

#Change the Date and Time format and assign a new varible DT
Data$DT<-strptime(paste(Data$Date,Data$Time),'%Y-%m-%d%H:%M:%S')
Data$DT<-as.POSIXct(Data$DT)

#Construct the plot and save it as plot2.png
png('plot2.png',width=480,height=480)
with(Data,plot(Global_active_power~DT,type='l',xlab='',ylab='Global Active Power (kilowatts)'))
dev.off()
