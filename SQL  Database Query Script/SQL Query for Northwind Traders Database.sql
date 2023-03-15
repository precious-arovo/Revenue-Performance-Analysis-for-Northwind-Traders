/* This SQL Query script is intended to extract and put together necessary data from the
Northwind Traders Database for creating a dataset useful for Northwind Traders sales
analysis and visualization
;*/

select
	ord.OrderID as 'Order ID',
	convert(date, ord.OrderDate) as 'Order Date', -- Removing the time part of the date.
	cus.CompanyName as 'Customer',
	cus.City as 'City',
	cus.Country as 'Country',
	p.ProductName as 'Product Name',
	cat.CategoryName as 'Product Category',
	od.UnitPrice as 'Unit Price',
	od.Quantity,
	od.Discount,
	ord.Freight,
	concat(e.FirstName,' ',e.Lastname) as 'Sales Rep'
from Orders ord
join Customers cus
on ord.CustomerID = cus.CustomerID
join [Order Details] od
on ord.OrderID = od.OrderID
join Products p
on od.ProductID = p.ProductID
join Categories cat
on p.CategoryID = cat.CategoryID
join Employees e
on ord.EmployeeID = e.EmployeeID
;