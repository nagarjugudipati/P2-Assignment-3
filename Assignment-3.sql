create database ExerciseDb1
use ExerciseDb1

--Assignment-03
--Part-01
create table CompanyInfo
(CId int primary key,
CName nvarchar(50) not null)
insert into CompanyInfo(CId,CName) values
(1,'Samsung'),
(2,'HP'),
(3,'Apple'),
(4,'Dell'),
(5,'Toshiba'),
(6,'Redmi')
select * from CompanyInfo

create table productInfo
(PId int primary key ,
PName nvarchar(50) not null,
PPrice float,
PMDate date,
CId int,
foreign key (CId) references CompanyInfo (CId))

insert into productInfo(PId,PName,PPrice,PMDate,CId) values
(101,'Laptop',55000.90,'12/12/2023',1),
(102,'Laptop',35000.90,'12/12/2012',2),
(103,'Mobile',15000.90,'12/03/2012',2),
(104,'Laptop',135000.90,'12/12/2012',3),
(105,'Mobile',65000.90,'12/12/2012',3),
(106,'Laptop',35000.90,'12/12/2012',5),
(107,'Mobile',35000.90,'12/01/2012',5),
(108,'Earpod',1000.90,'12/01/2022',3),
(109,'Laptop',85000.90,'12/12/2021',6),
(110,'Mobile',55000.70,'12/12/2020',1)

select * from productInfo

select p.*,c.CName
from productInfo p join CompanyInfo c
on p.CId=c.CId

select p.PName,c.CName
from productInfo p join CompanyInfo c
on p.CId=c.CId

select p.*,c.CName
from productInfo p join CompanyInfo c
on p.CId=c.CId 
order by p.CId


--Assignment-03
--part-02

CREATE TABLE Products (
    PId INT PRIMARY KEY,
    PQ INT,
    PPrice DECIMAL(10, 2),
    Discount DECIMAL(5, 2)
);

INSERT INTO Products (PId, PQ, PPrice, Discount) VALUES
(4, 8, 1000.00, 10.00),
(5, 1, 550.00, 5.00),
(6, 6, 280.00, 15.00);

CREATE FUNCTION DiscountedValue
(@price DECIMAL(10, 2), @discount DECIMAL(5, 2))
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @discountedValue DECIMAL(10, 2);
    SET @discountedValue = @price - (@price * @discount / 100);
    RETURN @discountedValue;
END;

SELECT PId, PPrice, Discount, dbo.DiscountedValue(PPrice, Discount) AS PriceafterDiscount
FROM Products;