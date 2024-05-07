select CUSTOMER_NAME
from {{ ref('RAW_CUSTOMER') }}
where CUSTOMER_NAME is null