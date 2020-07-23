library(rtweet)
library(tidyverse)

appname <- "tourism_project"
consumer_key <- 'bITHJhMwqpONhxsF6MegjCLlI'
consumer_secret <- 'qfC7HO87nLXks2AqfqAZhqaFB48vMvoenKjp67AmsCpHacXXif'
access_token <- '1220015691689889792-fL2WWD82muvyrnJe6G29BnMZfQVFjM'
access_token_secret <- '3AUkhXrky4Y2BNVBOmRnbU2i0B5euVHWvxpUg9HHT8phi'
twitter_token <- create_token(
  app = appname,
  consumer_key = consumer_key,
  consumer_secret = consumer_secret,
  access_token = access_token,
  access_secret = access_token_secret)


analyze_tweet_fun <- function(hashtag){
  search_tweets(q = hashtag,
                n = 10) %>% as_tibble() %>% select(c("created_at","screen_name","text"))
}
