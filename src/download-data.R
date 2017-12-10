#! /usr/bin/env Rscript 
# download-data.R
# Xinbin Huang, 2017
#
# This script downloads the required bitcoin data for this analysis. 
# The downloaded data is located in the `data` folder. This script takes no argument.
#
# Usage: Rscript download-data.R

# define main function
main <- function(){
      
      # download "bitcoin_dataset.csv"
      if(file.exists(!"../data/bitcoin_dataset.csv"))
      {download.file(url = "https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_dataset.csv",
                     destfile = "../data/bitcoin_dataset.csv", method = "curl")}
      
      # download "bitcoin_price.csv"
      if(file.exists(!"../data/bitcoin_price.csv"))
      {download.file(url = "https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_price.csv",
                     destfile = "../data/bitcoin_price.csv", method = "curl")}
}

# call main function
main()



