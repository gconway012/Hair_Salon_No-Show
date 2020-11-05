#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"no_show_report" table.	 															  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create no_show_report table 
############################

CREATE TABLE no_show_report
(
	report_id		int						AUTO_INCREMENT NOT NULL PRIMARY KEY,
    booking_date	date  					NOT NULL,
    client_code		char(10)				NOT NULL,
    service_code	char(10)				NOT NULL,
    staff_name 		char(10)				NOT NULL
) ENGINE=InnoDB;

###########################
# Upload no_show_report data 
###########################

LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/No_ShowReport.csv'
INTO TABLE no_show_report
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@booking_date, client_code, service_code, staff_name)
SET booking_date = STR_TO_DATE(@booking_date, '%m/%d/%Y');

############################
# Add columns: client_id, service_id, staff_id
############################

ALTER TABLE no_show_report
ADD client_id INT AFTER client_code,
ADD service_id INT AFTER service_code,
ADD staff_id INT AFTER staff_name;

############################
# Insert values for client_id
############################

UPDATE no_show_report ns 
INNER JOIN clients cl ON ns.client_code = cl.client_code
SET ns.client_id = cl.client_id
WHERE ns.report_id != 0;

############################
# Insert values for service_id
############################

UPDATE no_show_report ns 
INNER JOIN service_listing sl ON ns.service_code = sl.service_code
SET ns.service_id = sl.service_id
WHERE ns.report_id != 0;

############################
# Insert values for staff_id 
############################

UPDATE no_show_report n
INNER JOIN staff s ON n.staff_name = s.staff_name
SET n.staff_id = s.staff_id
WHERE n.report_id != 0;
 
############################
# Drop client_code, service_code, and staff_name columns
############################

ALTER TABLE no_show_report
DROP COLUMN client_code, 
DROP COLUMN service_code, 
DROP COLUMN staff_name;

############################
# Set foreign keys
############################

ALTER TABLE no_show_report
ADD FOREIGN KEY (client_id) REFERENCES clients (client_id),
ADD FOREIGN KEY (service_id) REFERENCES service_listing (service_id),
ADD FOREIGN KEY (staff_id) REFERENCES staff (staff_id);