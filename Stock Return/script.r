set.seed(123)

# set up the data
install.packages("quantmod")
library(quantmod)

BLK = getSymbols("BLK", from = "1999-09-30", to = "2017-02-28", auto.assign = F)
adj_BLK = BLK$BLK.Adjusted
adj_BLK_ret = dailyReturn(adj_BLK)

plot(adj_BLK, main="BlackRock Adjusted Price")
plot(adj_BLK_ret, main = "BlackRock Adjusted Return")

# transformation for data
adj_BlK_diff = diff(adj_BLK, 1, 1)
plot(adj_BlK_diff, main = 'BlackRock detrend adjusted price')

install.packages("tseries")
library("tseries")

adf.test(as.numeric(adj_BLK), alternative = 's')
adf.test(as.numeric(adj_BLK_ret), alternative = 's')
adf.test(as.numeric(adj_BLK_diff[2:length(adj_BLK_diff)]),alternative='s')

# ACF test and Ljung box test
acf(adj_BLK_ret)
Box.test(adj_BLK_ret,lag=10,type="Ljung-Box")
pacf(adj_BLK_ret)












