# Driver script
# Xinbin Huang
# Dec 12, 2017
# Runs bitcoin analysis
#
# usage: make all

# run from top to bottom
all: doc/bitcoin_report.md

##########################################################
# Data downloading
##########################################################

# first data set
data/bitcoin_dataset.csv:	src/download-data.R
			Rscript src/download-data.R https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_dataset.csv data/bitcoin_dataset.csv

# second data set
data/bitcoin_price.csv:	src/download-data.R
			Rscript src/download-data.R https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_price.csv data/bitcoin_price.csv

##########################################################
# Data Wrangling
##########################################################

# clean up and merge data for analysis
results/merged-data.csv: src/merge-data.R data/bitcoin_price.csv data/bitcoin_dataset.csv
			Rscript src/merge-data.R data/bitcoin_price.csv data/bitcoin_dataset.csv results/merged-data.csv


###########################################################
# Data Analysis
###########################################################

# perform descriptive analysis
results/descriptive-result.csv: src/descriptive.R results/merged-data.csv
			Rscript src/descriptive.R results/merged-data.csv results/descriptive-result.csv

# perform regression analysis
results/regression-result.csv: src/regression.R results/merged-data.csv
			Rscript src/regression.R results/merged-data.csv results/regression-result.csv


###########################################################
# Figure Generation
###########################################################

# generate pair-plot for the data
results/figure/analysis-plot.png: src/analysis-plot.R results/merged-data.csv
			Rscript src/analysis-plot.R results/merged-data.csv results/figure/analysis-plot.png

###########################################################
# Report Generation
###########################################################

# generate the report from R markdown
doc/bitcoin_report.md: src/bitcoin_report.Rmd results/descriptive-result.csv results/regression-result.csv results/figure/analysis-plot.png results/regression-result.csv
			Rscript -e 'ezknitr::ezknit("src/bitcoin_report.Rmd", out_dir = "doc")'

###########################################################
# Clean up intermediate files
###########################################################
clean:
	rm -f results/merged-data.csv
	rm -f results/descriptive-result.csv
	rm -f results/regression-result.csv
	rm -f results/figure/analysis-plot.png
	rm -f doc/bitcoin_report.md
	rm -f doc/bitcoin_report.html
