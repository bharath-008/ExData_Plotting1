# Load data
data <- read.table("household_power_consumption.txt",
                   header=TRUE,
                   sep=";",
                   na.strings="?",
                   stringsAsFactors=FALSE)

# Convert Date
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Filter dates
data <- subset(data, Date == as.Date("2007-02-01") |
                 Date == as.Date("2007-02-02"))

# Convert numeric columns
cols <- c("Global_active_power", "Global_reactive_power",
          "Voltage", "Global_intensity",
          "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

data[cols] <- lapply(data[cols], as.numeric)

# Plot
png("plot1.png", width=480, height=480)

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()

