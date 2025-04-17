SELECT
  order_id,
  product_id,
  warehouse_id,
  CAST(order_date AS DATE) AS order_date,
  quantity,
  unit_price
FROM {{ source('project_dbt', 'warehouse_sales') }}
