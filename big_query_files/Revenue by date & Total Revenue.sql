SELECT 
    Date,
    Unit_sale_price, 
    Quantity, 
    Unit_sale_price * Quantity AS Revenue,
    SUM(Unit_sale_price * Quantity) OVER () AS Total_Revenue
FROM 
    `GoExp.daily_sales`
ORDER BY 
    Date;