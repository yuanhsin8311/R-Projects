### Data Manipulation Package
## Read text file
mydata = read.table("mydata.txt",header=FALSE,sep="")
## Print data frame
mydata
## Help
? read.table

## CSV file
# sep ="\t"  ","  " "
data = read.csv("data.csv",header=TRUE, sep=",")

## Dataset: nycflights13
# this dataset contains 336,776 flights that departed from New York City in 2013.



