SELECT
  r.Country,
  SUM(ds.Unit_sale_price * ds.Quantity) AS Revenue
FROM
  `GoExp.daily_sales` ds
JOIN
  `GoExp.retailers` r
  ON ds.Retailer_code = r.Retailer_code
GROUP BY
  r.Country
ORDER BY
  Revenue DESC
