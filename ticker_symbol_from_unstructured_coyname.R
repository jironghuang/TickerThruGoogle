#Develop a function that taps on google search apito map any unstructured company 

library("stringr")
library("XML")  #for parsing
library("rvest")
library("RCurl")
library("XML")


ticker_symbol = function(unstruc_name){
  
  struc_name = gsub("[[:punct:]]", "", unstruc_name)
  struc_name = gsub("( )+", "+", struc_name)
  struc_name = paste("https://www.google.com.sg/search?q=",struc_name,"+morningstar",sep = "")
  html = getURL(struc_name, ssl.verifypeer = FALSE)
  
  if(grepl('Stock Quote Price News',html)){
    ticker = str_locate(html,'Stock Quote Price News')[1,1]
    ticker = substring(html, first = ticker - 50, last = ticker+20)  
    # fortune100$descr[i] = substring(fortune100$descr[i], first = str_locate(fortune100$descr[i],"<p>")+3, last = -1 + str_locate(fortune100$descr[i],"</p>")) 
    # ticker = sapply(strsplit(ticker, "<b>|</b>"), "[")[nrow(sapply(strsplit(ticker, "<b>|</b>"), "["))]
    
    start = str_locate(ticker,":")[1,1] + 1
    end = str_locate(ticker,"Stock Quote Price")[1,1] -2 
    
    ticker = substring(ticker, first = start, last = end) 
    ticker = gsub("<b>|</b>","",ticker)
    
    return(ticker)  
  } else{
    return(NULL)  
  }
  
}

# ticker_symbol("caterpillar")
#Can use lapply to add additional column -->coy$ticker = lapply(coy$html,ticker_symbol)

