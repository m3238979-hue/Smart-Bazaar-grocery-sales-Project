Smart-Bazaar-grocery-sales-Project
is an  analytics project focused on analyzing the sales performance of Smart-Bazaar. This project leverages Excel, SQL, and Power BI to clean data, extract business insights, and build an interactive dashboard for stakeholders.


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
2. Total number of items sold per Outlet_Location_Type

4. Top 5 outlets with highest total revenue
5. Max, min, avg Item_Outlet_Sales for each Outlet_Type
6. For each Outlet_Type, rank items by total sales (highest first)
Top 3 highest-selling products within each product category
