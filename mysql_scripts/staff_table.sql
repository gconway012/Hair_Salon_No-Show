#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"staff" table.																	 	 	  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create staff table
############################
CREATE TABLE IF NOT EXISTS staff
(
	staff_id					int 					AUTO_INCREMENT NOT NULL PRIMARY KEY,
    staff_name	  			char(10)			NOT NULL
) ENGINE=InnoDB;

############################
# Upload staff table data from file
############################
LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/supplemental_tbls/staff_member.csv'
INTO TABLE staff
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(staff_name);
