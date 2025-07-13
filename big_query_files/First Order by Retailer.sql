WITH first_sales AS (
  SELECT
    Retailer_code,
    MIN(Date) AS first_sale_date
  FROM
    `GoExp.daily_sales`
  GROUP BY
    Retailer_code
),

total_retailers AS (
  SELECT COUNT(DISTINCT Retailer_code) AS total_retailers
  FROM `GoExp.daily_sales`
)

SELECT
  FORMAT_DATE('%Y-%m', first_sale_date) AS year_month,
  COUNT(*) AS retailers_count,
  (SELECT total_retailers FROM total_retailers) AS total_retailers
FROM
  first_sales
GROUP BY
  year_month
ORDER BY
  year_month;