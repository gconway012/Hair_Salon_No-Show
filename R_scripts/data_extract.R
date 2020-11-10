#### about ####################################################################

# This script extracts the unique client, staff, and service codes and writes
#   them to separate .csv files.
# The info extracted will be used when creating new tables in MySQL database

#### load packages ############################################################

# check if package is installed and then load package for use
if (!require("tidyverse")){
    install.packages("tidyverse", 
                     repos = "https://cran.rstudio.com/",
                     quiet = T)
    require("tidyverse")
}

#### check variables ##########################################################

# check that necessary variables/paths exist
if (!exists("datafolder")) {
    datafolder <- "/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/"
}

if (!exists("datafilenames")) {
    datafilenames <- dir("/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/", pattern = "csv")
}

if (!exists("datafilepaths")) {
    datafilepaths <- paste(datafolder, datafilenames, sep = "")
} 

#### source getTable() function ###############################################

# source getTable() script
source("misc_R_scripts/getTable.R")

#### get unique values ########################################################

cc <- getTable("Client_Cancellations")
cc_client_code <- cc$Code
cc_staff <- cc$Staff
cc_canceledby <- cc$`Canceled By`
rm(cc)

fb <- getTable("Future_Bookings")
fb_client_code <- fb$Code
fb_staff <- fb$Staff
rm(fb)

ns <- getTable("No_Show")
ns_client_code <- ns$Code
ns_staff <- ns$Staff
rm(ns)

rt <- getTable("Receipt_Trans")
rt_client_code <- rt$Client
rt_staff <- rt$Staff
rm(rt)



client_code <- unique(
    c(cc_client_code, fb_client_code, ns_client_code, rt_client_code)
)

client_code <- as.data.frame(client_code[!is.na(client_code)], 
                             stringsAsFactors = F)

names(client_code) <- c("client_code")

rm(cc_client_code, fb_client_code, ns_client_code, rt_client_code)



staff_member <- unique(
    c(cc_staff, cc_canceledby, fb_staff, ns_staff, rt_staff)
    )

staff_member <- as.data.frame(staff_member, stringsAsFactors = F)

rm(cc_staff, cc_canceledby, fb_staff, ns_staff, rt_staff)


#### write extracted data to files ############################################

write_csv(client_code, 
          path = "/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/client_code.csv")

write_csv(staff_member,
          path = "/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/staff_member.csv")


#### clean memory #############################################################

rm(client_code, staff_member, getTable)
