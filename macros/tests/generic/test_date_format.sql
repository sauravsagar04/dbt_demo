{% macro test_date_format(model,column_name) %}

    {% set sql_statement %}
        select 
        case when count(column_name) = 0 then 'Pass' else 'fail' end
        from information_schema.columns
        where table_name = upper(substr('{{model}}', position('.','{{model}}',position('.','{{model}}','.')+1)+1))
        and column_name = upper('{{column_name}}')
        and data_type != 'DATE'
    {% endset %}

    {%- set stat = dbt_utils.get_single_value(sql_statement) -%}

    {{ insert_test_status('test_date_format()',model,column_name,stat)}}

{% endmacro %}