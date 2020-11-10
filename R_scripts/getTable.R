# A function to selectively retrieve/load table data without having to retype 
#   the code for read_csv each time.

# The function will allow you to only read/load data that is needed without 
#   having to load all data tables at once and unnecessarily use memory
#   space.


# When using the getTable() function in the console you must use the following
#   form if you want to save the data to a variable
#
#   EX) var_name <- getTable("table_name")



# check if tidyverse package is installed and then load it for use
if (!require("tidyverse")){
    install.packages("tidyverse",
                     repos = "https://cran.rstudio.com/",
                     quiet = TRUE)
    require("tidyverse")
}



## read in data tables from .csv files (as needed)
getTable <- function (table){
    
    switch (table,
        Client_Cancellations = {read_csv(datafilepaths[1],
                          col_names = TRUE)},
        
        Future_Bookings = {read_csv(datafilepaths[2],
                               col_names = TRUE)},
        
        No_Show = {read_csv(datafilepaths[3],
                                       col_names = TRUE)},
        
        Prod_List = {read_csv(datafilepaths[4],
                           col_names = TRUE)},
        
        Receipt_Trans = {read_csv(datafilepaths[5],
                           col_names = TRUE)},
        
        Service_Listing = {read_csv(datafilepaths[6],
                            col_names = TRUE)},
    )
}
