plot2 <- function() {
    df_raw <- read.csv("household_power_consumption.txt", sep=";")
    df_need <- df_raw[(df_raw$Date=="1/2/2007") | (df_raw$Date=="2/2/2007") ,]
    dates<-as.Date(df_need$Date,"%d/%m/%Y")
    x<-strptime(paste(dates, df_need$Time), "%Y-%m-%d %H:%M:%S")
    y<-as.numeric(as.character(df_need$Global_active_power))
    plot(x, y, type = "s", xlab="", ylab="Global Active Power (kilowatts)")
}