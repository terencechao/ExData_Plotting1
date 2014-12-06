plot4 <- function() {
    df_raw <- read.csv("household_power_consumption.txt", sep=";")
    df_need <- df_raw[(df_raw$Date=="1/2/2007") | (df_raw$Date=="2/2/2007") ,]
    #Trasform Date
    dates<-as.Date(df_need$Date,"%d/%m/%Y")
    #Generate x-value
    x<-strptime(paste(dates, df_need$Time), "%Y-%m-%d %H:%M:%S")
    #Generate y-value
    y_active<-as.numeric(as.character(df_need$Global_active_power))
    y_metering1<-as.numeric(as.character(df_need$Sub_metering_1))
    y_metering2<-as.numeric(as.character(df_need$Sub_metering_2))
    y_metering3<-df_need$Sub_metering_3
    y_voltage<-as.numeric(as.character(df_need$Voltage))
    y_reactive<-as.numeric(as.character(df_need$Global_reactive_power))
    
    #Partition 2 x 2 
    par(mfrow=c(2,2))
    #Plot images
    plot(x, y_active, type = "s", xlab="", ylab="Global Active Power (kilowatts)")
    plot(x, y_voltage, type = "s", xlab="", ylab="Voltage")
    plot(x, y_metering1, type = "s", xlab="", ylab="Energy sub metering")
    lines(x, y_metering2, col="red", type="s")
    lines(x, y_metering3, col="blue", type="s")
    legend('topright',
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1:3,
           col=c('black','red','blue'),
           cex=.8,
           bty="n")
    plot(x, y_reactive, type = "s", xlab="", ylab="Global Reactive Power")
}