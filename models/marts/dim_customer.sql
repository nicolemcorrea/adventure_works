with dim_customer as (
    select * 
    from {{ ref('int_prep_customer') }}
)

select * from dim_customer