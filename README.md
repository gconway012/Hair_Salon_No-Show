# Hair Salon No-show Analysis
#### Author: G. Conway 

***

## Project Status

![](https://img.shields.io/badge/Project--Status-50%25-yellow)

![GitHub last commit](https://img.shields.io/github/last-commit/gconway012/Hair_Salon_No-Show)

Current focus area(s):
* EDA, feature engineering, determine modeling goal(s) & method(s).
* Determine if I want to use R or Python for remaining analysis.

***

## Project Output Link(s)

![](https://img.shields.io/badge/Last%20Updated-Nov%2015%2C%202020-blue)

[Project Output](https://gconway012.github.io/Hair_Salon_No-Show/)

## Project Description

This project explores insights about hair salon appointments.

## Project Scenario:

* A small hair salon wants to understand its business and related data to better serve their clients.  
* Although they use a POS system, the owner/manager would like to look deeper than the receipts.
* The salon manager and select staff members indicated that they typically use Excel to generate reports and/or review data. However, they feel that using Excel is becoming obselete for their needs.
* As an exploratory step before developing a longer-term strategy for their data and analytics needs, the business would like to see an example(s) of:
    + A better data management tool/platform.
    + Another type of dashboarding and/or reporting tool/platform.
    + Insights to be gained from those dashboards/reports.
    + Different analysis techniques employed and what insights those methods can provide.

## Non-scenario Project Goals

* Use R/RStudio & MySQL, separately and as integrated tools, to perform analysis.
* Set up a database schema as a simulated business requirement, which includes:
    + Raw data exploration
    + Database table design and relationship identification
    + Raw data extraction and upload into MySQL
* Use flexdashboards in RStudio/RMarkdown as a workflow framework
* Develop dashboard page(s) 
* Use HTML tags and other packages to experiement with RMarkdown HTML output file and Markdown document design features
* Practice other modeling techniques

***

## Notes

* The output/website (link above) is best viewed with a large/maximized window. A larger monitor/screen (24" or larger) may be required.

***

## About this repository

### Files included

```
.
├── docs
│   └── index.html                  ## directory & file pending        
├── img_files
│   └── hair_salon_noshow_erd.jpg
├── mysql_scripts
│   ├── cancellations_table.sql
│   ├── clients_table.sql
│   ├── future_bookings_table.sql
│   ├── no_shows_table.sql
│   ├── product_listing_table.sql
│   ├── receipt_transactions_table.sql
│   ├── service_listing_table.sql
│   └── staff_table.sql
├── R_scripts
│   ├── cancellation_report.R
│   ├── client_queries.R
│   ├── data_extract.R
│   ├── data_file_names.R
│   ├── getTable.R
│   ├── no_show_report.R
│   ├── price_diff_report.R
│   ├── requirements.R
│   ├── sales_queries.R
│   ├── staff_queries.R
│   └── WalkIns_report.R
├── .gitignore
├── index.Rmd
└── README.md
```

### Files NOT included

```
.
└── data_files
```

\*Data files - Files may be downloaded from the Kaggle.com website (see link under Reference 1 below).

***

## Software Utilized

<details>
    <summary>Software list</summary>
        <li>Mac OSx Catalina version 10.15.7</li>
        <li>R (for Mac) version 4.0.2 (2020-06-22) "Taking Off Again"</li>
        <li>RStudio version 1.3.1073</li>
        <li>MySQL Community Server version 8.0.19</li>
        <li>MySQL Workbench version 8.0.19</li>
        <li>Microsoft VS Code version 1.50.1</li>
        <li>Microsoft Excel for Mac version 16.42</li>
</details>

## R Packages Utilized

<details>
    <summary>Package list</summary>
        <li>tidyverse version 1.3.0</li>
        <li>kableExtra version 1.2.1</li>
        <li>RMySQL version 0.10.20</li>
        <li>plotly version 4.9.2.1</li>
        <li>DT version 0.15</li>
</details>

## VS Code Extensions (helpful for this project)

<details>
    <summary>Extension list</summary>
        <li>Ascii Tree Generator version 1.2.4</li>
        <li>Bracket Pair Colorizer 2 version 0.2.0</li>
        <li>vscode-icons version 11.0.0</li>
</details>

***

## References

<details>
    <summary>Reference notes</summary>
        <li>References are, mostly, listed in the order that I used them.</li>
        <li>Website links are provided for those references I either had bookmarked previously or accessed during this project.</li>
        <li>I hope that some or all of these references are helpful when working on your own project.</li>
</details>


<details>
    <summary>Reference list</summary>
        <ol>
            <li>Hair Salon No-Show Dataset from Kaggle at https://www.kaggle.com/frederickferguson/hair-salon-no-show-data-set.</li>
            <li><i>Using flexdashboard</i>, https://rmarkdown.rstudio.com/flexdashboard/using.html.</li>
            <li><i>Create Awesome HTML Table with knitr::kable and kableExtra</i>, by Hao Zhu, https://haozhu233.github.io/kableExtra/awesome_table_in_html.html#getting_started.</li>
            <li><i>Deploying flexdashboard on GitHub Pages</i>, by Rami Krispin, dated Sep 4, 2020 at https://ramikrispin.github.io/2020/09/deploying-flexdashboard-on-github-pages/. Provided concise steps to follow to enable repository to host an .html file on GitHub Pages.</li>
            <li><i>RMarkdown directing output file into a directory</i>, NicE's answer, dated Mar 9, 2015 at https://stackoverflow.com/questions/28894515/rmarkdown-directing-output-file-into-a-directory. Provided necessary code used to knit document/file to a different directory.</li>
            <li><b><i>R for Data Science</i></b> by Hadley Wickham & Garrett Grolemund.</li>
            <li><i>Converting 'False'(string) to False(boolean) During LOAD DATA LOCAL INFILE</i>, Nawaz Sohail's answer, dated Oct 21, 2014 at https://dba.stackexchange.com/questions/80727/converting-falsestring-to-falseboolean-during-load-data-local-infile. Using IF() statement in MySQL to convert character string to boolean value during data upload.</li>
            <li><i>Importing a CSV to MySQL with different date format</i>, Devart's answer, dated Nov 17, 2011 at https://stackoverflow.com/questions/8163079/importing-a-csv-to-mysql-with-different-date-format. Using STR_TO_DATE() statement to convert character date to DATE data type in MySQL during data upload.</li>
            <li><i>MySQL - Multiple set on LOAD DATA INFILE</i>, ravnur's answer, dated Sep 21, 2012 at https://stackoverflow.com/questions/12530971/mysql-multiple-set-on-load-data-infile. Provided format for multiple SET() statements during data upload in MySQL.</li>
            <li><i>MySQL DATEDIFF() Function</i>, https://www.w3schools.com/Sql/func_mysql_datediff.asp. Using DATEDIFF() function as a better way to subtract two dates during data upload instead of using minus(-) in an equation.</li>
            <li><i>How to do time_to_minute in Mysql?</i>, Jon's answer, dated Oct 27, 2011 at https://stackoverflow.com/questions/7918923/how-to-do-time-to-minute-in-mysql. Using TIME_TO_SEC() function in MySQL to get the time in minutes.</li>
            <li><i>Adding new column after a specific column and defining a default in MySQL?</i>, https://www.tutorialspoint.com/adding-new-column-after-a-specific-column-and-defining-a-default-in-mysql. For adding columns to a table after a specific column.</li>
            <li><i>mysql update column with value from another table</i>, John Woo's answer, dated Jul 29, 2012 at https://stackoverflow.com/questions/11709043/mysql-update-column-with-value-from-another-table. For using joins to update a column in a table with values from another table.</li>
            <li><i>MySQL error code: 1175 during UPDATE in MySQL Workbench</i>, Rudy De Volder's answer, dated Feb 4, 2015 at https://stackoverflow.com/questions/11448068/mysql-error-code-1175-during-update-in-mysql-workbench. For using a WHERE in an UPDATE statement to avoid triggering the 1175 error when sql_safe_updates mode is enabled on MySQL 8.0 (default).</li>
            <li><i>MySQL Crash Course</i> by Ben Forta.</li>
            <li><i>mysql query not recognizing string</i>, spencer7593's answer, dated Mar 11, 2016 at https://stackoverflow.com/questions/35951305/mysql-query-not-recognizing-string. For using HEX() to determine if string values in column included carriage return character (i.e., \r) and to fix issue in `LINES TERMINATED BY` portion of `LOAD DATA LOCAL INFILE` statement.</li>
            <li><i>Securing Credentials</i>, https://db.rstudio.com/best-practices/managing-credentials/. Good info about using the keyring package to secure connection credentials.</li>
            <li>FontAwesome website, https://fontawesome.com/v4.7.0/icons/. For icon codes used in value boxes on dashboards.</li>
            <li>GitHub post - 256 COLORS - CHEAT SHEET, https://jonasjacek.github.io/colors/, by Jonas Jacek. Referenced for hexidecimal color codes used in value boxes on dashboards.</li>
            <li><i>Order discrete x scale by frequency/value</i>, Axeman and Yuriy Petrovskiy's answer, dated Jul 13, 2018 and Sep 11, 2018 at https://stackoverflow.com/questions/3253641/order-discrete-x-scale-by-frequency-value. For reordering DOW on barplot.</li>
            <li><i>Joining three tables using MySQL</i>, PHP Ferrari's answer, dated Sep 21, 2010 at https://stackoverflow.com/questions/3709560/joining-three-tables-using-mysql. For using normalize form structure for joining three tables in one query without having to use subqueries.</li>
            <li><i>Vignette: Downloadable tables in RMarkdown with the DT package</i>, https://www.r-bloggers.com/2019/12/vignette-downloadable-tables-in-rmarkdown-with-the-dt-package/. For creating filterable/searchable tables.</li>
            <li><i>Data Table Options</i>, https://rstudio.github.io/DT/options.html. For creating filterable/searchable tables.</li>
            <li><i>Column alignment in DT datatable</i>, zx8754 and G. Cocca's answer, dated Sep 17, 2020 and Mar 2, 2016 at https://stackoverflow.com/questions/35749389/column-alignment-in-dt-datatable. For centering columns when using DT::datatable() in R.</li>
            <li>https://shields.io. Used for badges.</li>
            <li><i>Is there a way to represent a directory tree in a Github README.md?</i>, joe sepi's answer, dated Aug 13, 2016. Use triple backticks to get ASCII tree to render properly in Markdown. 
        </ol>
</details>