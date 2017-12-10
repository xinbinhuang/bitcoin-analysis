#! /usr/bin/env Rscript 
# descriptive.R
# Xinbin Huang, 2017
#
# This script gives the descriptive analysis for the variables `Close`, `Volume`, 
# and `measure of difficulty to mine a new block`. 
# 
# This should take two arguments
# - data:         a path pointing to the data
# - output:       a path/filename where to write the file to and what to call it (i.e. results/descriptive-result.csv)
#
# Usage: Rscript src/descriptive.R results/merged-data.csv results/descriptive-result.csv

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
      
      # perform descriptive analysis
      descrptive <- tidy(summary(bitcoin))
      
      ## output the result to results folder
      write_csv(descrptive, output)
}

# call main function
main()




