SELECT 
  r.Country,
  SUM(d.Quantity) AS Units_Sold
FROM `goexplore-sb.GoExp.daily_sales` d
JOIN `goexplore-sb.GoExp.retailers` r 
  ON d.Retailer_code = r.Retailer_code
GROUP BY r.Country
ORDER BY r.Country;