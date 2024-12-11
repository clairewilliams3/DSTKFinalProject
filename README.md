# Final Project

> Claire Williams

------------------------------------------------------------------------

## Code Description

`code/01_data_summary.R`

  - loads in the data
  - creates a spaghetti plot for hr.mean
  - saves plot as a `.png` object in `output/` folder
  
`code/02_render_report.R`

  - renders `midterm_report.Rmd`

`final_report.Rmd`

  - introduces the data
  - makes the spaghetti plot

`Makefile`

  - contains rule for building the report
  - contains rule for synchronizing package repository, run `make install` to do so
  - contains rule for building the project image run `make project_image` to do so
  - contains rule for building the report automatically in our container
  
## To build the image
  
  - docker image publically available through dockerhub: clairewilliams3/project_image
  - can use docker pull, docker build, or docker run based on this image to download the image from dockerhub
  - could also run `make project_image`
  
## To create the report

  - run `make run_report` in the terminal to automatically build the report in our container
  - `final_report.html` will then appear in the `report/` folder
  
## NOTE

  - This was built on a Windows system
  
  
  