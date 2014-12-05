household_power_consumption <- read.csv("C:/R_dir/COURSERA/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc = household_power_consumption[household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007",]
hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))
hpc$Date = as.Date(hpc$Date, format="%d/%m/%Y")


a = as.POSIXct(paste((hpc$Date), hpc$Time))
hpc$date_time = a

par(mfrow=c(2,2))
Sys.setlocale("LC_TIME", "English")

plot(hpc$Global_active_power~hpc$date_time, type="l", ylab="Global Active Power", xlab="")
plot(hpc$Voltage~hpc$date_time, type="l", xlab="datetime")


plot(hpc$Sub_metering_1~hpc$date_time, type="l", ylab="Energy Submetering", xlab="")
lines(hpc$Sub_metering_2~hpc$date_time, col="red")
lines(hpc$Sub_metering_3~hpc$date_time, col="blue")
legend("topright",legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black","red","blue"), lwd=1, bty="n", cex = 0.7, xjust=1)

plot(hpc$Global_reactive_power~hpc$date_time, type="l", xlab="datetime")

dev.copy(png, "plot4.png")
dev.off()
