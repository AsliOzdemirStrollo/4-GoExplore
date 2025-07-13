SELECT
  ds.Date, 
  SUM(ds.quantity) AS total_quantity_sold 
FROM
  `goexplore-sb.GoExp.daily_sales` AS ds
GROUP BY
  ds.Date
ORDER BY
  ds.Date ASC;