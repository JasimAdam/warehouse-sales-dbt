SELECT
  product_id,
  product_name,
  category,
  current_price
FROM {{ source('project_dbt', 'products') }}
