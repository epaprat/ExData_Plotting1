Sys.setenv(LANG = "en_US.UTF-8")
Sys.setlocale("LC_TIME", "C")
pcons = read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

dates <- pcons$Date
times <- pcons$Time

datetimes <- as.POSIXct(strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S"))
pcons$Date <- datetimes
pcons$Time = NULL
pcons.sub <- pcons[as.Date(pcons$Date) >= '2007-02-01' & as.Date(pcons$Date) <= '2007-02-02',]


plot(pcons.sub$Date, pcons.sub$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="", ylim=c(0,40))
lines(pcons.sub$Date, pcons.sub$Sub_metering_2, type="l", col="red")
lines(pcons.sub$Date, pcons.sub$Sub_metering_3, type="l", col="blue")
legend("topright", lwd="1", col=c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), cex=0.6)


