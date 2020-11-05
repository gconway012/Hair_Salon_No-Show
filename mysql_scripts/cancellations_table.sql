#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"cancellations" table.															  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create cancellations table
############################
CREATE TABLE IF NOT EXISTS cancellations
(
cancellation_id						INT							AUTO_INCREMENT NOT NULL PRIMARY KEY,
cancel_date								DATE						NOT NULL,
client_code								CHAR(10)				NOT NULL,
service_code							CHAR(10)				NOT NULL,
staff_name								CHAR(10)				NOT NULL,
booking_date							DATE						NOT NULL,
canceled_by							CHAR(10)				NOT NULL,
days										INT							NOT NULL
) ENGINE=InnoDB;

############################
# Upload cancellations table data from file
############################

LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/ClientCancellations.csv'
INTO TABLE cancellations
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(@cancel_date, client_code, service_code, staff_name, @booking_date, canceled_by, @days)
SET cancel_date = STR_TO_DATE(@cancel_date, '%m/%d/%Y'),
		booking_date = STR_TO_DATE(@booking_date, '%m/%d/%Y'),
		days = DATEDIFF(booking_date, cancel_date);
        
############################
# Add columns: client_id, service_id, staff_id
############################

ALTER TABLE cancellations
ADD client_id INT AFTER client_code,
ADD service_id INT AFTER service_code,
ADD staff_id INT AFTER staff_name;

############################
# Insert values for client_id
############################

UPDATE cancellations c1
INNER JOIN clients c2 ON c1.client_code = c2.client_code
SET c1.client_id = c2.client_id
WHERE c1.cancellation_id != 0;

############################
# Insert values for service_id
############################

UPDATE cancellations c
INNER JOIN service_listing s ON c.service_code = s.service_code
SET c.service_id = s.service_id
WHERE c.cancellation_id != 0;

############################
# Insert values for staff_id
############################

UPDATE cancellations c
INNER JOIN staff s ON c.staff_name = s.staff_name
SET c.staff_id = s.staff_id
WHERE c.cancellation_id != 0;

############################
# Drop client_code, service_code, and staff_name columns
############################

ALTER TABLE cancellations
DROP COLUMN client_code, 
DROP COLUMN service_code, 
DROP COLUMN staff_name;

############################
# Add cancel_id column
############################

ALTER TABLE cancellations
ADD canceled_by_id INT AFTER canceled_by;

############################
# Insert values for canceled_by_id
############################

UPDATE cancellations c
INNER JOIN staff s ON c.canceled_by = s.staff_name
SET c.canceled_by_id = s.staff_id
WHERE c.cancellation_id != 0;

############################
# Drop canceled_by column
############################

ALTER TABLE cancellations
DROP COLUMN canceled_by;

############################
# Set foreign keys
############################

ALTER TABLE cancellations
ADD FOREIGN KEY (client_id) REFERENCES clients (client_id),
ADD FOREIGN KEY (service_id) REFERENCES service_listing (service_id),
ADD FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
ADD FOREIGN KEY (canceled_by_id) REFERENCES staff (staff_id);