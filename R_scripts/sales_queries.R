## query database for required data ####
sales_query <- function (query){
    
    switch (query,
            
            # show table
            date_range_receipts = dbGetQuery(conn,
                                             "SELECT MIN(trans_date) as begin_date,
                                             MAX(trans_date) as end_date
                                             FROM receipt_transactions"),
            
            # extract value
            total_sales = suppressWarnings(dbGetQuery(conn,
                                                      "SELECT sum(amount) as total_sales
                                         FROM receipt_transactions"))[1, 1],
            
            # extract value
            total_services_sales = suppressWarnings(dbGetQuery(conn,
                                             "SELECT sum(r.amount) as tot_svc_sales
                                             FROM receipt_transactions r, service_listing s
                                             WHERE (r.description = s.service_desc AND s.service_desc !='') "))[1, 1],
                
            # extract value
            total_products_sales = suppressWarnings(dbGetQuery(conn,
                                              "SELECT sum(r.amount) as tot_prod_sales
                                              FROM receipt_transactions r, product_listing p
                                              WHERE (r.description = p.prod_desc AND p.prod_desc !='') "))[1, 1],
                
            # extract value
            misc_sales = suppressWarnings(dbGetQuery(conn,
                                             "SELECT COUNT(receipt_num) as num_transactions,
                                             description,
                                             SUM(amount) as total_misc_sales,
                                             ROUND((SUM(amount) / 115809), 5) as '%_total_sales'
                                             FROM receipt_transactions
                                             WHERE description = ''"))[1, 1],
                
            # extract value
            num_services_offered = suppressWarnings(dbGetQuery(conn,
                                            "SELECT COUNT(service_id) as num_services_offered
                                            FROM service_listing
                                            WHERE is_active = 1"))[1, 1],
                
            # extract value  
            num_products_offered = suppressWarnings(dbGetQuery(conn,
                                            "SELECT COUNT(prod_id) as num_products_offered
                                            FROM product_listing
                                            WHERE is_active = 1"))[1, 1],
                
            # show table
            products_oos = suppressWarnings(dbGetQuery(conn,
                                             "SELECT prod_category, prod_code, prod_desc, prod_brand,
                                                prod_supplier, num_on_hand
                                             FROM product_listing
                                             WHERE num_on_hand = 0")),
                
            #show table
            top_ten_services = suppressWarnings(dbGetQuery(conn,
                                                "SELECT s.service_code,
                                                    s.service_category,
                                                    s.service_desc,
                                                    SUM(r.amount) as total_service_sales,
                                                    ROUND(((SUM(r.amount) / 108669.7) * 100), 2) as '%_service_sales',
                                                    ROUND(((SUM(r.amount) / 115809) * 100), 2) as '%_total_sales'
                                                FROM receipt_transactions r
                                                JOIN service_listing s
                                                ON r.description = s.service_desc
                                                GROUP BY s.service_code,
                                                         s.service_category,
                                                         s.service_desc
                                                ORDER BY total_service_sales DESC
                                                LIMIT 10")),
                
            # show table    
            top_ten_products = suppressWarnings(dbGetQuery(conn,
                                                "SELECT p.prod_code,
                                                    p.prod_category,
                                                    p.prod_desc,
                                                    SUM(r.amount) as total_product_sales,
                                                    ROUND(((SUM(r.amount) / 7066.61) * 100), 2) as '%_product_sales',
                                                    ROUND(((SUM(r.amount) / 115809) * 100),2) as '%_total_sales'
                                                FROM receipt_transactions r
                                                JOIN product_listing p
                                                ON r.description = p.prod_desc
                                                GROUP BY p.prod_code,
                                                         p.prod_category,
                                                         p.prod_desc
                                                ORDER BY total_product_sales DESC
                                                LIMIT 10")),
                
            # show table    
            bottom_five_services = suppressWarnings(dbGetQuery(conn,
                            "SELECT s.service_code,
                                                    s.service_category,
                                                    s.service_desc,
                                                    SUM(r.amount) as total_service_sales,
                                                    ROUND(((SUM(r.amount) / 108669.7) * 100), 2) as '%_service_sales',
                                                    ROUND(((SUM(r.amount) / 115809) * 100), 2) as '%_total_sales'
                                                FROM receipt_transactions r
                                                JOIN service_listing s
                                                ON r.description = s.service_desc
                                                GROUP BY s.service_code,
                                                         s.service_category,
                                                         s.service_desc
                                                ORDER BY total_service_sales ASC
                                                LIMIT 5")),
                
            # show table    
            bottom_five_products = suppressWarnings(dbGetQuery(conn,
                                                     "SELECT p.prod_code,
                                                    p.prod_category,
                                                    p.prod_desc,
                                                    SUM(r.amount) as total_product_sales,
                                                    ROUND(((SUM(r.amount) / 7066.61) * 100), 2) as '%_product_sales',
                                                    ROUND(((SUM(r.amount) / 115809) * 100),2) as '%_total_sales'
                                                FROM receipt_transactions r
                                                JOIN product_listing p
                                                ON r.description = p.prod_desc
                                                GROUP BY p.prod_code,
                                                         p.prod_category,
                                                         p.prod_desc
                                                ORDER BY total_product_sales ASC
                                                LIMIT 5")),
                
            # show line plot   
            daily_sales = ggplotly(dbGetQuery(conn,
                    "SELECT trans_date as date, WEEK(trans_date) as week_no,
                        SUM(amount) as daily_amount
                    FROM receipt_transactions
                    GROUP BY trans_date
                    ORDER BY trans_date ASC") %>%
                    ggplot(aes(x = as.Date(date), y = daily_amount, group = 20, color = factor(week_no))) +
                    geom_line(stat = "identity") +
                    geom_smooth(se = FALSE, color = "black", size = 0.5) +
                    scale_x_date(date_breaks = "5 days", date_labels = "%d-%b") +
                    scale_color_discrete(name = "Week #") +
                    xlab("2018") +
                    ylab("Amount ($)") +
                    theme(axis.text.x = element_text(angle = 90)) ),

            # show line plot
            daily_sales_isolated_DOW = ggplotly(dbGetQuery(conn,
                    "SELECT trans_date as date, DAYNAME(trans_date) as day,
                        SUM(amount) as daily_amount
                    FROM receipt_transactions
                    GROUP BY trans_date
                    ORDER BY trans_date ASC") %>%
                    ggplot(aes(x = as.Date(date), y = daily_amount, 
                        group = day, color = day)) +
                    geom_line(stat = "identity") +
                    scale_x_date(date_breaks = "5 days", date_labels = "%d-%b") +
                    xlab("2018") +
                    ylab("Amount ($)") +
                    theme(axis.text.x = element_text(angle = 90),
                          legend.title = element_blank()) ),

            # show bar plot
            DOW_sales_aggregated = ggplotly(dbGetQuery(conn,
                    "SELECT DAYNAME(trans_date) as day,
                        SUM(amount) as total_sales
                    FROM receipt_transactions
                    GROUP BY day
                    ORDER BY total_sales DESC") %>%
                    ggplot(aes(x = day, y = total_sales, fill = day)) +
                    geom_bar(stat = "identity") +
                    geom_text(aes(label = total_sales), 
                              position = position_nudge(y = 800), size = 3) +
                    scale_x_discrete(limits = c("Sunday", "Monday", "Tuesday",
                                                "Wednesday", "Thursday",
                                                "Friday", "Saturday")) +
                    xlab("") +
                    ylab("Amount ($)") +
                    theme(legend.title = element_blank(),
                          legend.position = "none") ),

            # show bar plot
            sales_by_week = ggplotly(dbGetQuery(conn,
                    "SELECT WEEK(trans_date) as week,
                        SUM(amount) as total_sales
                    FROM receipt_transactions
                    GROUP BY week
                    ORDER BY week") %>%
                    ggplot(aes(x = week, y = total_sales)) +
                    geom_bar(stat = "identity", fill = "steelblue") +
                    geom_smooth(se = FALSE, color = "black", size = 0.5) +
                    scale_x_continuous(breaks = seq(10, 30, by = 2)) +
                    xlab("Week #") +
                    ylab("Amount ($)"))
    )
}