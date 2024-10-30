WITH subquery_join AS (
   SELECT *
FROM {{ref("int_campaigns_day")}}
LEFT JOIN {{ref("finance_days")}}
USING (date_date)
)

SELECT *
, ROUND(operationnal_margin-ads_cost,2) AS ads_margin
FROM subquery_join
ORDER BY date_date DESC