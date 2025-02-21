with
/* Chamada dos modelos necessários. */
product as (select * from {{ ref('stg_erp__product') }}),
productcategory as (select * from {{ ref('stg_erp__productcategory') }}),
productsubcategory as (select * from {{ ref('stg_erp__productsubcategory') }}),

final_product as (
    select
        product.pk_product,
        product.name_product,
        coalesce(productcategory.name_productcategory, 'Components & Accessories') as name_productcategory,  
        coalesce(productsubcategory.name_productsubcategory, 'Components & Accessories') as name_productsubcategory 
    from product
    left join productsubcategory on product.fk_productsubcategory = productsubcategory.pk_productsubcategory
    left join productcategory on productsubcategory.fk_productcategory = productcategory.pk_productcategory
)

select * from final_product