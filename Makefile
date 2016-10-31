.PHONY: data tests eda regressions report clean all

all: eda regressions report

data:
	curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

eda:
	Rscript code/scripts/eda-script.R

ols:
	#need a ols script

ridge: 
	Rscript code/script/ridge-script.R

lasso:
	Rscript code/scripts/lasso_regression.R 

pcr:
	Rscript code/scripts/pcr-script.R

plsr:
	Rscript code/scripts/plsr_regression.R

regressions:
	#make ols
	make ridge
	make lasso
	make pcr
	make plsr

report: report/00-abstract.Rmd report/01-introduction.Rmd report/02-data.Rmd report/03-methods.Rmd report/04-analysis.Rmd report/05-results.Rmd report/06-conclusions.Rmd
	cat report/00-abstract.Rmd report/01-introduction.Rmd report/02-data.Rmd report/03-methods.Rmd report/04-analysis.Rmd report/05-results.Rmd report/06-conclusions.Rmd > report/report.Rmd
	pandoc report/report.Rmd -s -o report/report.pdf 


slides:
	#need slides code

session:
	Rscript code/scripts/session-info-script.R

clean: 
	rm -f report/report.pdf


	

clean: 

