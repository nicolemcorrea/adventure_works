with
    src_address as (
        select
            cast(ADDRESSID as int) as pk_address
            , cast(STATEPROVINCEID as int) as fk_stateprovince
            , cast(CITY as string) as name_city
            , cast(ADDRESSLINE1 as string) as address_street
            , cast(POSTALCODE as string) as postal_code
            , cast(SPATIALLOCATION as string) as spatial_location

        from {{ source("erp_adventure_works", "address") }}
    )

select *
from src_address