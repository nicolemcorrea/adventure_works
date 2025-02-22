with
    src_person as (
        select
            cast(BUSINESSENTITYID as int) as pk_person
            , cast(FIRSTNAME || ' ' || LASTNAME as string) as name -- concatenar o primeiro e último nome do cliente
            , cast(PERSONTYPE as string) as persontype
            , cast(case persontype
                when 'EM' then 'Employee (Non-Sales)'
                when 'IN' then 'Individual Customer'
                when 'GC' then 'General Contact'
                when 'SP' then 'Sales Person'
                when 'SC' then 'Store Contact'
                when 'VC' then 'Vendor Contact'
                else 'Others'
            end as string) as name_persontype

        from {{ source("erp_adventure_works", "person") }}
    )

select *
from src_person