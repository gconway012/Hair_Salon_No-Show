## query database for required data ####
staff_query <- function (query){
    
    switch (query,
            
            # show plot
            earnings_by_staff = ggplotly(dbGetQuery(conn,
                                           "SELECT s.staff_name, 
                                                SUM(r.amount) as total_sales
                                            FROM receipt_transactions r, staff s
                                            WHERE r.servicing_staff_id = s.staff_id
                                            GROUP BY s.staff_name
                                            ORDER BY total_sales DESC") %>%
                ggplot(aes(x = staff_name, y = total_sales, fill = staff_name)) +
                geom_bar(stat = "identity") +
                geom_text(aes(label = total_sales),
                              position = position_nudge(y = 800), size = 3) +
                xlab("") +
                ylab("Amount ($)") +
                theme(legend.title = element_blank(),
                      legend.position = "none") ),
            
            # show plot
            appointments_by_staff = ggplotly(dbGetQuery(conn,
                                           "SELECT t.staff_name, COUNT(DISTINCT(t.client_id)) as num_appointments
                                            FROM(SELECT st.staff_name, 
                                                 sl.service_code, r.trans_date,
                                                 r.client_id, f.booking_date,
                                                 f.booking_time
                                                 FROM receipt_transactions r
                                                 JOIN future_bookings f ON r.trans_date = f.booking_date
                                                 JOIN staff st ON r.servicing_staff_id = st.staff_id
                                                 JOIN service_listing as sl ON r.description = sl.service_desc
                                                 WHERE r.client_id != 822
                                                 ORDER BY r.trans_date, f.booking_time, st.staff_name) t
                                            GROUP BY t.staff_name") %>%
                ggplot(aes(x = staff_name, y = num_appointments, fill = staff_name)) +
                geom_bar(stat = "identity") +
                geom_text(aes(label = num_appointments),
                          position = position_nudge(y = 5), size = 3) +
                xlab("") +
                ylab("# Appointments") +
                theme(legend.title = element_blank(),
                      legend.position = "none") ),
            
            # show plot
            cancellations_by_staff = ggplotly(dbGetQuery(conn,
                                                "SELECT s.staff_name, count(c.cancel_date) as num_cancellations
                                                FROM staff s, cancellations c
                                                WHERE s.staff_id = c.staff_id
                                                GROUP BY s.staff_name
                                                ORDER BY num_cancellations DESC") %>%
                ggplot(aes(x = staff_name, y = num_cancellations, fill = staff_name)) +
                geom_bar(stat = "identity") +
                geom_text(aes(label = num_cancellations),
                          position = position_nudge(y = 2),
                          size = 3) +
                xlab("") +
                ylab("# of Cancellations") +
                theme(legend.title = element_blank(),
                      legend.position = "none") )
            
    )
}