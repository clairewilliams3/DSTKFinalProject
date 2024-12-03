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

  - contains rules for building the report
  - contains rule for synchronizing package repository, run `make install` to do so
  
## To create the report

Run `make final_report.html` in the terminal to build the report
  