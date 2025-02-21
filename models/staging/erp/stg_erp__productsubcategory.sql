with 
    src_productsubcategory as (
    select
        cast(PRODUCTSUBCATEGORYID as int) as pk_productsubcategory
        , cast(PRODUCTCATEGORYID as int) as fk_productcategory
        , cast(NAME as string) as name_productsubcategory
        
    from {{ source('erp_adventure_works', 'productsubcategory') }}
)

select *
from src_productsubcategory