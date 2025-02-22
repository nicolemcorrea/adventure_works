with
    src_store as (
        select
            cast(BUSINESSENTITYID as int) as pk_store
            , cast(NAME as string) as name_store

        from {{ source("erp_adventure_works", "store") }}
    )

select *
from src_store