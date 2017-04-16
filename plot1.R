#Read the table
AllData<-read.table('household_power_consumption.txt',header=TRUE,na.strings='?',sep=';')

#Change the Date format
AllData$Date<-as.Date(AllData$Date,'%d/%m/%Y')

#Determine the Data set over the required 2 days
Data<-subset(AllData,Date>='2007-02-01' & Date<='2007-02-02')

#Construct the plot and save it as plot1.png
png('plot1.png',width=480,height=480)
hist(Data$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)')
dev.off()
