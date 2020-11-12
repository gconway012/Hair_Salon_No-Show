## query database for required data ####
clients_query <- function (query){
    
    switch (query,
            
            # show table
            date_range_cancellations = dbGetQuery(conn,
                               "SELECT MIN(cancel_date) as begin_cancel_date,
                               MAX(cancel_date) as end_cancel_date,
                               MIN(booking_date) as begin_booking_date,
                               MAX(booking_date) as end_booking_date
                               FROM cancellations"),
            
            # show table
            date_range_noshow_report = dbGetQuery(conn,
                                "SELECT MIN(booking_date) as begin_booking_date,
                                MAX(booking_date) as end_booking_date
                                FROM no_show_report"),

            # show table
            date_range_future_bookings = dbGetQuery(conn,
                                  "SELECT MIN(booking_date) as begin_booking_date,
                                  MAX(booking_date) as end_booking_date,
                                  MIN(booking_time) as begin_booking_time,
                                  MAX(booking_time) as end_booking_time
                                  FROM future_bookings"),

            # extract value
            total_clients_in_records = dbGetQuery(conn, 
                                "SELECT COUNT(DISTINCT(client_code))
                                FROM clients")[1,1],

            # extract value
            total_walkins_on_receipts = dbGetQuery(conn,
                                "SELECT COUNT(DISTINCT(receipt_num))
                                FROM receipt_transactions
                                WHERE client_id = 822"),

            # extract value
            total_clients_on_receipts_excl_walkins = dbGetQuery(conn,
                                       "SELECT COUNT(DISTINCT(client_on_receipt))
                                        FROM(SELECT r.client_id as client_on_receipt, 
                                                    c.client_id, count(r.client_id)
                                             FROM receipt_transactions r
                                             LEFT JOIN clients c
                                             ON r.client_id = c.client_id
                                             WHERE r.client_id != 822
                                             GROUP BY r.client_id, c.client_id) t
                                        ")[1, 1],
                
            # extract value
            total_repeat_clients_on_receipts_excl_walkins = dbGetQuery(conn,
                                 "SELECT COUNT(f.client_id)
                                 FROM (SELECT client_id, COUNT(trans_date) as num_trans
                                       FROM(SELECT trans_date, receipt_num, client_id
                                            FROM receipt_transactions
                                            GROUP BY trans_date, receipt_num, client_id
                                            ORDER BY trans_date, receipt_num, client_id) t
                                        WHERE client_id != 822
                                        GROUP BY client_id
                                        HAVING num_trans > 1
                                        ORDER BY client_id) f
                                   ")[1,1],
                
            # extract value
            total_onetime_clients_on_receipts_excl_walkins = dbGetQuery(conn,
                                   "SELECT COUNT(f.client_id)
                                   FROM (SELECT client_id, COUNT(trans_date) as num_trans
                                        FROM(SELECT trans_date, receipt_num, client_id
                                             FROM receipt_transactions
                                             GROUP BY trans_date, receipt_num, client_id
                                             ORDER BY trans_date, receipt_num, client_id) t
                                        WHERE client_id != 822
                                        GROUP BY client_id
                                        HAVING num_trans = 1
                                        ORDER BY client_id) f
                                   ")[1,1],
                
            # show table
            most_freq_clients_excl_walkins = dbGetQuery(conn,
               "SELECT t.client_code, COUNT(DISTINCT(t.trans_date)) as num_visits,
                    SUM(t.amount) as total_sales,
                    ROUND((SUM(t.amount)/COUNT(DISTINCT((t.trans_date)))), 2) as avg_sales_per_visit,
                    ROUND((COUNT(DISTINCT(t.prod_id))/COUNT(DISTINCT(t.trans_date))), 2) as avg_num_prod_per_visit,
                    ROUND((COUNT(DISTINCT(t.service_id))/COUNT(DISTINCT(t.trans_date))), 2) as avg_num_svcs_per_visit
                FROM(SELECT r.*, p.prod_id, s.service_id, c.client_code
                    FROM receipt_transactions r
                    LEFT JOIN service_listing s ON s.service_desc = r.description
                    LEFT JOIN product_listing p ON p.prod_desc = r.description
                    LEFT JOIN clients c ON c.client_id = r.client_id
                    ORDER BY trans_id) t
                GROUP BY client_code
                HAVING client_code != 'WALK_IN'
                ORDER BY num_visits DESC"),
            
            # show plot
            clients_most_cancellations = ggplotly(dbGetQuery(conn,
                                                "SELECT cl.client_code, count(ca.client_id) as num_cancellations
                                                FROM clients cl, cancellations ca
                                                WHERE cl.client_id = ca.client_id
                                                GROUP BY cl.client_code
                                                ORDER BY num_cancellations DESC
                                                LIMIT 10") %>%
                                        as.data.frame() %>%
                                        ggplot(aes(client_code, y = num_cancellations, fill = factor(num_cancellations))) +
                                        geom_bar(stat = "identity") +
                                        geom_text(aes(label = num_cancellations), 
                                                  position = position_nudge(y = 0.25),
                                                  size = 3.5) +
                                        labs(x = "Client Code",
                                             y = "# of Cancellations",
                                             fill = "") +
                                        scale_fill_brewer(palette = "Set1") +
                                        theme(legend.position = "none",
                                              axis.text.x = element_text(angle = -45))
                                        ),
                
            # show plot
            num_cancellations_by_num_days_before_cancel = dbGetQuery(conn,
                                                            "SELECT days as days_before_appt, COUNT(days) as num_cancellations
                                                            FROM cancellations
                                                            GROUP BY days
                                                            ORDER BY days")
                
    )
}