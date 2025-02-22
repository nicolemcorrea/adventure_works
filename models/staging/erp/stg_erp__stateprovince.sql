with
    src_stateprovince as (
        select
            cast(STATEPROVINCEID as int) as pk_stateprovince
            , cast(COUNTRYREGIONCODE as string) as fk_countryregion
            , cast(NAME as string) as name_state

        from {{ source("erp_adventure_works", "stateprovince") }}
    )

select *
from src_stateprovince