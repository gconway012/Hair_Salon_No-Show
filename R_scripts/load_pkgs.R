#### function to load required packages ####
load_pkgs <- function(pkg_name){
    if (!require(pkg_name, character.only = T)){
        install.packages(pkg_name, 
                         repos = "https://cran.rstudio.com/",
                         quiet = T)
        require(pkg_name, character.only = T)
    }
}


