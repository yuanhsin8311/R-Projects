library(gmodels)
CrossTable(loan_data$home_ownership)
CrossTable(loan_data$home_ownership, loan_data$loan_status,prop.r = TRUE, 


*******************************************************************************************************
prop.r
If TRUE, row proportions will be included
prop.c
If TRUE, column proportions will be included
prop.t
If TRUE, table proportions will be included
prop.chisq
If TRUE, chi-square contribution of each cell will be included
*********************************************************************************************************
