
#Download "household_power_consumption.txt" file to 
#working directory
#  
#Import full text file into RStudio
#
#Rename full text file as 'alldata'
#
# (Use the Import Dataset function in RStudio)
#
# LoadR packages - readr, dplyr
#
#subset 'alldata' for relevant dates i.e 2007-02-01
#and2007-02-02


data<-slice(alldata,66637:69516)  

#Concatenate the date and time
dat= paste(data$Date,data$Time) 

#Convert date and time 
dat<-strptime(dat,"%d/%m?%Y %H:%M:%OS") 

#Plot and save file

png(filename="plot4.png",width=480,
    height=480, units="px")

par(mfrow=c(2,2)) 

#Top_left

plot(as.numeric(as.character(data$Global_active_power)),    
type="l",xlab="",ylab="Global Active Power") 

#Top_Right
plot(as.numeric(as.character(data$Voltage)),
type="l",xlab="",ylab="Voltage")

#Bottom_Left

plot(as.numeric(as.character(data$Sub_metering_1)),
type="l",xlab="",ylab="Energy sub metering",col="black")

lines(data$Sub_metering_2,col="red")
lines(data$Sub_metering_3,col="blue") 

legend('topright',bty="n",col=c("black","red","blue"),
       c("Sub-metering_1","Sub_metering_2",
         "Sub_metering_3"),lwd="1") 

## Bottom_Right

plot(as.numeric(as.character (data$Global_reactive_power)),
type="l", xlab="", ylab="Global_reactive_power",col="black"
)

dev.ofF() 




