
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

par(mfrow = c(2, 2))

  plot(hpc$Time, hpc$Global_active_power, type="l", xlab = "" , ylab= "Global Active Power (Kilowatts)")
  
  plot(hpc$Time, hpc$Voltage, type="l", xlab = "datetime", ylab= "Voltage")


 plot(hpc$Time, hpc$Sub_metering_1, type = "l", xlab = "" , ylab= "Energy sub metering")
 points(hpc$Time, hpc$Sub_metering_2, col= "red", type = "l")
 points(hpc$Time, hpc$Sub_metering_3, col= "blue", type = "l")
 legend("topright", inset= c(0, -0.1 ),cex=0.5, pt.cex=1, y.intersp=0.3, x.intersp=0.3, bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  

  plot(hpc$Time, hpc$Global_reactive_power, type="l", xlab = "datetime")



#copy plot to png file

dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()