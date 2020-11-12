# This script queries database to extract info specifically about cancellations.

cancellations_query <- function (query){
    
    switch (query,
            
            # show table
            cancellations_report = dbGetQuery(conn,
                                              "SELECT c.cancellation_id, 
                                                c.cancel_date, cl.client_code,
                                                sl.service_desc, 
                                                st.staff_name as staff_name,
                                                c.booking_date, 
                                                stt.staff_name as canceled_by,
                                                c.days
                                              FROM cancellations c
                                              JOIN clients cl ON c.client_id = cl.client_id
                                              JOIN service_listing sl ON c.service_id = sl.service_id
                                              JOIN staff st ON c.staff_id = st.staff_id
                                              JOIN staff stt ON c.canceled_by_id = stt.staff_id
                                              ORDER BY cancel_date")
    )
}