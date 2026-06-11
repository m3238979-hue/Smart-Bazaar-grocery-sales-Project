-- Total sales and average sales per item for each Item_Type

SELECT
  Item_Type,
  SUM(total_Sales) AS total_sales,
  AVG(total_Sales) AS avg_sales_per_item
FROM smart_bazaar
GROUP BY Item_Type
ORDER BY total_sales DESC;

-- Total number of items sold per Outlet_Location_Type

SELECT
    Outlet_Location_Type,
    SUM(Item_Weight) AS total_weight
FROM smart_bazaar
GROUP BY Outlet_Location_Type
ORDER BY total_weight DESC;

-- Max, min, avg Item_Outlet_Sales for each Outlet_Type
SELECT 
    outlet_type,
    MIN(total_sales) AS min_sale,
    MAX(total_sales) AS max_sale,
    AVG(total_sales) AS avg_sale
FROM smart_bazaar
GROUP BY outlet_type
ORDER BY AVG(total_sales) DESC;

-- Top 5 outlets with highest total revenue
SELECT
  Outlet_Identifier,      
  SUM(total_Sales) AS total_revenue
FROM smart_bazaar
GROUP BY Outlet_Identifier
ORDER BY total_revenue DESC
LIMIT 5;

