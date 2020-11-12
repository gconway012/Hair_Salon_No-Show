## load required packages ####

# tidyverse package - for data read & manipulation
tidyverse = if (!require("tidyverse")){
    install.packages("tidyverse", 
                     repos = "https://cran.rstudio.com/",
                     quiet = T)
    require("tidyverse")
}
            
# kableExtra package - create html tables from dataframes
kableExtra = if (!require("kableExtra")){
    install.packages("kableExtra", 
                     repos = "https://cran.rstudio.com/",
                     quiet = T)
    require("kableExtra")
}

# RMySQL package - connecting to & query MySQL database
RMySQL = if (!require("RMySQL")){
    install.packages("RMySQL", 
                     repos = "https://cran.rstudio.com/",
                     quiet = T)
    require("RMySQL")
}

# plotly package - for making ggplots interactive
plotly = if (!require("plotly")){
    install.packages("plotly", 
                     repos = "https://cran.rstudio.com/",
                     quiet = T)
    require("plotly")
}