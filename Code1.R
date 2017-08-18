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
dates <- as.Date(balanceOfPayments$EoP, "%m/%d/%y")
p <- plot_ly(
  x = c(dates),
  y = c(balanceOfPayments$Primary.income...bn),
  name = "Primary Income",
  type = "bar"
)%>%
  layout(yaxis = list(title = 'usd (bn)'), barmode = 'group') %>%
  layout(xaxis = list(title = 'Primary Income, 2005-2017'), barmode = 'group')
p