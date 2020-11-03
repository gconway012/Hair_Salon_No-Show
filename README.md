# Hair Salon No-show Analysis
#### Author: G. Conway 

***

## Project Description

This project explores insights about no-show appointments at a hair salon.

## Other Project Goals

* Use R/RStudio & MySQL, separately and as integrated tools, to perform analysis.
* Set up a database schema as a simulated business requirement, which includes:
    + Raw data exploration
    + Database table design and relationship identification
    + Raw data extraction and upload into MySQL
* Use flexdashboards in RStudio/RMarkdown as a workflow framework.
* Develop dashboard page(s) 
* Practice other modeling techniques

***

## Important Notes

***

## About this repository

### Files included



### Files NOT included

* Data files
    + Data files may be downloaded from the Kaggle.com website (see link under Reference 1 below).

***

## Software Utilized

* Mac OSx Catalina version 10.15.7
* R (for Mac) version 4.0.2 (2020-06-22) "Taking Off Again"
* RStudio version 1.3.1073
* MySQL Community Server version 8.0.19
* MySQL Workbench version 8.0.19
* Microsoft VS Code version 1.50.1
* Microsoft Excel for Mac version 16.42

## R Packages Utilized

***

## References

1. Hair Salon No-Show Dataset from Kaggle at https://www.kaggle.com/frederickferguson/hair-salon-no-show-data-set)

2. *Using flexdashboard*, https://rmarkdown.rstudio.com/flexdashboard/using.html.

3. *Create Awesome HTML Table with knitr::kable and kableExtra*, by Hao Zhu, https://haozhu233.github.io/kableExtra/awesome_table_in_html.html#getting_started.

4. *Deploying flexdashboard on GitHub Pages*, by Rami Krispin, dated Sep 4, 2020 at https://ramikrispin.github.io/2020/09/deploying-flexdashboard-on-github-pages/. Provided concise steps to follow to enable repository to host an .html file on GitHub Pages.

5. *RMarkdown directing output file into a directory*, NicE's answer, dated Mar 9, 2015 at https://stackoverflow.com/questions/28894515/rmarkdown-directing-output-file-into-a-directory. Provided necessary code used to knit document/file to a different directory.

6. *R for Data Science* by Hadley Wickham & Garrett Grolemund.

7. *Converting 'False'(string) to False(boolean) During LOAD DATA LOCAL INFILE*, Nawaz Sohail's answer, dated Oct 21, 2014 at https://dba.stackexchange.com/questions/80727/converting-falsestring-to-falseboolean-during-load-data-local-infile. Using IF() statement in MySQL to convert character string to boolean value during data upload.

8. *Importing a CSV to MySQL with different date format*, Devart's answer, dated Nov 17, 2011 at https://stackoverflow.com/questions/8163079/importing-a-csv-to-mysql-with-different-date-format. Using STR_TO_DATE() statement to convert character date to DATE data type in MySQL during data upload.

9. *MySQL - Multiple set on LOAD DATA INFILE*, ravnur's answer, dated Sep 21, 2012 at https://stackoverflow.com/questions/12530971/mysql-multiple-set-on-load-data-infile. Provided format for multiple SET() statements during data upload in MySQL.

10. *MySQL DATEDIFF() Function*, https://www.w3schools.com/Sql/func_mysql_datediff.asp. Using DATEDIFF() function as a better way to subtract two dates during data upload instead of using minus(-) in an equation.

11. *How to do time_to_minute in Mysql?*, Jon's answer, dated Oct 27, 2011 at https://stackoverflow.com/questions/7918923/how-to-do-time-to-minute-in-mysql. Using TIME_TO_SEC() function in MySQL to get the time in minutes.

12. *Adding new column after a specific column and defining a default in MySQL?*, https://www.tutorialspoint.com/adding-new-column-after-a-specific-column-and-defining-a-default-in-mysql. For adding columns to a table after a specific column.

13. *mysql update column with value from another table*, John Woo's answer, dated Jul 29, 2012 at https://stackoverflow.com/questions/11709043/mysql-update-column-with-value-from-another-table. For using joins to update a column in a table with values from another table.

14. *MySQL error code: 1175 during UPDATE in MySQL Workbench*, Rudy De Volder's answer, dated Feb 4, 2015 at https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench. For using a WHERE in an UPDATE statement to avoid triggering the 1175 error when sql_safe_updates mode is enabled on MySQL 8.0 (default).

15. *MySQL Crash Course* by Ben Forta.

16. 