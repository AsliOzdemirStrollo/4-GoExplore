SELECT 
  p.Product_type,
  r.Country,
  SUM(d.Quantity * d.Unit_sale_price) AS Total_Revenue
FROM `goexplore-sb.GoExp.daily_sales` AS d
JOIN `goexplore-sb.GoExp.products` AS p 
  ON d.Product_number = p.Product_number
JOIN `goexplore-sb.GoExp.retailers` AS r 
  ON d.Retailer_code = r.Retailer_code
GROUP BY 
  p.Product_type, 
  r.Country
ORDER BY 
  p.Product_type;