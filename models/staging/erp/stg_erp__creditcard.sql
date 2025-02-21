with 
    src_creditcard as (
    select
        cast(CREDITCARDID as int) as pk_creditcard
        , cast(CARDTYPE as string) as type_creditcard
        
    from {{ source('erp_adventure_works', 'creditcard') }}
)

select *
from src_creditcard