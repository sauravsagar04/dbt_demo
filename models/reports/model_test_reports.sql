{{
  config(
    materialized = 'incremental',
    transient = False
  )
}}

with report_table as (
    select
        null as test_name,
        null as column_name,
        null as table_name,
        null as status  
)

select * from report_table