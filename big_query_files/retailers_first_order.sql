WITH RetailerFirstOrder AS (
  SELECT
    Retailer_code, 
    MIN(Date) AS first_order_date
  FROM
    `goexplore-464512.GoExplore.daily_sales` AS t1 
  GROUP BY
    Retailer_code 
)
SELECT
  FORMAT_DATE('%Y-%m', first_order_date) AS order_month_year,
  COUNT(Retailer_code) AS unique_retailers_acquired
FROM
  RetailerFirstOrder
GROUP BY
  order_month_year
ORDER BY
  order_month_year ASC;