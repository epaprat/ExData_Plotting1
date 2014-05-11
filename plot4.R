Sys.setenv(LANG = "en_US.UTF-8")
Sys.setlocale("LC_TIME", "C")
pcons = read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

dates <- pcons$Date
times <- pcons$Time

datetimes <- as.POSIXct(strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S"))
pcons$Date <- datetimes
pcons$Time = NULL
pcons.sub <- pcons[as.Date(pcons$Date) >= '2007-02-01' & as.Date(pcons$Date) <= '2007-02-02',]

par(mfrow = c(2,2), mar = c(2,4,1,1), oma = c(0,0,2,0), cxy= 0.8)
plot(pcons.sub$Date, pcons.sub$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(pcons.sub$Date, pcons.sub$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(pcons.sub$Date, pcons.sub$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="", ylim=c(0,40))
lines(pcons.sub$Date, pcons.sub$Sub_metering_2, type="l", col="red")
lines(pcons.sub$Date, pcons.sub$Sub_metering_3, type="l", col="blue")
legend("topright", lwd="1", col=c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),inset=0, bty="n", lty=c(1,1), cex=0.6)
plot(pcons.sub$Date, pcons.sub$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime", ylim=c(0.0,0.6))
