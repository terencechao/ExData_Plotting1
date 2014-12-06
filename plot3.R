plot3 <- function() {
    df_raw <- read.csv("household_power_consumption.txt", sep=";")
    df_need <- df_raw[(df_raw$Date=="1/2/2007") | (df_raw$Date=="2/2/2007") ,]
    dates<-as.Date(df_need$Date,"%d/%m/%Y")
    x<-strptime(paste(dates, df_need$Time), "%Y-%m-%d %H:%M:%S")
    y1<-as.numeric(as.character(df_need$Sub_metering_1))
    y2<-as.numeric(as.character(df_need$Sub_metering_2))
    y3<-df_need$Sub_metering_3
    plot(x, y1, type = "s", xlab="", ylab="Energy sub metering")
    lines(x, y2, col="red", type="s")
    lines(x, y3, col="blue", type="s")
    legend('topright',
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1:3,
           col=c('black','red','blue'),
           cex=.8)
}