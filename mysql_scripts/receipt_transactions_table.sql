#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"receipt_transactions" table.	 											  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create receipt_transactions table 
############################

CREATE TABLE receipt_transactions
(
	trans_id						int							AUTO_INCREMENT NOT NULL PRIMARY KEY,
    receipt_num				int							NOT NULL,
    trans_date					date 						NOT NULL,
    description				 	char(40)					NOT NULL,
    client_code					char(10)					NOT NULL,
    servicing_staff				char(10)					NOT NULL,
    quantity						int							NOT NULL,
    amount						decimal(8,2)			NOT NULL,
    gst								decimal(8,4)			NOT NULL,
    pst 								decimal(8,4)			NOT NULL
) ENGINE=InnoDB;

###########################
# Upload receipt_transactions data 
###########################

LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/ReceiptTransactions.csv'
INTO TABLE receipt_transactions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(receipt_num, @trans_date, description, client_code, servicing_staff, quantity, amount, @gst, @pst)
SET
	trans_date = STR_TO_DATE(@trans_date, '%m/%d/%Y'),
    gst = amount * 0.05,
    pst = amount * 0.08;
    
############################
# Add columns: client_id, servicing_staff_id
############################

ALTER TABLE receipt_transactions
ADD client_id INT AFTER client_code,
ADD servicing_staff_id INT AFTER servicing_staff;

############################
# Insert values for client_id
############################

UPDATE receipt_transactions rt 
INNER JOIN clients cl ON rt.client_code = cl.client_code
SET rt.client_id = cl.client_id
WHERE rt.trans_id != 0;

############################
# Insert values for staff_id
############################

UPDATE receipt_transactions rt
INNER JOIN staff st ON rt.servicing_staff = st.staff_name
SET rt.servicing_staff_id = st.staff_id
WHERE rt.trans_id != 0;

############################
# Drop client_code, servicing_staff columns
############################

ALTER TABLE receipt_transactions
DROP COLUMN client_code,
DROP COLUMN servicing_staff;

############################
# Set foreign keys
############################

ALTER TABLE receipt_transactions
ADD FOREIGN KEY (client_id) REFERENCES clients (client_id),
ADD FOREIGN KEY (servicing_staff_id) REFERENCES staff (staff_id);