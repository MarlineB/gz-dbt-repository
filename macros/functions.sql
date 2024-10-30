{% macro margin_percent(purchase_cost, revenue, nb_decimal=2) %}
     ROUND(SAFE_DIVIDE(({{revenue}}-{{purchase_cost}}),{{revenue}}),{{nb_decimal}})
 {% endmacro %}