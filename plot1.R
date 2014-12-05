household_power_consumption <- read.csv("C:/R_dir/COURSERA/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
hpc = household_power_consumption[household_power_consumption$Date == "2/2/2007" | household_power_consumption$Date == "1/2/2007",]
hpc$Global_active_power = as.numeric(as.character(hpc$Global_active_power))
hpc$Date = as.Date(hpc$Date, format="%d/%m/%Y")

par(mfrow=c(1,1))
hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red" )
axis(side=2, tck = 200, lwd= 0,at = c(0,200,400,600,800,1000,1200), labels=c("","","400","","800","","1200"))
dev.copy(png, "plot1.png")
dev.off()
