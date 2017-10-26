#Try scraping based on google search
#Ticker symbol before --> </a> <span class="_RWc
#And stock exchange after that

library("stringr")
library("XML")  #for parsing
library("rvest")
library("RCurl")
library("XML")


#functions to locate start and end of name
#functions in the main function
locate_start = function(x,pat){
  end = str_locate_all(pattern = pat,x)[[1]][1,1]
  return (end)
}

locate_end = function(x,pat){
  end = str_locate_all(pattern = pat,x)[[1]][1,2]
  return (end)
}

setwd("C:/Users/HUANGJ/Desktop/items/Rewards research/Paynet")
coy = read.csv("de_deup_parent_coy_ticker_symbol.csv", stringsAsFactors = FALSE)

coy$format_name = gsub("[[:punct:]]", "", coy$ClientName_parent)
coy$format_name = gsub("( )+", "+", coy$format_name)
# https://www.google.com.sg/search?q=berkshire+hathaway
coy$google_search = paste("https://www.google.com.sg/search?q=",coy$format_name,sep = "")
coy$ticker = ""
coy$exchange = ""

for(i in 1:nrow(coy)){
  print(i);print(coy$google_search[i])
  html = getURL(coy$google_search[i], ssl.verifypeer = FALSE)
  # a = as.data.frame(html); a$html = as.character(a$html)
  
  if(grepl('</a> <span class=\"_tA\">',html)){
    
    ticker = str_locate(html,'</a> <span class=\"_tA\">')[1,1]

    coy$ticker[i] = substring(html, first = ticker - 50, last = ticker+50)  
    # fortune100$descr[i] = substring(fortune100$descr[i], first = str_locate(fortune100$descr[i],"<p>")+3, last = -1 + str_locate(fortune100$descr[i],"</p>")) 
    
  }
}  









