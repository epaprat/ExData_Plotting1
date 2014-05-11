pcons = read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")

dates <- pcons$Date
times <- pcons$Time

datetimes <- as.POSIXct(strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S"))
pcons$Date <- datetimes
pcons$Time = NULL
pcons.sub <- pcons[as.Date(pcons$Date) >= '2007-02-01' & as.Date(pcons$Date) <= '2007-02-02',]

hist(pcons.sub$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", ylim=c(1,1300))

