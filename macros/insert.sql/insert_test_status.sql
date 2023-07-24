{% macro insert_test_status(test_name,table_name,column_name,status) %}

    {% set insert_dbt_results_query -%}
        insert into model_test_reports
            (
                test_name,
                column_name,
                table_name,
                status
            ) values
                (
                '{{test_name}}',
                '{{column_name}}',
                '{{table_name}}',
                '{{status}}'
                )
    {%- endset -%}

    {%- do run_query(insert_dbt_results_query) -%}
{% endmacro %}