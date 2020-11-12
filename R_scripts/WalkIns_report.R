# This script queries database to extract info specifically about Walk-In 
#   customers.

walkins_query <- function (query){
    
    switch (query,
            
            # show table
            walkins_report = dbGetQuery(conn,
                                    "SELECT r.trans_id, r.trans_date, 
                                        c.client_code,
                                        st.staff_name AS servicing_staff,
                                        r.description, sl.service_code, 
                                        pl.prod_code, R.quantity, r.amount
                                    FROM receipt_transactions r
                                    JOIN clients c ON r.client_id = c.client_id
                                    JOIN staff st ON r.servicing_staff_id = st.staff_id
                                    LEFT JOIN service_listing sl ON r.description = sl.service_desc
                                    LEFT JOIN product_listing pl ON r.description = pl.prod_desc
                                    WHERE r.client_id = 822
                                    ORDER BY r.trans_date")
    )
}