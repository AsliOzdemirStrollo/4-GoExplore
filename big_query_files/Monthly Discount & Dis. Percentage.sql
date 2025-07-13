SELECT 
    EXTRACT(YEAR FROM Date) AS year,
    EXTRACT(MONTH FROM Date) AS month,
    SUM(Unit_price - Unit_sale_price) AS monthly_total_discount,
    SUM(Unit_price) AS monthly_total_original_price,
    ROUND(
        SAFE_DIVIDE(SUM(Unit_price - Unit_sale_price), SUM(Unit_price)) * 100, 2
    ) AS monthly_discount_percentage
FROM 
    `GoExp.daily_sales`
GROUP BY 
    year, month
ORDER BY 
    year, month;
