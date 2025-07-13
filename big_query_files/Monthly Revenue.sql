SELECT 
  FORMAT_DATE('%Y-%m', Date) AS year_month,
  SUM(Unit_sale_price * Quantity) AS Monthly_Revenue

FROM 
  `goexplore-sb.GoExp.daily_sales`
GROUP BY 
  year_month
ORDER BY 
  year_month;