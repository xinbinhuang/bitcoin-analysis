# Docker file for bitcoin-analysis
# Xinbin Huang, Dec, 2017

# usage: docker run -it --rm -v YOUR_LOCAL_DIRECTORY_OF_CLONED_REPO/:/home/etf_correlations raffrica/etf_docker  /bin/bash

# use rocker/hadleyverse as the base image and
FROM rocker/hadleyverse

# Install the required packages
RUN Rscript -e "install.packages('ezknitr', repos = 'http://cran.us.r-project.org')"

RUN Rscript -e "install.packages('broom', repos = 'http://cran.us.r-project.org')"

RUN Rscript -e "install.packages('GGally', repos = 'http://cran.us.r-project.org')"

RUN Rscript -e "install.packages('lubridate', repos = 'http://cran.us.r-project.org')"

RUN Rscript -e "install.packages('packrat', repos = 'http://cran.us.r-project.org')"
