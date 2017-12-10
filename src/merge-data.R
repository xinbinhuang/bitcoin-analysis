#! /usr/bin/env Rscript 
# merge-data.R
# Xinbin Huang, 2017
#
# This script merge the raw data into one dataframe for subsequent analysis
# The merged data will ouput to the result folder. This takes three arguments:
# data1 : The path to the first data being merged
# data2 : The path to the second data being merged
# output: The path/filename where to write the file to and what to call it (e.g., results/merged-data.csv)
# Usage: Rscript src/merge-data.R data/bitcoin_price.csv data/bitcoin_dataset.csv results/merged-data.csv

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
data1 <- args[1]
data2 <- args[2]
output <- args[3]

# define main function
main <- function(){
      
      # loading packages
      suppressPackageStartupMessages(library(lubridate))
      suppressPackageStartupMessages(library(tidyverse))
      
      # load the data into R
      price <- read_csv(data1)
      feature <- read_csv(data2)
      
      # merge the two dataset
      price$Date <- mdy(price$Date, tz = "UTC")
      bitcoin <- left_join(price, feature)
      
      ## output the data to results folder
      write_csv(bitcoin, output)
}

# call main function
main()
      