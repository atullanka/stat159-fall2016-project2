.PHONY: data tests eda regression report clean all

data:
	curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

all: eda regression report

session-info:
	Rscript code/scripts/session-info-script.R

eda:
	Rscript code/scripts/eda-script.R

regression:
	Rscript code/script/session-info.R
	Rscript code/scripts/lasso_regression.R 
	Rscript code/scripts/plsr_regression.R

report: 
	

clean: 

