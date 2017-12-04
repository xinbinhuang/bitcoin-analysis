## download the data
download.file(url = "https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_dataset.csv",
              destfile = "../data/bitcoin_dataset.csv", method = "curl")
download.file(url = "https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_price.csv",
              destfile = "../data/bitcoin_price.csv", method = "curl")
