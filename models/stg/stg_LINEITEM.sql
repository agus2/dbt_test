
{{ config(materialized='view') }}

with source as (
    select
        L_ORDERKEY as order_id,
        L_SHIPDATE as ship_date,
        L_COMMITDATE as commit_date,
        '{{ invocation_id }}' as log_id,
        current_timestamp() as execution_date
    from {{ source('tpch_sf1', 'LINEITEM') }}
)

select * from source
