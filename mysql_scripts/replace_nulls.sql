#####################################################
## 																								  ##
## 	This script relates to data wrangling to change/alter  		 	  ##
##  	NULL values in select tables to make table joins more		  ##
## 	clear and ensure data is joined/captured appropriately		  ##
## 	for model building, etc.														  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;


############################
# Table --> clients
# Add new client --> "UNKNOWN" 
############################
INSERT INTO clients (client_code)
VALUES ('UNKNOWN');


############################
# Table --> future_bookings
# Replace client_id = NULL with client_id = 823 
# Where --> future_booking_id = 163
############################
UPDATE future_bookings
SET client_id = 823
WHERE future_booking_id = 163;


############################
# Table --> no_show_report
# Replace client_id = NULL with client_id = 823 
# Where --> report_id = 1
############################
UPDATE no_show_report
SET client_id = 823
WHERE report_id = 1;


############################
# Table --> product_listing
# Replace prod_supplier = '[blank]' with prod_supplier = 'UNKNOWN' 
# Replace prod_brand = '[blank]' with prod_brand = 'ELCHIM'
# Where --> prod_id = 9
############################
UPDATE product_listing
SET prod_supplier = 'UNKNOWN',
		prod_brand = 'ELCHIM'
where prod_id = 9;


############################
# Table --> product_listing
# Replace prod_supplier = '[blank]' with prod_supplier = 'UNKNOWN' 
# Replace prod_brand = '[blank]' with prod_brand = 'ELCHIM'
# Replace prod_category = '[blank]' with prod_category = 'RETAIL'
# Where --> prod_id = 10
############################
UPDATE product_listing
SET prod_supplier = 'UNKNOWN',
		prod_brand = 'ELCHIM',
        prod_category = 'RETAIL'
where prod_id = 10;

