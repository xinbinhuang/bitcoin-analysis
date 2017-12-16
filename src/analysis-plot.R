#! /usr/bin/env Rscript 
# plot.R
# Xinbin Huang, 2017
#
# This output the pair-plots of the three variables
#
# This should take two arguments
# - data:         a path pointing to the data
# - output:       a path/filename where to write the figure to and what to call it
#
# Usage: Rscript src/plot.R results/merged-data.csv results/figure/analysis-plot.png

# read in command line arguments
args <- commandArgs(trailingOnly = TRUE)
data <- args[1]
output <- args[2]

# define main function
main <- function(){

      # loading packages
      suppressPackageStartupMessages(library(GGally))
      suppressPackageStartupMessages(library(tidyverse))

      # read in the data frame
      bitcoin <- read_csv(data)
      data_plot <- bitcoin %>% select(- Date)
      # plot pair-plot
      p <- ggpairs(data_plot) + ggtitle("Pair plot of the three variables")

      # output the data to figure folder
      ggsave(output, plot = p, device = "png")
}

main()
