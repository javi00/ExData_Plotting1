# first unzip the file and  read like a table
data <- read.table(unz("exdata_data_household_power_consumption.zip",
                       "household_power_consumption.txt"), sep = ";",
                   header = TRUE, colClasses = "character")

# remove the NA or ? if the data
dataf <-  subset(data, Global_active_power != "?")

# setting date and time into a column call datetime
dataf$datetime <- strptime(paste(dataf$Date,dataf$Time), format = "%d/%m/%Y %H:%M:%S")

#select only the data that we need to work
tf <- subset(dataf, datetime >= "2007-02-01" & datetime < "2007-02-03")


#open device png
png(filename = "C:\\plot4.png", width = 480, height = 480, units = "px", bg = "white")

par(mfcol = c(2,2))

#plot (1,1)
plot(tf$datetime, tf$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = " ")

#plot (1.2)
plot(tf$datetime, tf$Sub_metering_1, type = "l",
     ylab = "Energy Sub Metering", xlab = " ")
points(tf$datetime, tf$Sub_metering_2, type = "l", col = "red")
points(tf$datetime, tf$Sub_metering_3, type = "l", col = "blue")

#set the legend of plot (1,2)
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2",
        "Sub_metering_3"), col=c("black","red", "blue"), lty=1, box.lty=0)

#plot(2,1)

plot(tf$datetime, tf$Voltage, type = "l",
     ylab = "Voltage", xlab = "datetime")


#plot(2,2)

plot(tf$datetime, tf$Global_reactive_power, type = "l",
     ylab = "Global_reactive_power", xlab = "datetime")

# close device
dev.off()