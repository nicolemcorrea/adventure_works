with 
    src_salesorderheadersalesreason as (
    select
        cast(SALESORDERID as int) as pk_salesorder
        , cast(SALESREASONID as int) as fk_salesreason 
        
    from {{ source('erp_adventure_works', 'salesorderheadersalesreason') }}
)

select *
from src_salesorderheadersalesreason