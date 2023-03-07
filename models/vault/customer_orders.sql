{{ config(schema='VAULT') }}

with customers as (
select * from {{ ref('stg_customers') }}
),
orders as (
select * from {{ ref('stg_orders') }}
),
products as (
select * from {{ ref('stg_products') }}
)
select 
     order_id
    , order_date
    , o.customer_id
    , p.product_id
    , qty
    , s.name customer_name
    , address
    , tel
    , region
    , p.name product_name
    , rate
    , (rate * qty) value
from orders o
left join customers s on s.customer_id = o.customer_id
left join products p on p.product_id = o.product_id


