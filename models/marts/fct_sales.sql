with fct_sales as(
    select * 
    from {{ ref('int_prep_salesmetrics') }}
)

select * from fct_sales