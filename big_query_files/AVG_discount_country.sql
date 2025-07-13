SELECT
  r.country,
  AVG(ds.unit_price - ds.unit_sale_price) AS average_discount_amount
FROM
  `goexplore-sb.GoExp.daily_sales` AS ds
JOIN
  `goexplore-sb.GoExp.retailers` AS r
ON
  ds.Retailer_code = r.Retailer_code
GROUP BY
  r.country
ORDER BY
  average_discount_amount DESC;