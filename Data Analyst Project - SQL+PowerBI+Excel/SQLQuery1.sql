select * from pizza_sales

select sum(total_price) as Total_Revenue from pizza_sales

select sum(total_price)/ count(distinct order_id) as Avg_OrderValue from pizza_sales

select sum(quantity) as Total_Pizza_Sold from pizza_sales

select count(distinct order_id) as Total_order from pizza_sales

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2))
as decimal(10,2)) as Avg_pizza_order from pizza_sales

select DATENAME(DW,order_date) as Order_Day , COUNT(distinct order_id) as Total_Orders
from pizza_sales
group by DATENAME(DW, order_date)

select DATENAME(mm, order_date) as Month_Name, COUNT(distinct order_id) as Total_Orders from pizza_sales
group by DATENAME(mm, order_date)
order by Total_Orders DESC

select pizza_category, sum(total_price) as Total_Sales,
sum(total_price) * 100 / (select SUM(total_price) from pizza_sales where month(order_date)= 1) as Total_Sales_Categorywise
from pizza_sales
where month(order_date)= 1
group by pizza_category

select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales,
cast(sum(total_price) * 100 / (select SUM(total_price) from pizza_sales where datepart(quarter , order_date) = 1) 
as decimal(10,2)) as PCT from pizza_sales
where datepart(quarter , order_date) = 1
group by pizza_size
order by PCT desc





