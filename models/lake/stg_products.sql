{{ config(schema='LAKE') }}

with products as
(
select * from {{ source('work','products') }}
)

select * from products
