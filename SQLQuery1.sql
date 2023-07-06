-- Creating our Main Query of our Data Set

-- ORDER DATA
-- Order ID: Unique identifier for each order.
--Customer Name: Concatenation of the customer's first and last name.
--City: City where the customer resides.
--State: State where the customer resides.
--Order Date: Date when the product was ordered.
--Total Units: Number of bikes ordered in each order.
--Revenue: Amount of revenue generated per order. 

--PRODUCT DATA
--Product Name: Name of the product(s) ordered.
--Category: Category or brand of the bikes.
--Store: Store where the sale took place

--SALES REPRESENTATIVE DATA
--Sales Rep First Name: First name of the sales representative.
--Sales Rep Last Name: Last name of the sales representative.

--CLEANING AND FORMATTING REVIEW
--Review for redundant or unwanted fields
--Amend values that may impede analysis
--Ensure consistent formatting
--Validate data integrity
--Ensure unique and non-redundant values


SELECT
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name) AS 'customer',
	cus.city,
	cus.state,
	ord.order_date,
	SUM (ite.quantity) AS 'total_units',
	SUM(ite.quantity * ite.list_price) AS 'revenue',
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name) AS 'sales_rep',
	bra.brand_name
FROM sales.orders ord
JOIN sales.customers cus
ON ord.customer_id = cus.customer_id
JOIN sales.order_items ite
ON ord.order_id = ite.order_id
JOIN production.products pro
ON ite.product_id = pro.product_id
JOIN production.categories cat
ON pro.category_id = cat.category_id
JOIN sales.stores sto
ON ord.store_id = sto.store_id
JOIN sales.staffs sta
ON ord.staff_id = sta.staff_id
JOIN production.brands bra
ON pro.brand_id = bra.brand_id
GROUP BY 
	ord.order_id,
	CONCAT(cus.first_name, ' ', cus.last_name),
	cus.city,
	cus.state,
	ord.order_date,
	pro.product_name,
	cat.category_name,
	sto.store_name,
	CONCAT(sta.first_name,' ', sta.last_name),
	bra.brand_name

	--Created Excel workbook
	--Uploaded database server and inputted above query

