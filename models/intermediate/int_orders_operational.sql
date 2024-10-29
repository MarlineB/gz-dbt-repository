WITH Sub2 AS (
    SELECT *
    FROM {{ref("int_orders_margin")}}
    INNER JOIN {{ref("stg_raw__ship")}}
    USING (orders_id)
)

SELECT *
    ,ROUND((margin+shipping_fee-logcost-ship_cost),2) AS operationnal_margin
FROM SUB2