# Hair Salon No-show Analysis
#### Author: G. Conway 

***

## Project Status

![](https://img.shields.io/badge/Project--Status-45%25-yellow)
           

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

* Database connection credentials
    + Database connection credentials sourced through a separate .R script.
    + Connection to database done using the following code structure:
        + `conn <- dbConnect(MySQL(),
                  username = keyring::key_list("dbkeyringname")[1,2],
                  password = keyring::key_get("dbkeyringname", "dbusername"),
                  host = "localhost",
                  port = 3306,
                  dbname = "dbname")`

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

REFERENCE NOTES:
* References are, mostly, listed in the order that I used them.
* Website links are provided for those references I either had bookmarked previously or accessed during this project.
* I hope that some or all of these references are helpful when working on your own project.

<br>

1. Hair Salon No-Show Dataset from Kaggle at https://www.kaggle.com/frederickferguson/hair-salon-no-show-data-set.

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

16. *mysql query not recognizing string*, spencer7593's answer, dated Mar 11, 2016 at https://stackoverflow.com/questions/35951305/mysql-query-not-recognizing-string. For using HEX() to determine if string values in column included carriage return character (i.e., \r) and to fix issue in `LINES TERMINATED BY` portion of `LOAD DATA LOCAL INFILE` statement.

17. *Securing Credentials*, https://db.rstudio.com/best-practices/managing-credentials/. Good info about using the keyring package to secure connection credentials.

18. FontAwesome website, https://fontawesome.com/v4.7.0/icons/. For icon codes used in value boxes on dashboards.

19. GitHub post - 256 COLORS - CHEAT SHEET, https://jonasjacek.github.io/colors/, by Jonas Jacek. Referenced for hexidecimal color codes used in value boxes on dashboards.

20. *Order discrete x scale by frequency/value*, Axeman and Yuriy Petrovskiy's answer, dated Jul 13, 2018 and Sep 11, 2018 at https://stackoverflow.com/questions/3253641/order-discrete-x-scale-by-frequency-value. For reordering DOW on barplot.

21. *Joining three tables using MySQL*, PHP Ferrari's answer, dated Sep 21, 2010 at https://stackoverflow.com/questions/3709560/joining-three-tables-using-mysql. For using normalize form structure for joining three tables in one query without having to use subqueries.

22. *Vignette: Downloadable tables in RMarkdown with the DT package*, https://www.r-bloggers.com/2019/12/vignette-downloadable-tables-in-rmarkdown-with-the-dt-package/. For creating filterable/searchable tables.

23. *Data Table Options*, https://rstudio.github.io/DT/options.html. For creating filterable/searchable tables.

24. *Column alignment in DT datatable*, zx8754 and G. Cocca's answer, dated Sep 17, 2020 and Mar 2, 2016 at https://stackoverflow.com/questions/35749389/column-alignment-in-dt-datatable. For centering columns when using DT::datatable() in R.

25. https://shields.io. Used for badges.