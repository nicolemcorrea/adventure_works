with dim_location as (
    select * 
    from {{ ref('int_prep_location') }}
)

select * from dim_location