with 
    src_salesreason as (
    select
         cast(SALESREASONID as int) as pk_salesreason
        , cast(NAME as string) as name_salesreason
        , cast(REASONTYPE as string) as type_salesreason
        
    from {{ source('erp_adventure_works', 'salesreason') }}
)

select *
from src_salesreason