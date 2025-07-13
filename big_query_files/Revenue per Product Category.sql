SELECT 
  d.Quantity, 
  d.Unit_sale_price, 
  p.Product_type, 
  SUM(d.Quantity * d.Unit_sale_price) AS Total_Revenue
FROM `goexplore-sb.GoExp.daily_sales` AS d
JOIN `goexplore-sb.GoExp.products` AS p 
  ON d.Product_number = p.Product_number
GROUP BY 
  d.Quantity, 
  d.Unit_sale_price, 
  p.Product_type
ORDER BY 
  p.Product_type;