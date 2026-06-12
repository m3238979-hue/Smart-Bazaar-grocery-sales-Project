## Smart-Bazaar-grocery-sales-Project
 It is an  analytics project focused on analyzing the sales performance of Smart-Bazaar. This project leverages Excel, SQL, and Power BI to clean data, extract business insights, and build an interactive dashboard for stakeholders.


 Project Overview :
The goal of this project is to analyze grocery sales data to identify trends, top-performing product categories, seasonal sales spikes, and customer purchasing behavior. The insights generated help Smart-Bazaar optimize its inventory, improve marketing strategies, and increase overall revenue.

How I Plan On Solving the Problem: In helping smart Bazaar gather valuable insights from their extensive dataset, I will be utilizing SQL and a data visualization tool like Power bi to extract relevant information, and conduct insightful analyses. By leveraging SQL's functions, I can uncover key metrics such as viewer ratings, popularity trends, genre preferences, and viewership patterns. Once the data has been extracted and prepared, I will leverage Power bi to present the findings. I plan on creating a dynamic dashboard in power bi that enables users to see specific viewer demographics, or geographical regions.

Key Business Questions Answered
Through SQL queries and Power BI visuals this project answers:
## 1. Total sales and average sales per item for each Item_Type
```sql
SELECT
  Item_Type,
  SUM(total_Sales) AS total_sales,
  AVG(total_Sales) AS avg_sales_per_item
FROM 
  smart_bazaar
GROUP BY 
  Item_Type
ORDER BY 
  total_sales DESC;
```
Result
This query helps the business understand which item categories generate the most revenue and how much, on average, each item sells. It identifies top-performing item types, highlights low-selling categories, and supports decisions on inventory planning, promotions, and pricing strategy.

## 2. Total number of items sold per Outlet_Location_Type
```sql
SELECT
    Outlet_Location_Type,
    SUM(Item_Weight) AS total_weight
FROM smart_bazaar
GROUP BY Outlet_Location_Type
ORDER BY total_weight DESC;
```
Result
This query shows which outlet locations handle the highest volume of products by total item weight. It helps the business understand demand patterns across different locations, so they can make better decisions about stock distribution, logistics planning, and resource allocation.

## 3. Top 5 outlets with highest total revenue
```sql
SELECT
  Outlet_Identifier,      
  SUM(total_Sales) AS total_revenue
FROM smart_bazaar
GROUP BY Outlet_Identifier
ORDER BY total_revenue DESC
LIMIT 5;
```
Result
This query identifies the top 5 outlets generating the highest revenue. It helps the business focus on best-performing stores, understand what drives their success, and use those insights for strategy, resource allocation, and expansion planning.

## 4. Max, min, avg Item_Outlet_Sales for each Outlet_Type
```sql
SELECT 
    outlet_type,
    MIN(total_sales) AS min_sale,
    MAX(total_sales) AS max_sale,
    AVG(total_sales) AS avg_sale
FROM smart_bazaar
GROUP BY outlet_type
ORDER BY AVG(total_sales) DESC;
```
Result
This query helps compare sales performance across different outlet types by showing their minimum, maximum, and average sales. It allows the business to identify high-performing outlet formats, detect underperforming ones, and make decisions on investment, improvements, or expansion based on outlet performance trends.

## 5. For each Outlet_Type, rank items by total sales (highest first)
```sql
SELECT
  Outlet_Type,Item_identifier,Item_type,total_sales,
  RANK() OVER (PARTITION BY Outlet_Type ORDER BY total_sales DESC) AS sales_rank
FROM (
  SELECT Outlet_Type, Item_identifier, Item_type, SUM(total_Sales) AS total_sales
  FROM smart_bazaar
  GROUP BY Outlet_Type, Item_identifier, Item_type) s
ORDER BY Outlet_Type, sales_rank;
```
Result
This query ranks items by total sales within each outlet type, showing which products perform best in each store format. It helps the business identify top-selling items per outlet category, optimize store-specific inventory, and tailor promotions or product placement based on what sells the most in each outlet type.

## 6.Top 3 highest-selling products within each product category
```sql
With RankedSales AS (
Select 
Item_Type,
Item_Identifier,
Total_Sales,
DENSE_RANK() OVER (PARTITION BY Item_Type ORDER BY Total_Sales DESC) as Sales_Rank
FROM smart_bazaar)
SELECT *FROM RankedSales
WHERE Sales_Rank<=3;
```
Result 
This query helps in identifying the top 3 highest-selling products ,showing which products are the primary revenue drivers
It helps the business to focus on promotional budgets, discounts on these SKUs to maximise ROI.
