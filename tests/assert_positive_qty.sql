select
  qty
from {{ ref('customer_orders') }}
where qty < 0

