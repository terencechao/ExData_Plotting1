plot1 <- function() {
    df_raw <- read.csv("household_power_consumption.txt", sep=";")
    df_need <- df_raw[(df_raw$Date=="1/2/2007") | (df_raw$Date=="2/2/2007") ,]
    hist(as.numeric(as.character(df_need$Global_active_power)), 
         col="red", 
         xlab="Global Active Power (kilowatts)", 
         main="Global Active Power")
}