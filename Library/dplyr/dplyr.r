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
#  This dataset contains 336,776 flights that departed from New York City in 2013. 
#  Source from US Bureau of Transportation Statistics

# Data Shape: number of row, number of column
dim(flights) 
# Data Structure: column's data type
str(flights)

# Print last 5 rows of data
tail(flights,n=5)
# Print first 5 rows
head(flights)

## dplyr
# filter()
filter_1 <- filter(flights,months==9 | months==10 ,day<2)
# slice()

