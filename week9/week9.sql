use company;
DELIMITER $$
CREATE PROCEDURE SelectCustomerByCountry(IN c VARCHAR(45))
BEGIN
	SELECT * FROM customers
    where Country = c;
End $$
DELIMITER ;

set @country = "Spain";
Call SelectCustomerByCountry(@country);

DELIMITER $$
CREATE PROCEDURE GetOrderCountByShipper(IN shipper VARCHAR(45), OUT count INT)
BEGIN
	SELECT count(ORDERID) into count
    FROM orders
    join shippers on shippers.ShipperID = orders.ShipperID
    where shippers.ShipperName = shipper;
End $$
DELIMITER ;

set order_cnt = 0;
CALL GetOrderCountByShipper('United Package', @order_cnt);
Select @order_cnt;

DELIMITER $$
CREATE PROCEDURE GetCustomerSalesOut(IN inCustomerID INT, OUT outName VARCHAR(255),out outSales INT)
BEGIN
	SELECT CustomerName into outName
    FROM customers
    where customers.CustomerID = inCustomerID;

	select IFNULL(sum(p.Price * od.Quantity),0) into outSales
    from orders o
    join orderdetails od on o.OrderID = od.OrderID
    join products p on p.ProductID = od.ProductID
	where o.CustomerID = inCustomerID;
End $$
DELIMITER ;

set @namee = '';
set @sales = 0;
CALL GetCustomerSalesOut(5, @namee,@sales); 
Select @namee, @sales;
CALL GetCustomerSalesOut(1, @namee,@sales); 
Select @namee, @sales;