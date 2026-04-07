data <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings="?",
                   stringsAsFactors=FALSE)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data <- subset(data, Date == as.Date("2007-02-01") |
                 Date == as.Date("2007-02-02"))

cols <- c("Global_active_power", "Global_reactive_power",
          "Voltage", "Global_intensity",
          "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data[cols] <- lapply(data[cols], as.numeric)

data$Datetime <- strptime(paste(data$Date, data$Time),
                          format="%Y-%m-%d %H:%M:%S")

png("plot3.png", width=480, height=480)

plot(data$Datetime, data$Sub_metering_1,
     type="l",
     col="black",
     xlab="",
     ylab="Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1)

dev.off()