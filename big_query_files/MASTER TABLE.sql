SELECT
  -- Fact Table Columns
  ds.Retailer_code,
  ds.Quantity,
  ds.Product_number,
  ds.Date,
  ds.Order_method_code,
  ds.Unit_price,
  ds.Unit_sale_price,
  
  -- Product Info
  p.Product,
  p.Product_brand,
  p.Product_color,
  p.Product_line,
  p.Product_type,
  p.Unit_cost,

  -- Retailer Info
  r.Country,
  r.Retailer_name,
  r.Type AS Retailer_type,

  -- Order Method Info
  om.Order_method_type,

 -- Calculated Columns
  ds.Unit_sale_price * ds.Quantity AS Revenue,
  (ds.Unit_price - ds.Unit_sale_price) * ds.Quantity AS Discount,
  ROUND(SAFE_DIVIDE(ds.Unit_price - ds.Unit_sale_price, ds.Unit_price) * 100, 2) AS Discount_percentage,
  (ds.Unit_sale_price - p.Unit_cost) * ds.Quantity AS Profit


FROM
  `GoExp.daily_sales` ds
JOIN
  `GoExp.retailers` r
  ON ds.Retailer_code = r.Retailer_code
JOIN
  `GoExp.products` p
  ON ds.Product_number = p.Product_number
JOIN
  `GoExp.methods` om
  ON ds.Order_method_code = om.Order_method_code
