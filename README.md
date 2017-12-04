# Bitcoin-analysis

_Author_: Xinbin Huang

### Data

> The dataset includes the historical price and features data of the cryptocurrency _Bitcoin_. It is retrieved from Kaggle [Cryptocurrency Historical Prices](https://www.kaggle.com/sudalairajkumar/cryptocurrencypricehistory)

- The downloaded files are located in `data` folder.
- There are two `.csv` files (`features.csv` and `price.csv`) in the `results` folder to prove that I successfully load the dataset into R and output them.
- Two scripts were used to download the data and test to load the data into R. They are in the `src` folder.

### Research Question

> Does the difficulty to find a new block affect the price of _Bitcoin_?

### Hypothesis 

> The price of _Bitcoin_ would be higher with increasing difficulty to find a new block because lower supplies (new blocks) makes _Bitcoin_ more valuable.

### Analysis Overview 

> I am going first to do some exploratory analysis (i.e. plot a scatter plot) to get a brief idea about the relationship between the two variables. Then I will run a linear regression model to test their relationships. The final results will be visualized as a graph summarized the relationship.
