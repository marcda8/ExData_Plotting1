HPC <- read.csv("~/Coursera/Course3/Week1/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", 
                 stringsAsFactors=FALSE)
HPC$Date = as.Date(HPC$Date, format = "%d/%m/%Y")

HPD = HPC[HPC$Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02")) ,]

HPD$Time2 = as.POSIXlt(paste(HPD$Date, HPD$Time, sep=" "))

HPD$Global_active_power = as.numeric(HPD$Global_active_power)
HPD$Global_reactive_power = as.numeric(HPD$Global_reactive_power)
HPD$Sub_metering_1 = as.numeric(HPD$Sub_metering_1)
HPD$Sub_metering_2 = as.numeric(HPD$Sub_metering_2)
HPD$Sub_metering_3 = as.numeric(HPD$Sub_metering_3)
HPD$Voltage = as.numeric(HPD$Voltage)

# Creating 2 x 2 plots
par(mfrow=c(2,2))
par(mar = c(5.1,4.1,4.1,2.1))

#Reproducing plot 2
plot(HPD$Time2,HPD$Global_active_power, type="n",
     main=NULL,
     xlab="",
     ylab = "Global Active Power")
lines(HPD$Time2,HPD$Global_active_power)

#Creating the second plot
plot(HPD$Time2, HPD$Voltage, type="n",
     main = NULL,
     xlab = "datetime",
     ylab="Voltage")
lines(HPD$Time2,HPD$Voltage)

#Creating the third plot
plot(HPD$Time2,HPD$Sub_metering_1,
     type="n",
     main=NULL,
     xlab="",
     ylab = "Energy sub metering")
lines(HPD$Time2,HPD$Sub_metering_1)
lines(HPD$Time2,HPD$Sub_metering_2, col="red")
lines(HPD$Time2,HPD$Sub_metering_3, col="blue")
legend("topright",
       col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       box.lwd=0,
       cex=0.7,
       bty='n',
       y.intersp=0.5,
       #xjust=0.7,
       #yjust=1,
       inset=c(0.05,-0.05)
       )

#Creating the last plot
plot(HPD$Time2,HPD$Global_reactive_power,
     type="n",
     main=NULL,
     xlab="datetime",
     ylab = "Global_reactive_power")
lines(HPD$Time2,HPD$Global_reactive_power)

#Exporting to PNG
dev.copy(png, file="plot4.png")
dev.off()