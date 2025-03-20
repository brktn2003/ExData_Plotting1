# Load required libraries
library(data.table)

# Load data
data <- fread("household_power_consumption.txt", sep=";", na.strings="?")

# Convert Date and Time columns to Date-Time format
data[, Date := as.Date(Date, format="%d/%m/%Y")]
data[, DateTime := as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S")]

# Filter data for the required dates
subset_data <- data[Date == "2007-02-01" | Date == "2007-02-02"]

# Extend x-axis to make "Sat" visible
x_limits <- range(subset_data$DateTime)
x_limits[2] <- x_limits[2] + 3600  # Add 1 hour buffer into Feb 3

# Create the plot
png("plot2.png", width=480, height=480)
plot(subset_data$DateTime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", xaxt="n", xlim=x_limits)
axis.POSIXct(1, at=seq(min(x_limits), max(x_limits), by="day"), format="%a")  # Force "Sat"
dev.off()
