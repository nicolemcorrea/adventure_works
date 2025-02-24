with creditcard as (
    select *
    from {{ ref('stg_erp__creditcard') }}
)
select * from creditcard