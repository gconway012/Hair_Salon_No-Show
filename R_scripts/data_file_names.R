# get full file paths for data files

    # folder path
    assign("datafolder", "/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/")
    
    # file names
    assign("datafilenames", 
           dir("/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/",
                         pattern = ".csv"))
    
    # full file paths
    assign("datafilepaths", paste(datafolder, datafilenames, sep = ""))