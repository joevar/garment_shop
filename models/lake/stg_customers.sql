{{ config(schema='LAKE') }}


with customers  as
(
select * from {{ source('work','customers') }}
)
select * from customers
