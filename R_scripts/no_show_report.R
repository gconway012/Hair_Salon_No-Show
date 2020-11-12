# This script queries database to extract info specifically about No-Shows.

noshow_query <- function (query){
    
    switch (query,
            
            # show table
            noshow_report = dbGetQuery(conn,
                                       "SELECT ns.report_id as no_show_report_id,
                ns.booking_date, cl.client_code,
                st.staff_name as servicing_staff, sl.service_code, 
                sl.service_desc
           FROM no_show_report ns
           LEFT JOIN clients cl ON ns.client_id = cl.client_id
           JOIN staff st ON ns.staff_id = st.staff_id
           JOIN service_listing sl ON ns.service_id = sl.service_id")
    )
}