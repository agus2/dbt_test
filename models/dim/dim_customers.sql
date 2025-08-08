{{ config(materialized='table') }}


select distinct
    * EXCLUDE (job_run_id, job_run_date),
    '{{ invocation_id }}' as log_id, -- ID de ejecución DBT
    current_timestamp() as execution_date
from {{ ref("stg_CUSTOMER") }} c
