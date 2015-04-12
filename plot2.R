library(datasets)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
data <- subset(df, df$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")) & df$Global_active_power != "?")

#Cast back to numeric
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$DateTime <- strptime(paste(data$Date, " ", data$Time), format = "%Y-%m-%d %H:%M:%S")

png(file = "plot2.png")
plot (data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
