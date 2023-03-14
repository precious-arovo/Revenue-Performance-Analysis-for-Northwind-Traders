-- Script Showing the solution to the set of exloratory analysis questions on the Northwind Traders Database.

/* Questuion 1:	Create a report showing Northwind’s orders sorted by Freight from the most expensive 
to the least expensive. Show OrderID, OrderDate, ShippedDate, CustomerID, and Freight.
;*/
select
OrderID,
convert(date, OrderDate) as OrderDate, -- Removing the time part of the order date.
convert(date, ShippedDate) as ShippedDate, -- Removing the time part of the shipped date.
CustomerID,
format(Freight, 'c') as Freight -- Generating the freight attribute as a currency attribute
from Orders
order by Freight desc -- Ordering the report by the freight attribute and in descending order.;




/*Question 2: 2.	Create a report that shows the company name, contact title, city, and country of all
customers in Mexico or in any city in Spain except Madrid.
;*/
select
CustomerID,
CompanyName,
ContactTitle,
City,
Country
from Customers
where country = 'Mexico'
or (Country = 'Spain'
and city <> 'Madrid')
;
-- This query produces a report containing the customer ID, company name, contact title, city and country
-- of all customers in Mexico and Spain excluding customers in Madrid, Spain.




/* Question 3: If the freight cost is greater than or equal to $500.00, it will now be taxed by
10%. Create a report that shows the order id, freight cost, and freight cost with this tax for all
orders of $500 or more.*/
select
OrderID, 
format(Freight, 'c') as Freight, -- Converting the freight attribute to currency.
format(Freight * 0.1, 'c') as 'Tax', -- Creating an attribute for the 10% tax cost.
format(Freight- (Freight * 0.1), 'c') as 'TaxedFreight' -- Creating an attribute for the freight after removing the 10% tax cost.
from Orders
where Freight >= '500.00' -- Constraining the query to only generate report where the freight iw greater or equal to 500
;




/*Question 4: Retrieve the number of employees in each city.
;*/
select
City,
count(EmployeeID) as 'EmployeeInCity'
from Employees
group by city; -- Grouping by City
-- This provides the record of the number of employees in each city.




/* Question 5: Create a report showing the Order ID, the name of the company that placed the order, and the first and
last name of the associated employee.
Only show orders placed after January 1, 1998, that shipped after they were required. Sort by Company Name.
;*/
select
o.OrderID,
CONVERT(date, o.OrderDate) as OrderDate, -- Removing the unnecessary time part.
c.CompanyName,
c.ContactName,
e.EmployeeID,
CONCAT(e.FirstName,' ',e.LastName) as EmployeeName
from Orders o
join Customers c
on o.CustomerID = c.CustomerID
join Employees e
on o.EmployeeID = e.EmployeeID
where OrderDate > '1998-01-01' -- Constraining the report to only orders placed after 1998.
order by c.CompanyName;




/* Question 6: Create a report that shows the total quantity of products (from the Order_Details table) ordered.
Only display records for products for which the quantity ordered is greater than 200.
;*/

select
OrderID,
sum(Quantity) as [Total Quantity of Product]
from [Order Details]
group by OrderID
having sum(Quantity) > '200' -- Constraining the query to only generate report for sum of quantity greater than 200.
;
