SELECT
  r.Country,
  p.Product_type,
  SUM(ds.Quantity) AS total_quantity_sold,
  ROW_NUMBER() OVER (PARTITION BY r.Country ORDER BY SUM(ds.Quantity) DESC) AS rank
FROM
  `GoExp.daily_sales` AS ds
JOIN
  `GoExp.products` AS p
  ON ds.Product_number = p.Product_number
JOIN
  `GoExp.retailers` AS r
  ON ds.Retailer_code = r.Retailer_code
GROUP BY
  r.Country, p.Product_type
QUALIFY
  rank = 1
ORDER BY
  r.Country;
