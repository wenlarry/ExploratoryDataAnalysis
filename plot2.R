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
# Note: xaxt="n" - removes x axis label
# annotate x axis labels

plot(  as.numeric(as.character
                  (data$Global_active_power)) 
       ,type= "l",ylab="Global 
       Active Power (kilowatts)",
       xlab="",xaxt="n")      
 
axis(side=1, at=1, label= "Thu")

axis(side=1, at=1450, label= "Fri") 

axis(side=1, at=2900, label= "Sat") 
 
#Save file 
dev.copy(png,file="plot2.png",height=480, width=480)
dev.off() 
 