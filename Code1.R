install.packages("plyr")
library(plyr)
Primary.Income <- read.csv("Primary.Income.csv")
Secondary.Income <- read.csv("Secondary.Income.csv")
Service.Export <- read.csv("Service.Export.csv")
Service.Import <- read.csv("Service.Import.csv")
Trade.Export <- read.csv("Trade.Export.csv")
Trade.Import <- read.csv("Trade.Import.csv")
BOPData <- join(Primary.Income,Secondary.Income, by=c("EoP","Period","Trend"))
BOPData$Avg..Urals....bbl <- NULL
Oildata <- join(Trade.Export, Trade.Import, by=c("EoP","Period","Trend"))
Oildata$Trade.export...bn <- Oildata$Trade.import...bn <- NULL
BOPData$EoP <- as.Date(BOPData$EoP, "%m/%d/%y")
barplot(BOPData$Primary.income...bn, main="Primary Income, 2005-2017", xlab="Quarters", ylab="bn USD", names.arg=c(BOPData$EoP))
