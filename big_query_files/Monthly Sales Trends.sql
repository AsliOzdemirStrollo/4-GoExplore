SELECT
  FORMAT_DATE('%Y-%m', d.Date) AS Monthly_Sale,
  r.Country,
  SUM(d.Quantity * d.Unit_sale_price) AS Total_Revenue
FROM `goexplore-sb.GoExp.daily_sales` AS d
JOIN `goexplore-sb.GoExp.retailers` AS r 
  ON d.Retailer_code = r.Retailer_code
GROUP BY 
  Monthly_Sale, 
  r.Country
ORDER BY 
  Monthly_Sale,
  r.Country;