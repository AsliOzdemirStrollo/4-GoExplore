SELECT 
  r.Country,
  SUM((ds.Unit_sale_price - p.Unit_cost) * ds.Quantity) AS total_profit,
  SUM(ds.Unit_sale_price * ds.Quantity) AS total_revenue,
  ROUND(
    SAFE_DIVIDE(
      SUM((ds.Unit_sale_price - p.Unit_cost) * ds.Quantity),
      SUM(ds.Unit_sale_price * ds.Quantity)
    ) * 100, 2
  ) AS profitability_percentage
FROM 
  `GoExp.daily_sales` AS ds
JOIN 
  `GoExp.products` AS p
    ON ds.Product_number = p.Product_number
JOIN 
  `GoExp.retailers` AS r
    ON ds.Retailer_code = r.Retailer_code
GROUP BY 
  r.Country
ORDER BY 
  profitability_percentage DESC;
