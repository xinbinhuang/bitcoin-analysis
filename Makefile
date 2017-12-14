# Driver script
# Dec 12, 2017
# what it does
#
# usage: make all

# run from top to bottom
all: doc/bitcoin_report.md

# download the data
data/bitcoin_dataset.csv:	src/download-data.R
			Rscript src/download-data.R https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_dataset.csv data/bitcoin_dataset.csv

data/bitcoin_price.csv:	src/download-data.R
			Rscript src/download-data.R https://raw.githubusercontent.com/xinbinhuang/data-bitcoin/master/bitcoin_price.csv data/bitcoin_price.csv

# merge data for analysis
results/merged-data.csv: data/bitcoin_price.csv data/bitcoin_dataset.csv src/merge-data.R
			Rscript src/merge-data.R data/bitcoin_price.csv data/bitcoin_dataset.csv results/merged-data.csv

# perform descriptive analysis
results/descriptive-result.csv: results/merged-data.csv src/descriptive.R
			Rscript src/descriptive.R results/merged-data.csv results/descriptive-result.csv

# perform regression analysis
results/regression-result.csv: results/merged-data.csv src/regression.R
			Rscript src/regression.R results/merged-data.csv results/regression-result.csv

# generate pair-plot for the data
results/figure/analysis-plot.png: results/merged-data.csv src/plot.R
			Rscript src/plot.R results/merged-data.csv results/figure/analysis-plot.png

# generate the report from R markdown
doc/bitcoin_report.md: src/bitcoin_report.Rmd results/descriptive-result.csv results/regression-result.csv results/figure/analysis-plot.png results/regression-result.csv
			Rscript -e 'ezknitr::ezknit("src/bitcoin_report.Rmd", out_dir = "doc")'

# clean up intermediate files
clean:
	rm -f results/merged-data.csv
	rm -f results/descriptive-result.csv
	rm -f results/regression-result.csv
	rm -f results/figure/analysis-plot.png
	rm -f doc/bitcoin_report.md
	rm -f doc/bitcoin_report.html
