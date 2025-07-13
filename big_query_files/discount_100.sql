SELECT
  r.retailer_code,  
  r.retailer_name, 
  ds.Product_number, 
  ds.unit_price, 
  ds.unit_sale_price 
FROM 
  `goexplore-sb.GoExp.daily_sales` AS ds 

JOIN 
  `goexplore-sb.GoExp.retailers` AS r
ON 
  ds.retailer_code = r.retailer_code
WHERE 
  ds.unit_sale_price = 0 AND ds.unit_price > 0
ORDER BY 
  r.retailer_name;