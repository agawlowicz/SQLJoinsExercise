/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS 'Product', c.Name AS 'Category'
FROM categories AS c
JOIN products AS p
ON c.CategoryID = p.CategoryID
WHERE c.Name LIKE 'computer%';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name AS 'Product', products.Price AS 'Price', reviews.Rating
 FROM products
 JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS Total
FROM sales
INNER JOIN employees
ON sales.EmployeeID = employees.EmployeeID
GROUP BY employees.FirstName, employees.LastName
ORDER BY Total DESC LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT c.Name AS 'Category', d.Name AS 'Department'
FROM categories AS c
JOIN departments AS d
ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) AS 'Products Sold', (SUM(sales.Quantity) * products.Price) AS 'Total Price'
FROM products
JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name LIKE 'Eagles: Hotel California'
GROUP BY products.Name, products.Price;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
JOIN reviews 
ON products.ProductID = reviews.ProductID
WHERE products.ProductID = 857
ORDER BY reviews.Rating LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */
SELECT e.EmployeeID AS 'Employee ID', e.FirstName AS 'First Name', e.LastName AS 'Last Name', p.Name, SUM(s.Quantity)
FROM sales as s
JOIN employees as e
ON e.EmployeeID = s.EmployeeID
JOIN products as p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;
