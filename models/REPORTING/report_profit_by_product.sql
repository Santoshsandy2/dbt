SELECT CUSTOMER_ID,SEGMENT,COUNTRY,sum(ORDER_PROFIT) as PROFIT
FROM {{ ref('stg_orders') }} 
GROUP BY CUSTOMER_ID,SEGMENT,COUNTRY