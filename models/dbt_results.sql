{{
  config(
    materialized = 'incremental',
    transient = False,
    unique_key = 'result_id',
    schema = 'AUDIT'
  )
}}

with empty_table as (
    select
        null as result_id,
        null as invocation_id,
        null as unique_id,
        null as database_name,
        null as schema_name,
        null as name,
        null as resource_type,
        null as status,
        cast(null as float) as execution_time,
        cast(null as int) as rows_affected,
	null as _timestamp
)

select * from empty_table
-- This is a filter so we will never actually insert these values
where 1 = 0
