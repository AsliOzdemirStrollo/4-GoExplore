SELECT 
  FORMAT_DATE('%Y-%m', ds.Date) AS year_month,
  SUM((ds.Unit_sale_price - p.Unit_cost) * ds.Quantity) AS Monthly_total_profit
FROM 
  `GoExp.daily_sales` AS ds
JOIN 
  `GoExp.products` AS p
ON 
  ds.Product_number = p.Product_number
GROUP BY 
  year_month
ORDER BY 
  year_month;