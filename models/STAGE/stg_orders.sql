select
--FROM RAW_ORDERS
    O.ORDER_ID
    , O.ORDER_DATE
    , O.SHIP_DATE
    , O.SHIP_MODE
    , O.ORDER_SELLING_PRICE
    , O.ORDER_COST_PRICE
--FROM RAW_CUSTOMER
    , C.CUSTOMER_ID
    , C.CUSTOMER_NAME
    , C.SEGMENT
    , C.COUNTRY
--FROM RAW_PRODUCT
    , P.PRODUCT_ID
    , P.CATEGORY
    , P.PRODUCT_NAME
    , P.SUBCATEGORY
    , (O.ORDER_SELLING_PRICE - O.ORDER_COST_PRICE) AS ORDER_PROFIT
FROM
    {{ ref('RAW_ORDERS') }} AS O
LEFT JOIN
    {{ ref('RAW_CUSTOMER') }} AS C
ON C.CUSTOMER_ID = O.CUSTOMER_ID
LEFT JOIN
    {{ ref('RAW_PRODUCTS') }} AS P
ON P.PRODUCT_ID = O.PRODUCT_ID