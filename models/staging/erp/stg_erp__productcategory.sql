with 
    src_productcategory as (
    select
        cast(PRODUCTCATEGORYID as int) as pk_productcategory
        , cast(NAME as string) as name_productcategory
        
    from {{ source('erp_adventure_works', 'productcategory') }}
)

select *
from src_productcategory