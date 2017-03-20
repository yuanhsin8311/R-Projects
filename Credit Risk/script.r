library(gmodels)
CrossTable(loan_data$home_ownership)
CrossTable(loan_data$home_ownership, loan_data$loan_status,prop.r = TRUE, prop.c = FALSE, prob.t = FALSE,prob.chisq = FALSE) 
                    y                         x
------------------------------------------------------------------------------------------------------------------------------
prop.r
If TRUE, row proportions will be included
prop.c
If TRUE, column proportions will be included
prop.t
If TRUE, table proportions will be included
prop.chisq
If TRUE, chi-square contribution of each cell will be included
-------------------------------------------------------------------------------------------------------------------------------

### Histogram and Outlier
hist_interest = hist(loan_data$int_rate, main="Histogram of Interest Rate", xlab="Interest Rate")
hist_interest$breaks

(1) The breaks argument
n_breaks <- sqrt(nrow(loan_data))  -- square root of number of vectors
hist_income_n <- hist(loan_data$annual_inc, breaks= n_breaks, xlab= "Annual Income", main = "Histogram of Annual Income") 
plot(loan_data$annual_inc, ylab="Annual Income")

(4) Outliers
# 1. expert judgement: "Annual salaries > $3 million are outliers "
index_outlier_expert <- which(loan_data$annual_inc > 3000000)  -- which() returns the true objects
loan_data_expert <- loan_data[-index_outlier_expert,]

# 2. rule of thumb: Q1 - 1.5*IQR / Q3 + 1.5IQR
#    IQR(Interquantile Range) : Q3 - Q1 




















