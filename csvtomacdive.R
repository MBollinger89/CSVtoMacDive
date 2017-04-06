#This script provides documentation to convert *.csv to *.xml used in importing dives into MacDive
#specifically to bring in AAUS dive logging software *.csv exports

#clear Workspace at beginning of code
rm(list=ls(all=TRUE))## clear workspace

#bring in data
data <- read.csv("~/R/CSVtoMacDive/Dives_Report_MBollinger89_2017_04_04-10_34.csv")
diver <- c("Mike Bollinger")

#Remove spaces
#spaceless <- function(x){colnames(x) <- gsub(" ", "_", colnames(x));x}
#data <- spaceless(data)

#add date and time together
mydates <- as.Date(data$Date, "%m/%d/%Y")
mytimes <- format(strptime(data$Time, format = "%I:%M %p"), format = "%H:%M:%S")
data$combdate <- as.POSIXct(paste(mydates, mytimes),format = "%Y-%m-%d %H:%M:%S")

#Add column with random identifier
library(random)
data$identifier <- randomStrings(n=nrow(data), len=20, digits=TRUE, upperalpha=TRUE, loweralpha=TRUE, unique=TRUE, check=TRUE)

#add buddies first and last name together, create column buddy
data$First.buddy <- with(data, paste(Buddy.First.Name, Buddy.Last.Name, sep = ' '))
data$Second.buddy <- with(data, paste(Second.Buddy.First.Name, Second.Buddy.Last.Name, sep = ' '))

#change duration from min to Sec
data$Duration..min. <- as.numeric(data$Duration..min.)#turn it into a number first
data$Duration..min. <- data$Duration..min. * 60

#Fix surface interval
#change HR:MIN to MIN
library(lubridate)
SI <- hms(data$Surface.Interval)
data$Surface.Interval <- hour(SI)*60 + minute(SI)
#remove >24 hrs; change to 0
data$Surface.Interval[is.na(data$Surface.Interval)] <- 0


#reorder
#exdiv2 <- exdiv2[c(13,1,2,3,4,5,6,7,8,9,10,11,12)]

#Create XML Tree
library(XML) 

xml <- xmlTree("dives",dtd = 'dives SYSTEM "http://www.mac-dive.com/macdive_logbook.dtd"') #dtd manipulates the doc type header

#create offset before dives begin
xml$addTag("units", "Imperial",close = T)
xml$addTag("schema", "2.2.0", close = T)

for (i in 1:nrow(data)) { 
    xml$addTag("dive", close=FALSE) 
        xml$addTag("date", data[i, "combdate"])
        xml$addTag("identifier", data[i,"identifier"])
        xml$addTag("diveNumber", data[i,"Dive.Number"])
        xml$addTag("diver", diver)
        xml$addTag("computer", "Oceanic Veo 2.0")   #Manually add computer
        xml$addTag("maxDepth", data[i,"Depth..ft."])
        xml$addTag("duration", data[i, "Duration..min."])
        xml$addTag("surfaceInterval", data[i,"Surface.Interval"])
        xml$addTag("diveOperator", "FWC")
        xml$addTag("boat", "Lobster Parker")
        xml$addTag("entryType", "Boat")
        
        xml$addTag("site", close = F)
            xml$addTag("country", "USA")
            xml$addTag("location", "Marathon, FL")
            xml$addTag("name", data[i, "Specific.Location"])
        xml$closeTag()   
        
        xml$addTag("tags", close = F)  
            xml$addTag("tag", "Florida Keys")
        xml$closeTag()
        
        xml$addTag("types", close = F)
            xml$addTag("type", data[i,"Purpose.s."])
        xml$closeTag()
        
        xml$addTag("buddies", close = F)
            xml$addTag("buddy", data[i, "First.buddy"])
            xml$addTag("buddy", data[i, "Second.buddy"])
        xml$closeTag()
        
        #add gear
        xml$addTag("gear", close = F)
            xml$addTag("item", close = F)
                xml$addTag("type", "Computer")
                xml$addTag("manufacturer", "Oceanic")
                xml$addTag("name", "Oceanic Veo 2.0")
                xml$addTag("serial", "")
            xml$closeTag()
        xml$closeTag()    
    #for (j in names(exdiv2)) { 
    #    xml$addTag(j, exdiv2[i, j])
#
    #} 
    xml$closeTag() 
} 
xml$closeTag() 

# view the result 
cat(saveXML(xml))

#save the result
cat(saveXML(xml,encoding = "UTF-8", indent = T), file = "dives_4_4_2017.xml") 

