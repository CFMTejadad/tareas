

use Northwind;
go


/*Ejercicio#1*/
/* Genere una consulta SQL de la tabla Employees a través de la cual se listen  los atributos FirstName(Primer Nombre), 
LastName (Apellido), HireDate (fecha contratación) de los empleados que tengan como título : Sales Representative y su país sea USA.
*/

SELECT * FROM Employees;

SELECT FirstName, LastName, HireDate, Title, Country FROM Employees Where Country = 'USA' and Title = 'Sales Representative';


/*Ejercicio#2*/
/*Cree una consulta SQL de la tabla Products listando los productos junto con  todas sus columnas donde el ProductName incluya la 
palabra Chocolate como parte de su nombre.
*/

SELECT * FROM Products;

SELECT * FROM Products  where ProductName like '%Chocolat%'


/*Ejercicio#3*/
/*Obtener todos los registros de la tabla Orders donde el ShipCountry sea Germany, France, Brazil y Venezuela. */

SELECT * FROM  Orders;

SELECT * FROM Orders where ShipCountry = 'Germany' or ShipCountry ='France' or ShipCountry ='Brazil' or ShipCountry ='Venezuela'


/*Ejercicio#4*/
/*Obtenga el número total de Customers y coloque el nombre TotalCustomers a la columna que contiene el resultado.*/

SELECT * FROM Customers;

SELECT count(CustomerID) as totalCustomers FROM Customers;


/*Ejercicio#5*/
/*Agrupe y liste los paises de la tabla Customers utilizando el campo Country.*/

SELECT * FROM Customers;
SELECT distinct Country FROM Customers 
group by Country 


/*Ejercicio#6*/
/*Construya una consulta donde se muestran los datos de las tablas Products y Suppliers renombrandolas como P y S , es necesario conocer
el ProductID, ProductName y CompanyName ordenando el resultado por el ProductID.
*/

SELECT * FROM Products
SELECT * FROM Suppliers
SELECT * FROM Customers;

SELECT  p.ProductID, p.ProductName, S.CompanyName  FROM Products as P 
inner join Suppliers as S on P.ProductID = S.SupplierID

order by ProductID


/*Ejercicio#7*/
/*Obtenga los registros de la tabla Products donde UnitsInStock sea menor a ReorderLevel, obteniendo el ProductName, UnitsInStock, ReorderLevel*/

SELECT * FROM Products

SELECT ProductName, UnitsInStock, ReorderLevel FROM Products where UnitsInStock < ReorderLevel


/*Ejercicio#8*/
/*Obtenga todos los registros de la tabla Products donde la suma de UnitsInStock + UnitsOnOrder sea menor o igual a ReorderLevel y
el producto no esté descontinuado es necesario mostrar ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued.*/

SELECT * FROM Products

SELECT ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued FROM Products as p
where (UnitsInStock + UnitsOnOrder) <= ReorderLevel and (Discontinued = 0)


/*Ejercicio#9*/
/*Muestre la lista de productos de la tabla Products donde UnitPrice esté entre entre 15.00 y 25.00*/

SELECT * FROM Products where UnitPrice BETWEEN 15.00 and 25.00;
SELECT * FROM Products where UnitPrice > 15 and UnitPrice < 25


/*Ejercicio#10*/
/*Liste todos los Suppliers donde en número de fax es null*/

SELECT * FROM Suppliers

SELECT * FROM Suppliers where Fax is null


/*Ejercicio#11*/
/*Obtener el promedio de la tabla Orders  de los valores de la tabla Freight*/


SELECT * FROM Orders

SELECT AVG(Freight) as promedio FROM Orders

/*Ejercicio#12*/
/*Actualizar en la tabla Customer el ContactName del registro con id= ERNSH y Colocar su nombre*/

SELECT * FROM Customers;

UPDATE Customers SET ContactName = 'Carlos Francisco' where CustomerID = 'ERNSH';


/*Ejercicio#13*/
/*Eliminar de la tabla Customer el registro con id=91*/

SELECT * FROM Customers;

DELETE FROM Customers WHERE CustomerID = 'WOLZA';

 
 /*Ejercicio#14*/
 /*Visualizar el maximo y minimo precio de los productos */

 SELECT * FROM Products;

 SELECT MAX(UnitPrice) as Maximo, MIN(UnitPrice) as Minimo FROM Products;
