all: docs

focal-deps:
	R -e 'install.packages("rmarkdown", repos = "https://packagemanager.rstudio.com/cran/__linux__/focal/latest")'

docs: cran-usage.Rmd
	R -e 'rmarkdown::render("cran-usage.Rmd", output_file="cran-usage.html", output_dir="docs")'
  Rscript dir-control.R

.PHONY: docs focal-deps
