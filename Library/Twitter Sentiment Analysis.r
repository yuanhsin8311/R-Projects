## Amazon Customer Service Analysis
## (Objective) Discover the positive and negative opinions about a product or a brand 

# Install package
library(twitteR)

# Get Twitter Authentication
api_key <- "tnBE3xfBFKn4CjMqHJMNPROvJ"
api_secret <- "ZubR8tctyB827d53Xuj4qoUlCVlnGFHyjCmqm9Z5IBBz3frbuS"
access_token <- "785536933-LlXiXJEnkb89YTpbLWQl95BbHY3YobrBPlbkMJyf"
access_token_secret <- "NjGZ4NXMoNi2ll7L0WZL9w6QxJx5TXM4ysW3fjVFjLi9F"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# Gather Data
user <- getUser("Amazon")
Amazon <- userTimeline(user,n=5000)

# Summarize information about a list of tweets in a data frame
Amazon <- twListToDF(Amazon)
Amazon <- Amazon$text

# Get hashtags
library(stringr)
Amazon_Hash_Tags <- str_extract_all(Amazon,"#\\w+")

# Hashtags Frequency Table
freq <- table(unlist(Amazon_Hash_Tags))
                
# Visualization: segmentation/customer review
install.packages("wordcloud")
library(wordcloud)
wordcloud(names(freq),freq,colors="steelblue")
title("What is Amazon tweeting about? \n\n")


