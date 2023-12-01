select * from pizza_sales
--Problem Statement
-- PIZZA SALES ANALYSIS IN SQL
--KPI's Requirement

--1.Total Revenue for all the Pizza sales

select sum(total_price) as Total_Revenue from pizza_sales

--2. Average Order value : The average amount spent per order is calculated by 
--   dividing the total revenue by total number of orders

   select cast(cast(sum(total_price) as decimal(10,2))/
   cast(count(distinct order_id)as decimal(10,2))as decimal(10,2)) as Average_OrderValue from pizza_sales

   --3. Total pizzas sold

   select sum(quantity) as Total_pizzas_sold from pizza_sales

   --4. Total orders: Total number of orders placed

   select count(distinct(order_id)) as Total_orders from pizza_sales

   --5.Average Pizzas per order: The average number of pizzas sold per order is calculated by dividing the total number of pizzas sold by the total number of orders

   select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct(order_id))as decimal(10,2)) as decimal(10,2)) as AVGpizzas_perOrder 
   from pizza_sales

   --6. Daily Trend for Total Orders

   select DATENAME(dw,order_date) as Order_Day,
   count(distinct(order_id)) as Total_Orders from pizza_sales
   group by DATENAME(dw,order_date) 
   order by Total_Orders desc

   --7. Monthly trend for Total Orders

   select DATENAME(MONTH,order_date) as Order_Month,
   count(distinct(order_id)) as Total_Orders from pizza_sales
   group by DATENAME(MONTH,order_date) 
   order by Total_Orders desc

   --8. Percentage of Sales by Pizza Category

   select pizza_category as Category,
		  cast(sum(total_price) as decimal(10,2))as Total_revenue,
		  cast(sum(total_price) * 100/(select sum(total_price) from pizza_sales) as decimal(10,2))as Percentage_of_Pizza_Category 
		  from pizza_sales
		  group by pizza_category
		  order by Total_revenue desc

	--9. Percentage of sales pizza size

	select pizza_size as Pizza_Size,
		  cast(sum(total_price) as decimal(10,2))as Total_revenue,
		  cast(sum(total_price) * 100/(select sum(total_price) from pizza_sales) as decimal(10,2))as Percentage_of_Pizza_Category 
		  from pizza_sales
		  group by pizza_size
		  order by Total_revenue desc

	--10. Total pizza sold by Pizza Category

	SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
		FROM pizza_sales
		GROUP BY pizza_category
		ORDER BY Total_Quantity_Sold DESC

	--11.Top 5 Pizzas by Revenue

	select top 5 pizza_name as Pizza, cast(sum(total_price)as decimal(10,2)) as Total_Revenue 
	from pizza_sales 
	group by pizza_name
	order by Total_Revenue desc

	--12.Bottom 5 Pizzas by Revenue:

	select top 5 pizza_name as Pizza, cast(sum(total_price)as decimal(10,2)) as Total_Revenue 
	from pizza_sales 
	group by pizza_name
	order by Total_Revenue 

	--13 Top 5 Pizzas by Quantity

	select top 5 pizza_name as Pizza,
	sum(quantity) as Total_Quantity_sold from pizza_sales 
	group by pizza_name
	order by Total_Quantity_sold desc

	--14 Bottom 5 Pizzas by Quantity

	select top 5 pizza_name as Pizza,
	sum(quantity) as Total_Quantity_sold from pizza_sales 
	group by pizza_name
	order by Total_Quantity_sold asc

	--15 Top 5 pizzas by Total Order

	select top 5 pizza_name as Pizza,
	count(distinct(order_id)) as Total_order from pizza_sales
	group by pizza_name
	order by Total_order desc

	--16 Bottom 5 pizzas by Total ORder

	select top 5 pizza_name as Pizza,
	count(distinct(order_id)) as Total_order from pizza_sales
	group by pizza_name
	order by Total_order asc


	
	
