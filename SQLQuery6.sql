CREATE DATABASE BANGURU
GO

USE BANGURU

CREATE TABLE Branchs
(
BrachID VARCHAR(5) primary key,
[BranchName] NVARCHAR(50),
[Address] NVARCHAR(200),
[Picture] VARCHAR(200),
[UpdatedAt] DATETIME,
[DeletedAt] DATETIME,
[Phone] varchar(10),
[Status] INT 
)

GO
CREATE TABLE [Foods]
(
	FoodID VARCHAR(5) PRIMARY KEY,
	[FoodName] NVARCHAR(50),
	Picture VARCHAR(200),
	[description] NVARCHAR(500), 
	[Price]	DECIMAL,
	[UpdatedAt] DATETIME,
	[DeletedAt] DATETIME,
	[Status] INT
);

CREATE TABLE FoodBranch
(
	BrachID VARCHAR(5) FOREIGN KEY REFERENCES dbo.Branchs(BrachID),
	FoodID VARCHAR(5) FOREIGN KEY REFERENCES dbo.Foods(FoodID),
	PRIMARY KEY(BrachID,FoodID)
)
CREATE TABLE Category
(
	CategoryID VARCHAR(5) PRIMARY KEY,
	CategoryName NVARCHAR(50),
	Picture VARCHAR(200),
	[UpdatedAt] DATETIME,
	[DeletedAt] DATETIME,
	[Status] INT

)

CREATE TABLE FoodCategory
(
	FoodID VARCHAR(5) FOREIGN KEY REFERENCES dbo.Foods(FoodID), 
	CategoryId VARCHAR(5) FOREIGN KEY REFERENCES dbo.Category(CategoryID),
	PRIMARY KEY(FoodID,CategoryId)
)
CREATE TABLE [Customers]
(	
	[CustomerID] VARCHAR(5) PRIMARY KEY,
	[Name] NVARCHAR(30) ,
	[Phone] INT,
	[Email] NVARCHAR(30),
	[Address] NVARCHAR(30),
	[CreatedAt] DATETIME,
	[UpdatedAt] DATETIME,
	[Status] INT  
);

CREATE TABLE [Orders] (
	[OrderID] VARCHAR(5) PRIMARY KEY,
	[customerId] VARCHAR(5) FOREIGN KEY REFERENCES [Customers](CustomerID),
	[totalPrice] float,
	requiredDate DATETIME,
	shippedDate DATETIME,
	[createdAt] DATETIME,
	[updatedAt] DATETIME,
	[deletedAt] DATETIME,
	[status] INT 
);
CREATE TABLE [OrderDetail]
(
	OrderID	VARCHAR(5) FOREIGN KEY REFERENCES [Orders](OrderID),
	FoodID VARCHAR(5) FOREIGN KEY REFERENCES dbo.Foods(FoodID),
	[Quantity] INT,
	[unitPrice] FLOAT,
	PRIMARY KEY (orderId, FoodID)
);
INSERT INTO dbo.Branchs
        ( BrachID ,
          BranchName ,
          [Address] ,
          UpdatedAt ,
          DeletedAt ,
          Phone ,
          [Status]
        )
VALUES  ('BR01',N'1999 STORE',N'45 Nguyễn Bỉnh Khiêm','2018-01-10',Null,'0793245698',1),
		('BR02',N'1998 STORE',N'10 Tôn Thất Thuyết','2018-01-10',Null,'0793245678',1),
		('BR03',N'1997 STORE',N'11 Trương Định','2018-01-10',Null,'0793245123',1),
		('BR04',N'1996 STORE',N'11 Duy Tân','2018-01-10',Null,'0793241234',1),
		('BR05',N'1995 STORE',N'117 Láng Hạ','2018-01-10',Null,'0987651087',1)


INSERT INTO dbo.Foods
        ( FoodID ,
          FoodName ,
          Price ,
		  [description],
		  Picture,
		  UpdatedAt,
		  DeletedAt,
          [Status]
        )
VALUES  ('F01',N'Bò Cuốn Phô Mai',25000,'Không phomai không lấy tiền','img','2019-01-10',Null,1),
		('F02',N'Mì Hải Sản',20000,'Không hải sản không lấy tiền','img','2019-01-10',Null,1),
		('F03',N'Bánh Mì Nướng Muối Ớt',15000,'Ngon hết lấc','img','2019-01-10',Null,1),
		('F04',N'Lẩu Cua',450000,'Không Cua không lấy tiền','img','2019-01-10',Null,1),
		('F05',N'Lẩu Gà ',400000,'Ngon thôi rồi','img','2019-01-10',Null,1),
		('F06',N'Lườn Ngỗng',50000,'Thịt ngỗng chuẩn không cần chỉnh','img','2019-01-10',Null,1),
		('F07',N'Cơm Gà Tiêu Đen',45000,'Thơm ngất từ hạt tiêu đen','img','2019-01-10',Null,1),
		('F08',N'Bò sốt vang',150000,'Ngon như Tây làm','img','2019-01-10',Null,1),
		('F09',N'Gà Nướng Lu',150000,'Hấp dẫn khỏi phải nói','img','2019-01-10',Null,1),
		('F10',N'Phở Các Loại',45000,'Món ăn nổi tiếng của người Việt','img','2019-01-10',Null,1),
		('F11',N'Các Loại Nước Ngọt',15000,'Mát lạnh sảng khoái dài lâu','img','2019-01-10',Null,1)
INSERT INTO FoodBranch(
        BrachID,
		FoodID
)
VALUES
('BR01','F01'),
('BR01','F02'),
('BR01','F03'),
('BR01','F11'),
('BR01','F04'),
('BR01','F05'),
('BR01','F06'),
('BR02','F07'),
('BR02','F08'),
('BR02','F09'),
('BR02','F10'),
('BR02','F11'),
('BR02','F01'),
('BR02','F03'),
('BR03','F01'),
('BR03','F02'),
('BR03','F04'),
('BR03','F07'),
('BR03','F08'),
('BR03','F11'),
('BR03','F09'),
('BR03','F10'),
('BR03','F05'),
('BR04','F01'),
('BR04','F03'),
('BR04','F05'),
('BR04','F07'),
('BR04','F09'),
('BR04','F10'),
('BR04','F02'),
('BR04','F11'),
('BR05','F02'),
('BR05','F04'),
('BR05','F06'),
('BR05','F08'),
('BR05','F10'),
('BR05','F01'),
('BR05','F03'),
('BR05','F11')

INSERT INTO Category
(CategoryID,
CategoryName,
[Status]
)
VALUES  ('C01', N'Món ăn nhẹ', 1),
		('C02', N'Món ăn sáng', 1),
		('C03', N'Các món lẩu',1),
		('C04', N'Món chính',1),
		('C05', N'Nước ngọt', 1) 
GO
INSERT INTO Customers
(CustomerID,
Name,
Phone,
Status)
VALUES
       ('CU1',N'Nguyễn Thị Minh', 0329898124, 1 ),
	   ('CU2',N'Nguyễn Quang HẢI', 0329865123, 1 ),
	   ('CU3',N'Hoang Đức Thắng', 0329898127, 1 ),
	   ('CU4',N'Nguyễn Gia Long', 0329898472, 1 ),
	   ('CU5',N'Phan Hoài Nam', 0329898441, 1 ),
	   ('CU6',N'Phan Hồng Trường', 0329846472, 1 ),
	   ('CU7',N'Phạm Thị Bình', 0329898373, 1 ),
	   ('CU8',N'Lê Tất Đạt', 0329898472, 1 ),
	   ('CU9',N'Nguyễn Ngọc Anh', 0329898472, 1 ),
	   ('CU10',N'Trần Thanh Thư', 0329898472, 1 )
INSERT INTO Orders
        ( OrderID ,
          customerId ,
          createdAt ,
		  totalPrice ,
          [Status]
        )
VALUES('OR01','CU5','2018-10-10',55000,1),
('OR02','CU3','2018-10-10',470000,1),
('OR03','CU2','2018-10-10',45000,1),
('OR04','CU4','2018-10-10',875000,1),
('OR05','CU5','2018-10-10',20000,1),
('OR06','CU1','2018-10-10',25000,1),
('OR07','CU2','2018-10-10',250000,1),
('OR08','CU3','2018-10-10',450000,1),
('OR09','CU4','2018-10-10',40000,1),
('OR10','CU5','2018-10-10',15000,1)
INSERT INTO OrderDetail
        ( orderId ,
          foodId ,
          Quantity ,
          unitPrice
        )
VALUES ('OR01','F01',1, 25000),
	   ('OR01','F03',2, 15000),
	   ('OR02','F02',1, 20000),
	   ('OR02','F04',1,450000),
	   ('OR03','F07',4, 45000),
	   ('OR04','F05',2, 400000),
	   ('OR04','F11',5, 15000),
	   ('OR05','F06',3, 50000),
	   ('OR05','F11',3, 15000),
	   ('OR06','F09',10, 150000),
	   ('OR06','F10',10, 45000),
	   ('OR07','F06',5, 50000),
	   ('OR07','F08',20, 150000),
	   ('OR08','F03',4, 15000),
	   ('OR08','F07',4, 45000),
	   ('OR09','F02',3, 20000),
	   ('OR09','F09',6, 150000),
	   ('OR09','F10',9, 45000),
	   ('OR10','F04',5, 450000),
	   ('OR10','F05',3, 400000),
	   ('OR10','F11',2, 15000),
	   ('OR10','F08',20, 150)
INSERT INTO FoodCategory
(
CategoryId,
FoodID
)
VALUES('C01', 'F01'),
		('C01', 'F02'),
		('C01', 'F03'),
		('C01', 'F10'),
		('C01', 'F06'),
		('C02', 'F02'),
		('C02', 'F03'),
		('C02', 'F10'),
		('C03', 'F04'),
		('C03', 'F05'),
		('C04', 'F06'),
		('C04', 'F07'),
		('C04', 'F08'),	
		('C04', 'F09'),
		('C05', 'F11')
GO
CREATE INDEX indexNameFood 
ON dbo.Foods (FoodName,Price)

GO
SELECT * FROM dbo.Foods
WHERE Price BETWEEN 10000 AND 50000 AND FoodName LIKE '%a%'  

GO 

CREATE VIEW TodaySaleProduct
AS 
SELECT dbo.Foods.FoodName,dbo.OrderDetail.Quantity, SUM(dbo.OrderDetail.unitPrice) AS TongTien FROM dbo.Orders
JOIN dbo.OrderDetails
ON 0rderDetails.0rderId = Orders.orderId
JOIN dbo.Foods
ON Foods.foodId = orderDetails.foodId
WHERE dbo.Orders.createdAt = GETDATE()
GROUP BY dbo.Foods.FoodName, dbo.orderDetails.Quantity 

GO

SELECT * FROM TodaySaleProduct

GO

GO
CREATE PROC SalesRevenue (@date1 DATETIME, @date2 DATETIME)
AS
BEGIN
SELECT SUM(totalPrice) FROM dbo.Orders
WHERE createdAt BETWEEN @date1 AND @date2
END

GO










      
		