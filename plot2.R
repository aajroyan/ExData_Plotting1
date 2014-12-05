household_power_consumption <- read.csv("C:/R_dir/COURSERA/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc = household_power_consumption[household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007",]
hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))
hpc$Date = as.Date(hpc$Date, format="%d/%m/%Y")


Sys.setlocale("LC_TIME", "English")
par(mfrow=c(1,1))
a = as.POSIXct(paste((hpc$Date), hpc$Time))
hpc$date_time = a
plot(hpc$Global_active_power~hpc$date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, "plot2.png")
dev.off()
