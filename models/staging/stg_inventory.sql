SELECT
  warehouse_id,
  product_id,
  quantity_on_hand,
  CAST(last_updated AS DATE) AS last_updated
FROM {{ source('project_dbt', 'inventory') }}
