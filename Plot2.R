library(datasets)

# first unzip the file and  read like a table
data <- read.table(unz("exdata_data_household_power_consumption.zip",
                       "household_power_consumption.txt"), sep = ";",
                        header = TRUE, colClasses = "character")

# open a window device 480 x 480


# remove the NA or ? if the data
dataf <-  subset(data, Global_active_power != "?")

# setting date and time into a column call timestamp
dataf$datetime <- strptime(paste(dataf$Date,dataf$Time), format = "%d/%m/%Y %H:%M:%S")

#select only the data that we need to work
tf <- subset(dataf, datetime >= "2007-02-01" & datetime < "2007-02-03")

#open device png
png(filename = "C:\\plot2.png", width = 480, height = 480, units = "px", bg = "white")

plot(tf$datetime, tf$Global_active_power, type = "l",
     ylab = "Global Active Power (Kilowatss)", xlab = " ")

dev.off()


