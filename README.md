##Comparing Regression Models

Overview: This project looks at the difference and the optimality of the ridge, lasso, principal component, and partial least square regression models on the data set **Credit.csv**. This data set can be downloded ( [here](http://www-bcf.usc.edu/~gareth/ISL/Credit.csv) ), which is from [*An Introduction to Statistical Learning*](http://www-bcf.usc.edu/~gareth/ISL/data.html) book by Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani. We learned about learn about the relationship between `Balance` and the rest of the quantitative and qualitative variables and using cross-validation, the most ideal model is evaluated from their respective Minimum Square Errors on the test sets.


**Folders:**

* code: This folder contains our Rscripts for the various regression models as well as session info, exploratory data script and a script for creating our training and testing data.

* data: This folder contains our main and scaled data set. It also includes the Rdata and text files created by our various methods.

* images: This folder contains our 

* report: This folder contains the sections of the paper, a concatenated paper RMD and a final PDF version of our report 

* slides: This folder contains the slides for a 10-15 minute presentation of our report.

* shiny: This folder contains app.R which runs a shiny app on our various different regression models.

**Other objects:**

* .gitignore: We include files and file extensions we want Git to ignore. For this project we included files such as 

* LICENSE: Contains a license by the Apache License, Version 2.0

* Makefile: Run make commands to create the regression models, relevant images, Rdata files and text files. We can also produce slides, a report, and a shiny app.


**How to reproduce our project**:

1. First clone our project. Open your terminal and type `git clone https://github.com/atullanka/stat159-fall2016-project2.git`

2. Remove our most recent report which is inlcuded in repo. To do this type `make clean`

3. Next, run the various scripts in order to have the most up to date data: NOT SURE THE ORDER OF COMMANDS

4. Now you can generate the report! Type the command `make report`

5. And now you can run `make slides` and generate the slides.

6. Finally if you want an interactive view of the different regression models you can run `make shiny`

	a. A command similar to `Listening on http://127.0.0.1:6800` should show up.

	b. Copy the URL into a browser.

	c. After you are done using the Slidy App type "ctrl +c" on terminal to exit R


**Authors: Rushil Sheth and Atul Lanka**

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

