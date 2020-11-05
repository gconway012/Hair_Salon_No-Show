#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"future_bookings" table.														  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create future_bookings table 
############################

CREATE TABLE future_bookings
(
	future_booking_id		int		AUTO_INCREMENT NOT NULL PRIMARY KEY,
    client_code					char(6)		NOT NULL,
    servicing_staff				char(6)		NOT NULL,
    service_code				char(9)		NOT NULL,
    booking_date				date				NOT NULL,
    booking_time				time				NOT NULL,
    time_minutes				int				NOT NULL
) ENGINE=InnoDB;

###########################
# Upload future_bookings data 
###########################

LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/FutureBookings_AllClients.csv'
INTO TABLE future_bookings
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(client_code, servicing_staff, service_code, @booking_date, @booking_time, @time_minutes)
SET
	booking_date = STR_TO_DATE(@booking_date, '%m/%d/%Y'),
    booking_time = STR_TO_DATE(@booking_time, '%r'),
    time_minutes = TIME_TO_SEC(booking_time) / 60;
    
############################
# Add columns: client_id, servicing_staff_id, service_id
############################

ALTER TABLE future_bookings
ADD client_id INT AFTER client_code,
ADD servicing_staff_id INT AFTER servicing_staff,
ADD service_id INT AFTER service_code;

############################
# Insert values for client_id
############################

UPDATE future_bookings fb 
INNER JOIN clients c ON fb.client_code = c.client_code
SET fb.client_id = c.client_id
WHERE fb.future_booking_id != 0;

############################
# Insert values for service_id
############################

UPDATE future_bookings fb 
INNER JOIN service_listing sl ON fb.service_code = sl.service_code
SET fb.service_id = sl.service_id
WHERE fb.future_booking_id != 0;

############################
# Insert values for staff_id
############################

UPDATE future_bookings fb
INNER JOIN staff st ON fb.servicing_staff = st.staff_name
SET fb.servicing_staff_id = st.staff_id
WHERE future_booking_id != 0;

############################
# Drop client_code, service_code, and servicing_staff columns
############################

ALTER TABLE future_bookings
DROP COLUMN client_code, 
DROP COLUMN service_code, 
DROP COLUMN servicing_staff;

############################
# Set foreign keys
############################

ALTER TABLE future_bookings
ADD FOREIGN KEY (client_id) REFERENCES clients (client_id),
ADD FOREIGN KEY (service_id) REFERENCES service_listing (service_id),
ADD FOREIGN KEY (servicing_staff_id) REFERENCES staff (staff_id);