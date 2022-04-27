Use Northwind;

/*TRIGGER*/
/*EJERCICIO#1*/
/*Cree un trigeer que se active cuando se inserte o actualice un registro de la tabla territories recuerde tomar el registro actual desde la tabla
inserted y concatene al nombre del territorio(TerritoryDescription) el prefijo "_try" al final del mismo	*/


CREATE TRIGGER Actualizar_registro 
ON Territories
AFTER INSERT, UPDATE
AS 
BEGIN

    SELECT TerritoryID, CONCAT(TerritoryDescription, '_try' ) AS TerritoryDescription, RegionID FROM inserted
	PRINT ('El registro ha sido Actualizado')
END
INSERT INTO Territories(TerritoryID,TerritoryDescription,RegionID)
VALUES('9','JOSE',1)

/*EJERCICIO#2*/ 
/*Cree un trigger para la tabla CustomerCustomerDemo que se active cuando se inserte o actualice un registro y calcule el campo CustomerDesc
multiplicando el valor proveido en el insert *0.25 y sumando 150*/


/*	Ejercicio 3
Cree un trigger a la tabla CustomerDemographics que se active cuando un registro es eliminado y que muestre un mensaje que diga "Registro Eliminado" 
y muestre un select de la tabla deleted.*/

CREATE TRIGGER Eliminar_Registro
ON CustomerDemographics
AFTER DELETE
AS 
BEGIN
   SELECT * FROM deleted
	PRINT('El registro ha sido eliminado')
END

ALTER TABLE CustomerDemographics AlTER COLUMN CustomerDesc int

SELECT * FROM CustomerDemographics
INSERT INTO CustomerDemographics values('1','15')
INSERT INTO CustomerDemographics values('2','25')
INSERT INTO CustomerDemographics values('3','35')
INSERT INTO CustomerDemographics values('4','45')
DELETE FROM CustomerDemographics where CustomerTypeID = '3';


/*FUNCIONES*/

/*EJERCICIO#1*/
/*Construya una funcion que reciba como parametro el año de contratacion de un empleado(HireDate) de la tabla employees y devuelva una con todos
los registros asociados.*/
CREATE FUNCTION fn_Empleados(@fechas datetime)
RETURNS TABLE
AS RETURN(
SELECT * FROM Employees WHERE HireDate = @fechas)

SELECT * FROM dbo.Fn_Empleados('1992-08-14')

/*EJERECICIO#2*/
/*Cree una funcion que reciba como parametro el id de la tabla producto (products) y returne el precio(UnitPrice) aplicando el 10% de descuento*/
CREATE FUNCTION fn_Descuento(@id int)
RETURNS MONEY
AS
BEGIN
	DECLARE  @UnitPrice MONEY
	SELECT @UnitPrice= UnitPrice-(UnitPrice*0.10) FROM products WHERE ProductID= @id
	RETURN @UnitPrice 
END 

SELECT dbo.Fn_Descuento('5')

/*EJERCICIO#3*/
/*Cree una funcion que reciba como parametro el OrderId y muestre informacion de las orden(Order) y de su detalle(Order Details) Mostrando ProductName,
UnitPrice, Quantity, OrderDate,CustomersId */

CREATE FUNCTION fn_Informacion(@Id int)
RETURNS TABLE
AS RETURN(
SELECT ProductName, od.UnitPrice, Quantity, OrderDate, CustomerId FROM Orders  o
	inner join [Order Details] as od on o.OrderID = od.OrderID
	inner join Products as p on p.ProductID = od.ProductID
	where o.OrderID = @Id
)

SELECT * FROM dbo.fn_Informacion(10250)

/*EJERCICIO#4*/
/*Construya una funcion que reciba la fecha de nacimiento(BirthDate) de un Empleado(Employees) y retorne el nombre del mes en el que nacio el 
empleado considere el uso de la sentencia case	*/
CREATE FUNCTION fn_Fecha_Nac(@fechaN datetime)
RETURNS TABLE
AS 
RETURN(
SELECT BirthDate,
	CASE 
		when Month(BirthDate) = 1 then 'Enero'
		when Month(BirthDate) = 2 then 'Febrero'
		when Month(BirthDate) = 3 then 'Marzo'
		when Month(BirthDate) = 4 then 'Abril'
		when Month(BirthDate) = 5 then 'Mayo'
		when Month(BirthDate) = 6 then 'Junio'
		when Month(BirthDate) = 7 then 'Julio'
		when Month(BirthDate) = 8 then 'Agosto'
		when Month(BirthDate) = 9 then 'Septiembre'
		when Month(BirthDate) = 10 then 'Octubre'
		when Month(BirthDate) = 11 then 'Noviembre'
		when Month(BirthDate) = 11 then 'Diciembre'
		else 'NO EXISTE'
	END as Mes
	From Employees
	where BirthDate = @fechaN)


SELECT * FROM dbo.fn_Fecha_Nac('1937-09-19')


/*EJERCIO#5*/
/*Construya una función que reciba el código de un cliente y retorne todos los pedidos (Orders) ordenados por fecha	*/
CREATE FUNCTION fn_Cliente(@id char(5))
RETURNS TABLE 

AS RETURN(
SELECT * FROM Orders as o where CustomerID = @id )


SELECT * FROM dbo.fn_Cliente('SUPRD')
