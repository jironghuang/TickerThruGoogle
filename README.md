# TickerThruGoogle and morningstar
Identifying ticker symbols through google search

I tried an innovative way to find out the ticker symbols using Google Search but the type 2 error is damn high. But anyway, I'm attaching the code here for reference in case anyone wants to use it.

Realising the high type 2 error (fail to identify a lot of 'correct things' when it should have), I modified the search term to company name + morningstar. Then I extract the body of text before 'Stock Quote Price News - Morningstar'. Presto! With the identified the ticker symbol, you can extract the wealth of information in morningstar database!

When I've time, I'll probably sync this with my 'scrape_morningstar' repository to write the following function: obtain_fin_info_w_unstructured_coy_name (unstructured_coy_name).

The above function will first find the 'ticker' symbol then go to morningstar database to extract all the info!

At the moment I wrote a function in ticker_symbol_from_unstructured_coyname.R to pin-point the ticker symbol with any unstructured company names. 

Feel free to transform use the scripts and functions!
