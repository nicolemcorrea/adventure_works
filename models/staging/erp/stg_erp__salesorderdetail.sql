with 
    src_salesorderdetail as (
    select
        cast(SALESORDERDETAILID as int) as pk_salesorderdetail
      , cast(SALESORDERID as int) as fk_salesorder
      , cast(PRODUCTID as int) as fk_product  
      , cast(ORDERQTY as int) as order_qty  
      , cast(UNITPRICE as numeric(18,4)) as unit_price
      , cast(UNITPRICEDISCOUNT as numeric(18,2)) as discount_price
        
    from {{ source('erp_adventure_works', 'salesorderdetail') }}
)

select *
from src_salesorderdetail