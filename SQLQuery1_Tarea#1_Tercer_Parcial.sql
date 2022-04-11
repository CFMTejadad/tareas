

USE Northwind
GO


/*VISTAS*/
/*EJERCICIOS#1*/
/*Cree una vista que muestre todos los empleados (employees) que reportan (ReportsTo) a un jefe.*/
CREATE VIEW Todos_Empleados as 
   SELECT * FROM Employees where ReportsTo  > 0

 SELECT * FROM Todos_Empleados


 /*EJERCICIO#2*/
/*Crear una vista que muestre el ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, 
UnitsOnOrder, ReorderLevel, Discontinued de la tabla Supplier, products and Categories.*/
CREATE VIEW General as
 SELECT ProductID, CompanyName, ProductName, CategoryName, [Description], QuantityPerUnit, UnitPrice, UnitsInStock, 
UnitsOnOrder, ReorderLevel, Discontinued FROM Products Products, Customers, Categories  
SELECT * FROM General 



/*EJERCICIO#3*/
/*Cree una vista que muestre el CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate,
ShippedDate de la table Customer y Orders*/
CREATE VIEW Clientes as
SELECT c.CustomerID, CompanyName, ContactName, ContactTitle, [Address], City, Country, Phone, OrderDate, RequiredDate,
ShippedDate FROM Customers c
inner join Orders as o on o.CustomerID = c.CustomerID

SELECT * FROM Clientes

/*EJERCICIO#4*/
/*Modifique la vista del item 3 y remueva el campo Campo ContactTitle*/

?AlTER? ?VIEW ? Clientes ?as 
 Select? ??c.CustomerID?,  CompanyName, ?ContactName?, [Address], ??City?, ??Country?, ?Phone?, ??OrderDate?, ?RequiredDate?, 
?ShippedDate? ?From? Customers ?as? C 
inner join? Orders ?as? O ?on? ?C?.?CustomerID? ?=? ?O?.?CustomerID?
SELECT * FROM Clientes
 ?

 /*EJERCICIO#5*/
 /*Elimine la vista del item 3*/

 DROP VIEW Clientes

 /*PROCESOS*/
 /*EJERCICIO#1*/
 /*Cree un procedimiento almacenado que muestre todas las ordenes (Orders) realizadas por un empleado en un determinado año.*/
 CREATE PROCEDURE OrdersAnio @anio char(20) as
 SELECT * FROM Orders as o inner join Employees as e
 on o.EmployeeID = e.EmployeeID
 where OrderDate = @anio

 EXECUTE OrdersAnio @anio = '1998'
 

 /*EJERCICIO#2*/
 /*Realice un procedimiento almacenado que muestre los clientes que pertencen a determinada ciudad.*/

 CREATE PROCEDURE  ClientesCiudad @City char(20) as
 SELECT * FROM Customers where City = @City 

 EXECUTE ClientesCiudad @City = 'Madrid'

 
 /*EJERCICIO#3*/
 /*Construya un procedimiento almacenado que filter los empleados que cumpleaños cada mes utilizando el BirthDate.*/
 CREATE PROCEDURE EmpleadosCumple @Cumple char(20) as
 SELECT * FROM Employees where BirthDate = @Cumple

 EXECUTE   EmpleadosCumple @Cumple = '1966-01-27'

 /*EJERCICIO#4*/
 /*Obtener todas las ordenes generadas en una fecha determinada*/

 CREATE PROCEDURE Fechas @buscar char(20) as
 SELECT * FROM Orders where OrderDate = @buscar

 EXECUTE  Fechas @buscar = '1997-08-28'


 /*EJERCICIO#5*/
 /*Realizar un procedimiento almacenado que actualize el telefono de un determinado cliente.*/
 
 CREATE PROCEDURE ActualizaCel @numero char(20), @cliente char(20) as
UPDATE Customers SET Phone = @numero where CustomerID = @cliente

EXECUTE ActualizaCel @numero = '(504) 32707836', @cliente = 'ANATR'

 SELECT * FROM Customers


