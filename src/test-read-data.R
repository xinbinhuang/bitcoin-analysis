## loading package
library(tidyverse)

## load the data into R
price <- read_csv("../data/bitcoin_price.csv")
feature <- read_csv("../data/bitcoin_dataset.csv")

## output the data to results folder
write_csv(price, path = "../results/price.csv")
write_csv(feature, path = "../results/feature.csv")
