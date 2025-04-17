WITH sales AS (
  SELECT
    product_id,
    warehouse_id,
    SUM(quantity) AS total_units_sold,
    SUM(quantity * unit_price) AS total_revenue
  FROM {{ ref('stg_warehouse_sales') }}
  GROUP BY product_id, warehouse_id
)

SELECT
  s.product_id,
  p.product_name,
  p.category,
  s.warehouse_id,
  s.total_units_sold,
  s.total_revenue,
  i.quantity_on_hand
FROM sales s
LEFT JOIN {{ ref('stg_products') }} p
  ON s.product_id = p.product_id
LEFT JOIN {{ ref('stg_inventory') }} i
  ON s.product_id = i.product_id
  AND s.warehouse_id = i.warehouse_id
