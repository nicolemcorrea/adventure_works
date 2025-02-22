with
    salesorderheadersalesreason as (select * from {{ ref('stg_erp__salesorderheadersalesreason') }})

    , salesreason as (select * from {{ ref('stg_erp__salesreason') }}),

    --query para identificar os motivos de promoção para cada pedido, para priorizar este tipo de motivo, pois um mesmo pedido pode ter mais de um motivo de venda.
    promotion_reasons as (
        select
            pk_salesorder
            , fk_salesreason
            , name_salesreason
            , case name_salesreason
                when 'On Promotion' then 'Yes'
                else 'No'
            end as is_promotion
            , type_salesreason
        , row_number() over (partition by pk_salesorder order by fk_salesreason desc) as orders
        from salesorderheadersalesreason
        left join salesreason on salesorderheadersalesreason.fk_salesreason = salesreason.pk_salesreason
    ),

    int_salesreason as (
        select
            pk_salesorder
            , fk_salesreason
            , name_salesreason as name_reason
            , type_salesreason as type_reason
            , is_promotion
        from promotion_reasons
        where orders in (1)
    )
select *
from int_salesreason