create database if not exists project ;
use project ;

select * from superstore ;

#What are the column names in the dataset
show columns from superstore ;

#retrieve all the records of superstore data
select * from superstore ;

#number of rows;
select count("Row ID") from superstore ;

#distinct ship mode
select distinct `Ship Mode`from superstore ; 

#count how many orders were placed?
select count(distinct `Order ID`) from superstore ;

#how many total products were sold ;
select sum(quantity) as Total_sold from superstore ;

#total profit
select sum(Profit) as NET_PROFIT from superstore ;

#tOTAL SALES per category
select Category , sum(Sales) as Total_sales_of_this_Category 
from superstore 
group by Category ;

#Enlist all customers from california
select distinct `Customer name` from superstore 
where State = "California" ;

#find total no. of unique customers
select count(distinct `Customer ID`) from superstore; 

#what is the total profit for the chairs subcategory
select `Sub-Category` , sum(Profit) from superstore group by `Sub-Category` 
having `Sub-Category` = "Chairs" ; 

#show top 5 products by sale 
select `Product Name`, sum(Sales) as Total_sales from superstore group by `Product Name`
Order by Total_sales DESC Limit 5;

#FInd the earliest and latest order date 
select min(`Order Date`) as earliest, 
max(`Order Date`) as latest from superstore ;

#Average Discount per region
select Region, avg(Discount) as AVERAGE_DISCOUNT from superstore 
group by Region ;

#state with highest total sales
select State, sum(Sales) as total_sale from superstore 
group by State 
order by total_sale DESC 
limit 1 ;

select * from superstore ;
#total quantity of products sold per sub category
select `Sub-Category`, sum(Quantity) as total_quantity 
from superstore
group by `Sub-Category` ;

select * from superstore ;
#no. of orders shipped using Second class
select count(*) from superstore
where `Ship Mode` = "Second Class" ;

#list contumer with more than 2 orders
select `Customer ID`, `Customer Name` , count(*) as count_order from superstore
group by `Customer ID`,`Customer Name` having count_order> 2 ;

#top 3 sub categories with profit in each category
select * from (select Category , `Sub-Category`, sum(Profit) as total_profit ,
Rank() over (partition by category)
order by total_profit desc )as rk
from superstore 
group by categ



#find orders with negative profit
select * from superstore where Profit < 0 ;

#cities where more than 1000 sales occur
select City, sum(Sales) as total_sales from superstore 
Group by City having total_sales > 1000 ; 

#find the products with zero profit but non zero sales
select `Product Name`, Sales , Profit
from superstore 
where Profit = 0 AND Sales > 0 ; 

#calculate subcategories where discount is always zero ;
select `Sub-Category`, sum(Discount) as Total_Discount 
from superstore
group by `Sub-Category`
having Total_Discount = 0 ;