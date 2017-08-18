library(plyr)
library(plotly)
primaryIncome <- read.csv("Primary.Income.csv")
secondaryIncome <- read.csv("Secondary.Income.csv")
serviceExport <- read.csv("Service.Export.csv")
serviceImport <- read.csv("Service.Import.csv")
tradeExport <- read.csv("Trade.Export.csv")
tradeImport <- read.csv("Trade.Import.csv")
balanceOfPayments <- join(primaryIncome,secondaryIncome, by=c("EoP","Period","Trend"))
balanceOfPayments$Avg..Urals....bbl <- NULL
oilData <- join(tradeExport, tradeImport, by=c("EoP","Period","Trend"))
oilData$Trade.export...bn <- oilData$Trade.import...bn <- NULL
balanceOfPayments$EoP <- as.Date(balanceOfPayments$EoP, "%m/%d/%y")
dates <- ((format(balanceOfPayments$EoP,'%Y')))
p <- plot_ly(
  x = c(dates),
  y = c(balanceOfPayments$Primary.income...bn),
  name = "Primary Income, 2005-2017",
  type = "bar"
)
p