
# read the specific rows in the file

hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", na.strings = "?",
                  col.names = colnames(read.table("household_power_consumption.txt",
                                                  nrow = 1, header = TRUE, sep=";")))


#convert date and time

hpc$Time <- with(hpc, paste(Date, Time, sep=" "))
hpc$Date <- NULL
hpc$Time <- strptime(hpc$Time, "%d/%m/%Y %H:%M:%S")

#plot

with(hpc, plot(Time, Sub_metering_1, type = "l", xlab = "" , ylab= "Energy sub metering"))
with(hpc, points(Time, Sub_metering_2, col= "red", type = "l"))
with(hpc, points(Time, Sub_metering_3, col= "blue", type = "l"))
legend("topright", cex=1, pt.cex=1, y.intersp=0.5, x.intersp=0.5, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#copy plot to png file

dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()