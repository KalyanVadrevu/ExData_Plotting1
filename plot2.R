plot2 <- function() {
  
  epcdata <- read.table("household_power_consumption.txt", header= TRUE, sep = ";", as.is=TRUE, na.strings = "?")
  
  epcreqdata <- epcdata[(epcdata$Date=="1/2/2007" | epcdata$Date == "2/2/2007"),]
  
  epcreqdata <- cbind(epcreqdata, strptime(paste(epcreqdata$Date, epcreqdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
  
  test3 <- colnames(epcreqdata)
  
  test3[10] <- "dateandtime"
  
  colnames(epcreqdata) <- test3
  
  png("plot2.png", width = 480, height = 480)
  
  plot(epcreqdata$dateandtime, epcreqdata$Global_active_power, type="n", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  lines(epcreqdata$dateandtime, epcreqdata$Global_active_power)
  
  dev.off()
  
  
}