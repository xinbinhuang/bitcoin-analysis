#! /usr/bin/env Rscript 
# download-data.R
# Xinbin Huang, 2017
#
# This script downloads the required bitcoin data for this analysis. 
# The downloaded data is located in the `data` folder. 
# This should take two arguments
# - url:                      a URL pointing to the data
# - path-to-store-file:       a path/filename where to write the file to and what to call it data/data.csv
#
# Usage: Rscript src/download-data.R url path-to-store-file

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
data_url <- args[1]
path <- args[2]

# define main function
main <- function(){
      args <- commandArgs(trailingOnly = TRUE)
      # download "bitcoin_dataset.csv"
      if(!file.exists(data_url))
      {download.file(url = data_url,
                     destfile = path, method = "curl")}
      
      # download "bitcoin_price.csv"
      if(!file.exists(data_url))
      {download.file(url = data_url,
                     destfile = path, method = "curl")}
}

# call main function
main()



