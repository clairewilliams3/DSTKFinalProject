#	REPORT-ASSOCIATED RULES (run within Docker container)
final_report.html: final_report.Rmd code/02_render_report.R output/spagplot.png
	Rscript code/02_render_report.R

# creates output/spagplot.png
output/spagplot.png: code/01_creating_plots.R
	Rscript code/01_creating_plots.R

.PHONY: clean install
clean:
	rm -f final_report.html && rm -f output/*.png
	
install:
  Rscript -e "renv::restore(prompt=FALSE)"

#DOCKER-ASSOCIATED RULES (run on our local machine)
PROJECTFILES = final_report.Rmd code/01_creating_plots.R code/02_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

#rule to build image
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t clairewilliams3/project_image .
	touch $@

#rule to build report automatically in our container
run_report:
	mkdir -p report
	docker run -v "/$(shell pwd)/report:/home/rstudio/project/final_report" clairewilliams3/project_image