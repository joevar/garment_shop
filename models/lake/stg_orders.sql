{{ config(schema='LAKE') }}

with orders  as
(
select * from {{ source('work','orders') }}
)

select * from orders
