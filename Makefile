.PHONY: data eda regressions report clean all

all: eda regressions report

data:
	curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

eda:
	Rscript code/scripts/eda-script.R

ols:
	Rscript code/scripts/ols_regression.R

ridge: 
	Rscript code/script/ridge-script.R

lasso:
	Rscript code/scripts/lasso_regression.R 

pcr:
	Rscript code/scripts/pcr-script.R

plsr:
	Rscript code/scripts/plsr_regression.R

session-info:
	Rscript code/scripts/session.info.R

regressions:
	make ols
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

