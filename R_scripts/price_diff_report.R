# This script queries database to extract info specifically about 
#   price differences.

price_diff_query <- function (query){
    
    switch (query,
            
            # show table
            price_diff_report = dbGetQuery(conn,
                                       "SELECT sl.service_id, sl.service_code, 
                                               sl.service_desc,
                                               sl.service_category, 
                                               sl.price as service_price, 
                                               sl.cost,
                                               rt.amount as charged_amount, 
                                               rt.trans_date as receipt_date,
                                               rt.trans_id as transaction_id
                                        FROM service_listing sl
                                        JOIN receipt_transactions rt ON sl.service_desc = rt.description
                                       ORDER BY sl.service_id")
    )
}