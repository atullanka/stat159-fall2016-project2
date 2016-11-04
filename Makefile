.PHONY: data eda regressions report shiny clean all 

all: eda data regressions report slides session-info 

data:
	curl -o data/Credit.csv http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

eda:
	Rscript code/scripts/eda-script.R

ols:
	Rscript code/scripts/ols_regression.R

ridge: 
	Rscript code/scripts/ridge-script.R

lasso:
	Rscript code/scripts/lasso_regression.R 

pcr:
	Rscript code/scripts/pcr-script.R

plsr:
	Rscript code/scripts/plsr_regression.R

session-info:
	bash session-info.sh 
	Rscript code/scripts/session.info.R

regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

report: report/sections/*.Rmd
	cat report/sections/*.Rmd > report/report.Rmd
	Rscript -e 'library(rmarkdown); render("report/report.Rmd")'


slides:
	#need slides code

shiny:
	R -e "shiny::runApp('shiny/app.R')"

clean: 
	rm -f report/report.pdf

