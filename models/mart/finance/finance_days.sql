    WITH revenue_subquery AS (
        SELECT date_date
        ,COUNT(DISTINCT orders_id) AS nb_transactions
        ,ROUND(SUM(revenue),2) AS revenue
        ,ROUND(SUM(revenue)/COUNT(DISTINCT orders_id)) AS average_basket
        FROM {{ref("int_orders_margin")}}
        GROUP BY date_date
        ORDER BY date_date DESC
    )
,
    margin_subquery AS (
        SELECT date_date
        ,ROUND(SUM(margin),2) AS margin
        ,ROUND(SUM(operationnal_margin),2) AS operationnal_margin
        ,SUM(quantity) AS quantity
        ,ROUND(SUM(purchase_cost),2) AS purchase_cost
        ,ROUND(SUM(logcost),2) AS logcost
        ,ROUND(SUM(ship_cost),2) AS ship_cost
        ,ROUND(SUM(shipping_fee),2) AS shipping_fee
        FROM {{ref("int_orders_operational")}}
        GROUP BY date_date
        ORDER BY date_date
    )

    SELECT *
    FROM revenue_subquery
    INNER JOIN margin_subquery
    USING (date_date)
    ORDER BY date_date DESC
