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

data<-slice  (alldata,66637:69516)

#Concatenate the date and time
dat= paste(data$Date,data$Time) 

#Convert date and time 
dat<-strptime(dat,"%d/%m?%Y %H:%M:%OS") 

#Plot
#Note: xaxt="n" = removes x axis label
#annotate x axis labels

png(filename="plot3.png",width=480,
    height=480, units="px")

plot(as.numeric(as.character(data$ Sub_metering_1)),
     type="l",col="black",xlab="", 
     ylab="Energysub metering",xaxt="n") 

lines(data$Sub_metering_2, col="red") 

lines(data$Sub_metering_3,col="blue") 

legend("topright", col=c("black", 
        "red","blue"), c("Sub_metering_1",
        "Sub_metering-2","Sub_metering_3") ,
       lwd=1) 

axis(side=1, at=1, label="Thu") 

axis(side=1, at =1450, label= "Fri") 

axis(side=1, at =2900, label= "Sat") 

dev.off() 