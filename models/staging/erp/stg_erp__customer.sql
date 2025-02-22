with
    src_customer as (
        select
            cast(CUSTOMERID as int) as pk_customer
            , cast(STOREID as int) as fk_store
            , cast(PERSONID as int) as fk_person

        from {{ source("erp_adventure_works", "customer") }}
    )

select *
from src_customer