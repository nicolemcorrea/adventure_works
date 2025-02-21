with creditcard as (
    select 
         pk_creditcard
        ,type_creditcard
    from {{ ref('stg_erp__creditcard') }}
)
select * from creditcard