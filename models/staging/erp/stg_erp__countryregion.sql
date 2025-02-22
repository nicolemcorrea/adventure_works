with 
    src_countryregion as (
    select
         cast(COUNTRYREGIONCODE as string) as pk_countryregion
        , cast(NAME as string) as name_country
        
    from {{ source('erp_adventure_works', 'countryregion') }}
)

select *
from src_countryregion