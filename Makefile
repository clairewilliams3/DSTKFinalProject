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