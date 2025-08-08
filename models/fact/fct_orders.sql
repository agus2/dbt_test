{{ config(materialized="incremental", unique_key="order_id") }}

select
    order_id,
    customer_id,
    total_price,
    order_date,
    ship_date,
    commit_date,
    log_id,
    execution_date
from {{ ref("int_orders_with_dates") }}

{% if is_incremental() %}
    where order_date > (select max(order_date) from {{ this }})
{% endif %}
