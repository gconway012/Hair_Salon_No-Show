#####################################################
## 																								  ##
## 	This script relates to all matters pertaining to the 			      ##
##	"product_listing" table.	 											 		  ##
## 																								  ##
#####################################################

############################
# Select database
############################
USE hair_salon_noshow;

############################
# Create product_listing table 
############################

CREATE TABLE product_listing
(
	prod_id			int					AUTO_INCREMENT NOT NULL PRIMARY KEY,
    is_active			boolean			NOT NULL,
    prod_code	char(20)			NOT NULL,
    prod_desc	char(40)			NOT NULL,
    prod_supplier	char(10)			NOT NULL,
    prod_brand		char(10)			NOT NULL,
    prod_category	char(10)			NOT NULL,
    prod_price		decimal(6,2)	NOT NULL,	
    num_on_hand	int					NOT NULL,
    minimum			int					NOT NULL,
    maximum		int					NOT NULL,
    cost					decimal(6,2) 	NOT NULL,
    cog					decimal(6,2) 	NOT NULL,
    ytd					decimal(8,2)	NOT NULL,
    package			boolean			NOT NULL
) ENGINE=InnoDB;

###########################
# Upload product_listing data 
###########################

LOAD DATA LOCAL INFILE '/usr/local/mysql-8.0.19-macos10.15-x86_64/mylocaldata/ProductListing_Retail.csv'
INTO TABLE product_listing
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@is_active, prod_code, prod_desc, prod_supplier, prod_brand, prod_category, prod_price, num_on_hand, minimum, maximum, cost, @cog, ytd, @package)
SET
	is_active = IF(@is_active = 'TRUE', 1, 0),
    cog = num_on_hand * cost, 
    package = IF(@package = 'TRUE', 1, 0);
    
