/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 Select P.Name As ProductName, C.Name As CategoryName
 From products AS P
 Inner Join categories AS C
 ON C.CategoryID = P.CategoryID
 Where C.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 Select p.Name, p.Price, r.Rating from products as p
 inner join reviews as r on r.ProductID = p.ProductID
 where r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName, e.LastName, Sum (s.Quantity) As Total From sales as s
inner join employees As e on e.EmployeeID = s.EmployeeID
Group by e.EmployeeID
order by Total desc
Limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as 'Department Name', c.Name as 'Category  Name' from departments as d
inner join categories as c on c.DepartmentID = d.DepartmentID
Where c.Name =  'Appliances' or c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name , Sum (s.Quantity) as 'Total Sold', Sum(s.Quantitiy * s.PricePerUnit) as 'Total Price'
From products as p
inner join sales as s on s.ProductID = p,ProductID
Where p.ProductID = 97;
/*to verify */
select * from sales where productID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name, r.Reviewer, MIN(r.Rating)
From products as p
inner join reviews as r on r.ProductID = p.ProductID
where p.ProductID = 857 
Group by p.ProductID;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select e.employeeID, e.FirstName, e.LastName,p.Name , SUM(s.Quantity) as TotalSold
From Sales as s
Inner Join employees as e on e.EmployeeID = s.EmployeeID
Inner Join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID;