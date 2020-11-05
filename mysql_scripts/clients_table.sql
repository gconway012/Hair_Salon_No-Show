#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"clients" table.																	 	  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create clients table
############################
CREATE TABLE IF NOT EXISTS clients
(
	client_id					int 					AUTO_INCREMENT NOT NULL PRIMARY KEY,
    client_code	  			char(10)			NOT NULL
) ENGINE=InnoDB;

############################
# Upload clients table data from file
############################
LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/supplemental_tbls/client_code.csv'
INTO TABLE clients
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(client_code);

select * 
from clients;