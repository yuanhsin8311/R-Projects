# Libraries needed
require(dplyr)
require(rpart)
require(ggplot2)
require(randomForest)
# Read the dataset into R
data = read.csv('conversion_data.csv')
head(data)
# Check the structure of the data
str(data)
# Inspect the data to look for weird behavior/wrong data
# R summary function is usually the best place to start:
summary(data)
sort(unique(data$age),decreasing=TRUE)
subset(data, age>79)

# In this case, we can remove them, nothing will change. In general, depending on the problem, you can:
# 1. Remove the entire row (In doubt, always go with removing the row. It is the safest choice.)
# 2. Treat those values as NAs
# 2. If there is a pattern, try to figure out what went wrong.

data = subset(data, age<80)
                        
data_country = data %>% group_by(country) 
                    %>% summarise(conversion_rate=mean(converted))                         
ggplot(data=data_country,aes(x=country,y=conversion_rate))+ geom_bar(stat="identity",aes(fill=country))                                                                                                                                                                                                              
                                                                                                                            
                                                                                                                                                                                                                                                         
                                                                                                                             
