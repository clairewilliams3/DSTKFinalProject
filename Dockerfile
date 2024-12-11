FROM rocker/rstudio

RUN apt-get update && apt-get install -y pandoc

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache

COPY Makefile .
COPY final_report.Rmd .
RUN mkdir code
RUN mkdir data
RUN mkdir output
COPY code/01_creating_plots.R code/01_creating_plots.R
COPY code/02_render_report.R code/02_render_report.R
COPY data/duplicated_data.csv data/duplicated_data.csv

RUN Rscript -e "renv::restore(prompt=FALSE)"

CMD ["make"]