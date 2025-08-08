{{ 
    config(materialized='view') 
}}

select
  c_custkey as customer_id,
  c_name as customer_name,
  c_nationkey,
  {{ audit_columns() }}
from {{ source('tpch_sf1','CUSTOMER') }}

