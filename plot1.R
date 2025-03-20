# Load required libraries
library(data.table)

# Load data
data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

# Convert Date column to Date type
data[, Date := as.Date(Date, format="%d/%m/%Y")]

# Filter data for the required dates
subset_data <- data[Date == "2007-02-01" | Date == "2007-02-02"]

# Create the histogram
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
