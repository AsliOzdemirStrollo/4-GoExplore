SELECT
  r.retailer_code, 
  r.retailer_name, 
  MAX( (ds.unit_price - ds.unit_sale_price) / ds.unit_price ) * 100 AS highest_discount_percentage
 
FROM
  `goexplore-sb.GoExp.daily_sales` AS ds
JOIN
  `goexplore-sb.GoExp.retailers` AS r
ON
  ds.retailer_code = r.retailer_code
GROUP BY
  r.retailer_code,
  r.retailer_name
ORDER BY
  highest_discount_percentage DESC; 