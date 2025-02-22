with
    dim_date as (
        select
            {{ dbt_utils.generate_surrogate_key(['date_day', 'day_of_week_name']) }} as sk_date
            , *
        from ({{ dbt_date.get_date_dimension("2011-01-01", "2014-12-31") }}) as date_dimension
    )

select *
from dim_date