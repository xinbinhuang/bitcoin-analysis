Bitcoin-analysis
================
Xinbin Huang
December 10, 2017

Project Overview
----------------

The value of *Bitcoin* has increased a lot since it was invented. Also, more and more people are interested in investing in *Bitcoin*. It seems interesting to invetigate the factors that affec the price.

This project perform a simple analysis on the effect of two factors on *Bitcoin* price.

Research Question
-----------------

-   Does the difficulty to find a new block affect the price of *Bitcoin*?
-   Does the volume of the *Bitcoin* affect the price of *Bitcoin*?

Hypothesis
----------

-   The price of *Bitcoin* would be higher with increasing difficulty to find a new block because lower supplies (new blocks) makes *Bitcoin* more valuable.
-   The volume of the *Bitcoin* would positively affect the price of *Bitcoin* because higher the volume, more investors would like to buy it.

Data
----

The dataset includes the historical price and features data of the cryptocurrency *Bitcoin* from . It is retrieved from Kaggle [Cryptocurrency Historical Prices](https://www.kaggle.com/sudalairajkumar/cryptocurrencypricehistory)

Let's take a look at the data frame for analysis. `Close` is the daily closing price of *Bitcoin* from 2013-4-28 to 2017-11-07. `btc_difficulty` is a relative measure of the difficulty in finding a new block. `Volume` is the volume of transactions on the given day.

    ## # A tibble: 6 x 4
    ##         Date   Close btc_difficulty     Volume
    ##       <dttm>   <dbl>          <dbl>      <dbl>
    ## 1 2017-11-07 7144.38    1.45284e+12 2326340000
    ## 2 2017-11-06 7022.76    1.45284e+12 3111900000
    ## 3 2017-11-05 7407.41    1.45284e+12 2380410000
    ## 4 2017-11-04 7379.95    1.45284e+12 2483800000
    ## 5 2017-11-03 7207.76    1.45284e+12 3369860000
    ## 6 2017-11-02 7078.50    1.45284e+12 4653770000

Below is the pair-plots for these 3 variables. We can see that both `Volume` and `btc_difficulty` are positively correlated with the price `Close`.

![](../results/figure/analysis-plot.png)

Analysis
--------

Here we will first look at some descriptive statistics of the data.

    ##    Var1           Var2                          Freq
    ## 1                 Date Min.   :2013-04-28 00:00:00  
    ## 2                 Date 1st Qu.:2014-06-15 12:00:00  
    ## 3                 Date Median :2015-08-03 00:00:00  
    ## 4                 Date Mean   :2015-08-03 00:00:00  
    ## 5                 Date 3rd Qu.:2016-09-19 12:00:00  
    ## 6                 Date Max.   :2017-11-07 00:00:00  
    ## 7                 Date                          <NA>
    ## 8                Close             Min.   :  68.43  
    ## 9                Close             1st Qu.: 264.13  
    ## 10               Close             Median : 453.38  
    ## 11               Close             Mean   : 826.29  
    ## 12               Close             3rd Qu.: 744.82  
    ## 13               Close             Max.   :7407.41  
    ## 14               Close                          <NA>
    ## 15      btc_difficulty           Min.   :8.974e+06  
    ## 16      btc_difficulty           1st Qu.:1.176e+10  
    ## 17      btc_difficulty           Median :5.228e+10  
    ## 18      btc_difficulty           Mean   :1.939e+11  
    ## 19      btc_difficulty           3rd Qu.:2.258e+11  
    ## 20      btc_difficulty           Max.   :1.453e+12  
    ## 21      btc_difficulty                          <NA>
    ## 22              Volume           Min.   :2.858e+06  
    ## 23              Volume           1st Qu.:2.163e+07  
    ## 24              Volume           Median :5.042e+07  
    ## 25              Volume           Mean   :2.783e+08  
    ## 26              Volume           3rd Qu.:1.220e+08  
    ## 27              Volume           Max.   :4.654e+09  
    ## 28              Volume                 NA's   :243

We can see that there are a big range for three groups of the variable (except `Date`). But we cannot really get any conclusions from the table above. Here below let's perform a regression analysis.

    ##                    term      estimate    std.error statistic       p.value
    ## 1           (Intercept)  2.667166e+02 9.889656e+00 26.969250 1.707039e-129
    ## 2        btc_difficulty  2.099300e-09 4.818360e-11 43.568770 2.837285e-263
    ## 3                Volume -2.110627e-07 4.588188e-08 -4.600132  4.601666e-06
    ## 4 btc_difficulty:Volume  1.101815e-18 4.158002e-20 26.498663 7.266806e-126

As the results shown, all terms (`btc_difficulty`, `Volume`, and the inetration term) are significant at 5% level according to their p-values. However, `Volume` is in fact negatively correlated with the price which contradicts my previous assumption.

Conclusion
----------

The price of *Bitcoin* is indeed affected by the difficulty to find a new block, which makes sense that *Bitcoin* becomes much more valuable when new blocks are more difficult to find. However, the volume of the *Bitcoin* seems to drive down the price of *Bitcoin*. When the volume is high, more people are trying to sell the *Bitcoin*.
