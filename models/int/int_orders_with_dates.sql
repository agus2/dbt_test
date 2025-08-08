{{ config(materialized='view') }}

with orders as (
  select * from {{ ref('stg_ORDERS') }}
),
lineitems as (
  select * from {{ ref('stg_LINEITEM') }}
)


select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.total_price,
    o.order_date,
    li.ship_date,
    li.commit_date,
    o.order_priority,
    o.ship_priority,
    o.clerk,
    o.comment,
    o.log_id,
    o.execution_date
from orders o
left join lineitems li
    on o.order_id = li.order_id

