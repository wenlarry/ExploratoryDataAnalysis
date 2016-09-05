#Download zip file ' exdata-data=NEI_data' to working
# directory and unzipped file

#Read file

NEI<-readRDS("summarySCC_PM25.rds") 
SCC<-readRDS("Source_Classification_Code.rds") 

library(ggplot2, dplyr) 

#Select required columns; filter only Baltimore City;
#group_bytype and year; sum the Emissions into a total
#titled 'emissions'; assign to file 'bc'. 

bc<-select(NEI,fips, Emissions,type,year) %>%
    filter(fips==24510) %>% group_by(type,year) %>%
    summarize(emissions=sum(Emissions) ) 
    
#Plot

png(filename="plot3.png")  

ggplot(bc, aes(year, emissions, color = type)) + geom_line() +
        geom_point() + labs(title = "Total Emissions by Type
                            (Baltimore City)",
                            x = "Year",
                            y = "Total Emissions")

dev.off() 
