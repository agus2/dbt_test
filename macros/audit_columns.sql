{% macro audit_columns() %}
    '{{ var("job_run_id") }}'::string as job_run_id,
    '{{ var("job_run_date") }}'::timestamp as job_run_date
{% endmacro %}
