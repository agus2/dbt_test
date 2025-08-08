{{ config(materialized='view') }}

with source as (
    select
        o.O_ORDERKEY as order_id,
        o.O_CUSTKEY as customer_id,
        o.O_ORDERSTATUS as order_status,
        o.O_TOTALPRICE as total_price,
        o.O_ORDERDATE as order_date,
        o.O_ORDERPRIORITY as order_priority,
        o.O_CLERK as clerk,
        o.O_SHIPPRIORITY as ship_priority,
        o.O_COMMENT as comment,
        '{{ invocation_id }}' as log_id,
        current_timestamp() as execution_date
    from {{ source('tpch_sf1','ORDERS') }} o
)

select * from source

