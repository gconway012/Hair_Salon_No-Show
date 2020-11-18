## load required packages ####

# source load_pkgs.R script
source("R_scripts/load_pkgs.R")

# tidyverse package - for data read & manipulation
load_pkgs("tidyverse")
            
# kableExtra package - create html tables from dataframes
load_pkgs("kableExtra")

# RMySQL package - connecting to & query MySQL database
load_pkgs("RMySQL")

# plotly package - for making ggplots interactive
load_pkgs("plotly")

## DT package - for making filterable/searchable HTML tables
load_pkgs("DT")

# clear function
rm(load_pkgs)