/*Este teste garante que as vendas brutas de 2011 estão corretas com o valor auditado da contabilidade, que foi de $12.646.112,16*/

with   
    sales_2011 as (
        select 
            round(sum(gross_price), 2) as sum_gross_price
        from {{ref('fct_sales')}}
        where order_date between '2011-01-01' and '2011-12-31'
)
select sum_gross_price
from sales_2011 
where sum_gross_price not between 12646112.00 and 12646113.00