with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

    , person as (
        select *
        from {{ ref('stg_erp__person') }}
    )

    , store as (
        select *
        from {{ ref('stg_erp__store') }}
    )

    , int_customer as (
        select
            customer.pk_customer 
            , person.name
            , person.name_persontype
            , store.name_store
            
        from customer
        left join person on person.pk_person = customer.fk_person
        left join store on store.pk_store =  customer.fk_store
    )
    
select * from int_customer