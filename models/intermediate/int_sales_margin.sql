WITH Sub1 AS (
SELECT *
FROM {{ref("stg_raw__sales")}}
LEFT JOIN {{ref("stg_raw__product")}}
USING (products_id)
LEFT JOIN {{ref("stg_raw__ship")}}
USING (orders_id)
)

SELECT *
, purchase_price*quantity AS purchase_cost
, ROUND(revenue-(purchase_price*quantity),2) AS margin
,{{margin_percent('purchase_price','revenue',3)}} AS margin_percent
FROM Sub1