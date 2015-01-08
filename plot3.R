plot3 <- function() {
  
  epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", as.is=TRUE, na.strings = "?")
  
  epcreqdata <- epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date == "2/2/2007"),]

  epcreqdata <- cbind(epcreqdata, strptime(paste(epcreqdata$Date, epcreqdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

  test3 <- colnames(epcreqdata)
  
  test3[10] <- "dateandtime"
  
  colnames(epcreqdata) <- test3
  
  png("plot3.png", width = 480, height = 480)
  
  with(epcreqdata, plot(dateandtime, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n"))
  
  with(epcreqdata, lines(dateandtime, Sub_metering_3, col="blue"))
  
  with(epcreqdata, lines(dateandtime, Sub_metering_2, col="red"))
  
  with(epcreqdata, lines(dateandtime, Sub_metering_1))
  
  legend("topright", pch = 32, col = c("black", "blue", "red"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  
  
}

#> plot(test2,epcreqdata$Sub_metering_1)
#> plot(test2,epcreqdata$Sub_metering_1, pch=".")
#> lines(test2,epcreqdata$Sub_metering_1)
#> plot(test2,epcreqdata$Sub_metering_2, pch=".", col="red")
#> lines(test2,epcreqdata$Sub_metering_1)
#> lines(test2,epcreqdata$Sub_metering_1)
#> plot(test2,epcreqdata$Sub_metering_1, pch=".")
#> lines(test2,epcreqdata$Sub_metering_1)
#> plot(test2,epcreqdata$Sub_metering_2, col="red")
#> dev.set(4)