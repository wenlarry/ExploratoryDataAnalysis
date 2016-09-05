NEI<-readRDS("summarySCC_PM25.rds") 
SCC<-readRDS("Source_Classification_Code.rds") 

coalscc<-filter(SCC,grepl("Coal", EI.Sector))

coalnei<-select(NEI,-c(Pollutant,type)) %>%filter(fips==
"24510"|fips=="06037") 
 
coalj<-full_join(coalscc,coalnei ,by="SCC") 

coalem<-select(coalj,year, Emissions,fips) %>%group_by(
year,fips)%>%summarize(te=sum(Emissions)) %>%mutate(fips=
replace(fips,fips=="24510","Baltimore")) %>%mutate(fips=
replace(fips,fips=="06037","Los Angeles"))  

View(coalem) 

#Optional for change to non scientific notations
# Code-format(coalem,scientific=FALSE) 

png(filename="plot6.png")  

ggplot(coalem,aes(year, te,color=fips) )+geom_line()+
geom_point()+labs(title = "Total Emissions from motor vehicle sources
in Baltimore and Los Angeles",x = "Year", y = "Total 
Emissions") 

dev.off() 