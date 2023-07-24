{% macro generic_tests() %}

{{- test_positive_data('fct_orders', 'amount') -}}
{{- test_date_format('fct_orders', 'order_date') -}}

{% endmacro %}