#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"service_listing" table.													 	 	  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create service_listing table
############################
CREATE TABLE IF NOT EXISTS service_listing
(
	service_id				int 					AUTO_INCREMENT NOT NULL PRIMARY KEY,
    is_active					boolean			NOT NULL,
    service_code			char(10)			NOT NULL,
    service_desc			char(40)			NOT NULL,
    service_category		char(10)			NOT NULL,
    price						decimal(5,2)	NOT NULL,
    cost							decimal(5,2)	NOT NULL
) ENGINE=InnoDB;

############################
# Upload service listing table data from file
############################

LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/ServiceListing.csv'
INTO TABLE service_listing
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@is_active, service_code, service_desc, service_category, price, cost)
SET is_active = IF(@is_active = 'TRUE', 1, 0);

