with
    address as (select * from {{ ref("stg_erp__address") }})
    , stateprovince as (select * from {{ ref("stg_erp__stateprovince") }})
    , countryregion as (select *from {{ref("stg_erp__countryregion")}}),
    
    location as (
        select
             
             address.pk_address
            , countryregion.name_country
            , stateprovince.name_state
            , address.name_city
            , address.address_street
            , address.postal_code
            , address.spatial_location

        from address
        left join stateprovince on address.fk_stateprovince = stateprovince.pk_stateprovince
        left join countryregion on stateprovince.fk_countryregion = countryregion.pk_countryregion
    )

select * from location