with 
    src_salesorderheader as (
    select
        cast(SALESORDERID as int) as pk_salesorder
        , cast(CUSTOMERID as int) as fk_customer
        , cast(SHIPTOADDRESSID as int) as fk_address
        , cast (CREDITCARDID as int) as fk_creditcard 
        , cast(ORDERDATE as timestamp) as order_date
        , cast(SUBTOTAL as numeric(18,2)) as salesorder_subtotal
        , cast(TAXAMT as numeric(18,2)) as salesorder_tax
        , cast(FREIGHT as numeric(18,2)) as  salesorder_freight
        , cast(TOTALDUE as numeric(18,2)) as salesorder_totaldue 
        , cast (ONLINEORDERFLAG as string) as online_orderflag
        
    from {{ source('erp_adventure_works', 'salesorderheader') }}
)

select * from src_salesorderheader