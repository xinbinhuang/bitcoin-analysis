#! /usr/bin/env Rscript 
# regression.R
# Xinbin Huang, 2017
#
# This script gives the regression analysis for the variables `Close`, `Volume`, 
# and `measure of difficulty to mine a new block`. 
# 
# This should take two arguments
# - data:         a path pointing to the data
# - output:       a path/filename where to write the file to and what to call it (i.e. results/regression-result.csv)
#
# Usage: Rscript src/regression.R results/merged-data.csv results/regression-result.csv

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
data <- args[1]
output <- args[2]

# define main function
main <- function(){
      
      # loading packages
      suppressPackageStartupMessages(library(broom))
      suppressPackageStartupMessages(library(tidyverse))
      
      # load in the data
      bitcoin <- read_csv(data)
      
      # perform regression analysis
      result <- tidy(summary(lm( data = bitcoin, Close ~ btc_difficulty * Volume)))
      
      ## output the result to results folder
      write_csv(result, output)
}

# call main function
main()






