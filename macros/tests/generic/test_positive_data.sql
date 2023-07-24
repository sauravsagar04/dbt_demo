{% macro test_positive_data(model, column_name) %}

    {% set sql_statement %}

        with final as (
            select {{ column_name }} from {{ model }}
        )  
        select case when count( {{column_name }} ) = 0 then 'pass' else 'fail'
        end as status
        from final where {{ column_name }} > 0

    {% endset %}
    {%- set stat = dbt_utils.get_single_value(sql_statement) -%}

    {% if execute %}
    {%- set stat = dbt_utils.get_single_value(sql_statement) -%}
    {% if stat == "fail" %}
        {{ exceptions.raise_compiler_error("Invalid `status for test`. Got: " ~ stat) }}
    {% else %}
        {{insert_test_status('test_positive_data()',model,column_name,stat)}}
    {% endif %}
    {% endif %}

{% endmacro %}