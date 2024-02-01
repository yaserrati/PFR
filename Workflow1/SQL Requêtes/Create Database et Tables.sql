drop table Dim_Warehouse_Location
drop table Dim_Inventory
drop table Dim_Customer
drop table Dim_Customer_Age
drop table Dim_Customer_Segment
drop table Dim_Date_Sale
drop table Dim_Gender
drop table Dim_Last_Restock_Date
drop table Dim_Location
drop table Dim_Payment
drop table Dim_Rating
drop table Dim_Shipping_Method
drop table Fact_Sales
drop table sysdiagrams
drop table Dim_Product
drop table Dim_Category
drop table Dim_Location_Supplier
drop table Dim_Supplier
drop table Dim_Subcategory

ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Sale_Date];

ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Payement]


ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Customer]


ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Rating];


ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Shipping];

ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Sale_Date];

ALTER TABLE [Dim_Customer]
DROP CONSTRAINT [FK_Dim_Customer.Id_Gender];

ALTER TABLE [Dim_Customer]
DROP CONSTRAINT [FK_Dim_Customer.Id_Customer_Segmznt]


ALTER TABLE [Dim_Customer]
DROP CONSTRAINT [FK_Dim_Customer.Id_Age]

ALTER TABLE [Dim_Customer]
DROP CONSTRAINT [FK_Dim_Customer.Id_Location]

ALTER TABLE [Dim_Supplier]
DROP CONSTRAINT [FK_Dim_Supplier.Id_Location_Supplier]

ALTER TABLE [Dim_Subcategory]
DROP CONSTRAINT [FK_Dim_Subcategory.Id_Category]


ALTER TABLE [Dim_Product]
DROP CONSTRAINT [FK_Dim_Product.Id_Supplier]

ALTER TABLE [Dim_Product]
DROP CONSTRAINT [FK_Dim_Product.Id_Subcategory]


ALTER TABLE [Dim_Inventory]
DROP CONSTRAINT [FK_Dim_Inventory.Id_Warehouse_Location]

ALTER TABLE [Dim_Inventory]
DROP CONSTRAINT [FK_Dim_Inventory.Id_Restock_Date]





CREATE TABLE [Dim_Location] (
  [Id_Location] INT IDENTITY(1,1),
  [Location] VARCHAR(155),
  PRIMARY KEY ([Id_Location])
);

CREATE TABLE [Dim_Customer_Segment] (
  [Id_Customer_Segment] INT IDENTITY(1,1),
  [Customer_Segment] VARCHAR(55),
  PRIMARY KEY ([Id_Customer_Segment])
);

CREATE TABLE [Dim_Gender] (
  [Id_Gender] INT IDENTITY(1,1),
  [Gender] VARCHAR(55),
  PRIMARY KEY ([Id_Gender])
);

CREATE TABLE [Dim_Date_Sale] (
  [Id_Sale_Date] INT IDENTITY(1,1),
  [Date_Order] DATE,
  PRIMARY KEY ([Id_Sale_Date])
);

CREATE TABLE [Dim_Last_Restock_Date] (
  [Id_Restock_Date] INT IDENTITY(1,1),
  [Last_Restock_Date] DATE,
  PRIMARY KEY ([Id_Restock_Date])
);

CREATE TABLE [Dim_Customer_Age] (
  [Id_Age] INT IDENTITY(1,1),
  [Age] INT,
  PRIMARY KEY ([Id_Age])
);

CREATE TABLE [Dim_Customer] (
  [Id_Customer] INT IDENTITY(1,1),
  [Id_Age] INT,
  [Id_Gender] INT,
  [Id_Location] INT,
  [Id_Customer_Segment] INT,
  [Customer_Name] VARCHAR(55),
  [Email] VARCHAR(155),
  [Phone] VARCHAR(155),
  [Adresse] VARCHAR(255),
  PRIMARY KEY ([Id_Customer]),
  CONSTRAINT [FK_Dim_Customer.Id_Gender]
    FOREIGN KEY ([Id_Gender])
      REFERENCES [Dim_Gender]([Id_Gender]),
  CONSTRAINT [FK_Dim_Customer.Id_Customer_Segment]
    FOREIGN KEY ([Id_Customer_Segment])
      REFERENCES [Dim_Customer_Segment]([Id_Customer_Segment]),
  CONSTRAINT [FK_Dim_Customer.Id_Age]
    FOREIGN KEY ([Id_Age])
      REFERENCES [Dim_Customer_Age]([Id_Age]),
  CONSTRAINT [FK_Dim_Customer.Id_Location]
    FOREIGN KEY ([Id_Location])
      REFERENCES [Dim_Location]([Id_Location])
);

CREATE TABLE [Dim_Category] (
  [Id_Category] INT IDENTITY(1,1),
  [Category] VARCHAR(155),
  PRIMARY KEY ([Id_Category])
);

CREATE INDEX [IX_Category] ON [Dim_Category] ([Category]);

CREATE TABLE [Dim_Warehouse_Location] (
  [Id_Warehouse_Location] INT IDENTITY(1,1),
  [Location_Warehouse] VARCHAR(55),
  PRIMARY KEY ([Id_Warehouse_Location])
);

CREATE TABLE [Dim_Location_Supplier] (
  [Id_Location_Supplier] INT IDENTITY(1,1),
  [Location_Supplier] VARCHAR(155),
  PRIMARY KEY ([Id_Location_Supplier])
);

CREATE TABLE [Dim_Supplier] (
  [Id_Supplier] INT IDENTITY(1,1),
  [Id_Location_Supplier] INT,
  [Supplier_Name] VARCHAR(55),
  [Supplier_Phone] VARCHAR(75),
  PRIMARY KEY ([Id_Supplier]),
  CONSTRAINT [FK_Dim_Supplier.Id_Location_Supplier]
    FOREIGN KEY ([Id_Location_Supplier])
      REFERENCES [Dim_Location_Supplier]([Id_Location_Supplier])
);

CREATE INDEX [IX_Supplier_Phone] ON [Dim_Supplier] ([Supplier_Phone]);

CREATE TABLE [Dim_Shipping_Method] (
  [Id_Shipping] INT IDENTITY(1,1),
  [Shipping_Method] VARCHAR(55),
  [Shipper] VARCHAR(55),
  PRIMARY KEY ([Id_Shipping])
);

CREATE TABLE [Dim_Subcategory] (
  [Id_Subcategory] INT IDENTITY(1,1),
  [Id_Category] INT,
  [Subcategory] VARCHAR(155),
  PRIMARY KEY ([Id_Subcategory]),
  CONSTRAINT [FK_Dim_Subcategory.Id_Category]
    FOREIGN KEY ([Id_Category])
      REFERENCES [Dim_Category]([Id_Category])
);

CREATE TABLE [Dim_Product] (
  [Id_Product] INT IDENTITY(1,1),
  [Id_Subcategory] INT,
  [Id_Supplier] INT,
  [Product] VARCHAR(155),
  PRIMARY KEY ([Id_Product]),
  CONSTRAINT [FK_Dim_Product.Id_Supplier]
    FOREIGN KEY ([Id_Supplier])
      REFERENCES [Dim_Supplier]([Id_Supplier]),
  CONSTRAINT [FK_Dim_Product.Id_Subcategory]
    FOREIGN KEY ([Id_Subcategory])
      REFERENCES [Dim_Subcategory]([Id_Subcategory])
);

CREATE TABLE [Dim_Payment] (
  [Id_Payment] INT IDENTITY(1,1),
  [Payment] VARCHAR(55),
  PRIMARY KEY ([Id_Payment])
);

CREATE INDEX [IX_Payment] ON [Dim_Payment] ([Payment]);

CREATE TABLE [Dim_Rating] (
  [Id_Rating] INT IDENTITY(1,1),
  [Rating] INT,
  PRIMARY KEY ([Id_Rating])
);

CREATE TABLE [Dim_Inventory] (
  [Id_Inventory] INT IDENTITY(1,1),
  [Id_Restock_Date] INT,
  [Id_Warehouse_Location] INT,
  [Id_Warehouse] INT,
  [Warehouse_Name] VARCHAR(55),
  [StockLevel] INT,
  [Restock_Threshold] INT,
  PRIMARY KEY ([Id_Inventory]),
  CONSTRAINT [FK_Dim_Inventory.Id_Warehouse_Location]
    FOREIGN KEY ([Id_Warehouse_Location])
      REFERENCES [Dim_Warehouse_Location]([Id_Warehouse_Location]),
  CONSTRAINT [FK_Dim_Inventory.Id_Restock_Date]
    FOREIGN KEY ([Id_Restock_Date])
      REFERENCES [Dim_Last_Restock_Date]([Id_Restock_Date])
);

CREATE TABLE [Fact_Sales] (
  [Id_Sale] INT IDENTITY(1,1),
  [Id_Customer] INT,
  [Id_Product] INT,
  [Id_Sale_Date] INT,
  [Id_Shipping] INT,
  [Id_Payment] INT,
  [Id_Rating] INT,
  [Id_Inventory] INT,
  [Shipping_Costs] FLOAT,
  [Price] INT,
  [Quantity] INT,
  [Weight] FLOAT,
  [Tax_5_percent] FLOAT,
  PRIMARY KEY ([Id_Sale]),
  CONSTRAINT [FK_Fact_Sales.Id_Customer]
    FOREIGN KEY ([Id_Customer])
      REFERENCES [Dim_Customer]([Id_Customer]),
  CONSTRAINT [FK_Fact_Sales.Id_Rating]
    FOREIGN KEY ([Id_Rating])
      REFERENCES [Dim_Rating]([Id_Rating]),
  CONSTRAINT [FK_Fact_Sales.Id_Shipping]
    FOREIGN KEY ([Id_Shipping])
      REFERENCES [Dim_Shipping_Method]([Id_Shipping]),
  CONSTRAINT [FK_Fact_Sales.Id_Product]
    FOREIGN KEY ([Id_Product])
      REFERENCES [Dim_Product]([Id_Product]),
  CONSTRAINT [FK_Fact_Sales.Id_Inventory]
    FOREIGN KEY ([Id_Inventory])
      REFERENCES [Dim_Inventory]([Id_Inventory]),
  CONSTRAINT [FK_Fact_Sales.Id_Sale_Date]
    FOREIGN KEY ([Id_Sale_Date])
      REFERENCES [Dim_Date_Sale]([Id_Sale_Date]),
  CONSTRAINT [FK_Fact_Sales.Id_Payment]
    FOREIGN KEY ([Id_Payment])
		  REFERENCES [Dim_Payment]([Id_Payment])
	);




SELECT TOP (1000) [Customer_Name]
      ,[Email]
      ,[Phone]
      ,[Adresse]
      ,[Age]
      ,[Gender]
      ,[Location]
      ,[Customer_Segment]
      ,[Category]
      ,[Subcategory]
      ,[Product]
      ,[Price]
      ,[Quantity]
      ,[Weight]
      ,[Date_Order]
      ,[Tax_5_percent]
      ,[Payement]
      ,[Shipper]
      ,[Shipping_Method]
      ,[Shipping_Costs]
      ,[Inventory_id]
      ,[StockLevel]
      ,[Restock_Threshold]
      ,[Last_Restock_Date]
      ,[Warehouse_Name]
      ,[Location_warehouse]
      ,[Supplier_Name]
      ,[Supplier_Phone]
      ,[Location_Supplier]
      ,[Quality_Score]
      ,[rating_customer]
  FROM [PFR_Data].[dbo].[stagingarea]










  SELECT * FROM Dim_Date

use PFR_Data


CREATE TABLE [Dim_Shipping] (
  [Id_Shipping] INT IDENTITY(1,1),
  [Shipping_Method] VARCHAR(55),
  [Shipper] VARCHAR(55),
  PRIMARY KEY ([Id_Shipping])
);
CREATE INDEX [IX_SHIPPING] ON  [Dim_Shipping] ([Shipping_Method], [Shipper]);

CREATE TABLE [Dim_Supplier] (
  [Id_Supplier] INT IDENTITY(1,1),
  [Location_Supplier] VARCHAR(55),
  [Supplier_Name] VARCHAR(55),
  [Supplier_Phone] VARCHAR(75),
  [Quality_Score] INT,
  PRIMARY KEY ([Id_Supplier])
);
CREATE INDEX [IX_SUPPLIER] ON  [Dim_Supplier] ([Supplier_Phone], [Quality_Score]);

CREATE TABLE [Dim_Date] (
  [Id_Date] INT IDENTITY(1,1),
  [Date_] DATE,
  PRIMARY KEY ([Id_Date])
);
CREATE INDEX [IX_DATE] ON  [Dim_Date] ([Date_]);

CREATE TABLE [Dim_Warehouse] (
  [Id_Warehouse] INT IDENTITY(1,1),
  [Warhouse_Name] VARCHAR(55),
  [Location_warehouse] VARCHAR(55),
  PRIMARY KEY ([Id_Warehouse])
);
CREATE INDEX [IX_WAREHOUSE] ON  [Dim_Warehouse] ([Location_warehouse]);

CREATE TABLE [Dim_Product] (
  [Id_Product] INT IDENTITY(1,1),
  [Product] VARCHAR(155),
  [Category] VARCHAR(155),
  [Subcategory] VARCHAR(155),
  PRIMARY KEY ([Id_Product])
);

CREATE TABLE [Dim_Customer] (
  [Id_Customer] INT IDENTITY(1,1),
  [Customer_Name] VARCHAR(555),
  [Age] INT,
  [Gender] VARCHAR(25),
  [Location] VARCHAR(255),
  [Customer_Segment] VARCHAR(55),
  [Email] VARCHAR(555),
  [Phone] VARCHAR(555),
  [Adresse] VARCHAR(555),
  [Payement] VARCHAR(25),
  PRIMARY KEY ([Id_Customer])
);
CREATE INDEX [IC_CUSTOMER] ON  [Dim_Customer] ([Email], [Phone], [Adresse]);

CREATE TABLE [Fact_Sales] (
  [Id_Sale] INT IDENTITY(1,1),
  [Id_Customer] INT,
  [Id_Date_Order] INT,
  [Id_Product] INT,
  [Id_Shipping] INT,
  [Price] INT,
  [Quantity] INT,
  [Weight] FLOAT,
  [Tax_5_percent] FLOAT,
  [Shipping_Costs] FLOAT,
  [Rating] INT,

  PRIMARY KEY ([Id_Sale]),
  CONSTRAINT [FK_Fact_Sales.Id_Customer]
    FOREIGN KEY ([Id_Customer])
      REFERENCES [Dim_Customer]([Id_Customer]),
  CONSTRAINT [FK_Fact_Sales.Id_Shipping]
    FOREIGN KEY ([Id_Shipping])
      REFERENCES [Dim_Shipping]([Id_Shipping]),
  CONSTRAINT [FK_Fact_Sales.Id_Product]
    FOREIGN KEY ([Id_Product])
      REFERENCES [Dim_Product]([Id_Product]),
  CONSTRAINT [FK_Fact_Sales.Id_Date_Order]
    FOREIGN KEY ([Id_Date_Order])
      REFERENCES [Dim_Date]([Id_Date]),
	);
CREATE INDEX [IX_SALES] ON  [Fact_Sales] ([Price], [Quantity], [Weight], [Tax_5_percent]);


CREATE TABLE [Fact_Inventory] (
  [Inventory_id] INT,
  [Id_Supplier] INT,
  [Id_Restock_Date] INT,
  [Id_Product] INT,
  [Id_Warehouse] INT,
  [StockLevel] INT,
  [Restock_Threshold] INT,
  PRIMARY KEY ([Inventory_id]),
  CONSTRAINT [FK_Fact_Inventory.Id_Supplier]
    FOREIGN KEY ([Id_Supplier])
      REFERENCES [Dim_Supplier]([Id_Supplier]),
  CONSTRAINT [FK_Fact_Inventory.Id_Warehouse]
    FOREIGN KEY ([Id_Warehouse])
      REFERENCES [Dim_Warehouse]([Id_Warehouse]),
  CONSTRAINT [FK_Fact_Inventory.Id_Restock_Date]
    FOREIGN KEY ([Id_Restock_Date])
      REFERENCES [Dim_Date]([Id_Date]),
  CONSTRAINT [FK_Fact_Inventory.Id_Product]
    FOREIGN KEY ([Id_Product])
      REFERENCES [Dim_Product]([Id_Product])
);
CREATE INDEX [IX_INVENTORY] ON  [Fact_Inventory] ([StockLevel], [Restock_Threshold]);


select * from Fact_Inventory


ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Date_Order];

ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Product]

ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Customer]

ALTER TABLE Fact_Sales
DROP CONSTRAINT [FK_Fact_Sales.Id_Shipping];

ALTER TABLE Fact_Inventory
DROP CONSTRAINT [FK_Fact_Inventory.Id_Restock_Date];

ALTER TABLE Fact_Inventory
DROP CONSTRAINT [FK_Fact_Inventory.Id_Product]

ALTER TABLE Fact_Inventory
DROP CONSTRAINT [FK_Fact_Inventory.Id_Supplier]

ALTER TABLE Fact_Inventory
DROP CONSTRAINT [FK_Fact_Inventory.Id_Warehouse];

use PFR_Data;

drop table Dim_Shipping , Dim_Sales;
drop table Dim_Customer, Dim_Product, Dim_Date ;
drop table Dim_Supplier , Dim_Warehouse, Fact_Inventory
drop table Fact_Sales

use PFR_Data

select * from Fact_Inventory

USE e_commerce
select * from SupplierDim

CREATE TABLE [Dim_Customer] (
  [Id_Customer] INT IDENTITY(1,1),
  [Customer_Name] VARCHAR(555),
  [Age] INT,
  PRIMARY KEY ([Id_Customer])
);
select * from Dim_Customer

insert into Dim_Customer values ('Yassine', 22)
insert into Dim_Customer values ('Hassane', 22)

use PFR_Data;

SELECT DISTINCT Id_Customer FROM Dim_Customer
ORDER BY Id_Customer ASC;

Select * from Dim_Product

Select * from Dim_Date

select * from Fact_Sales

Select * from Fact_Inventory

SELECT COUNT(Id_Date) as num_date FROM Dim_Date
SELECT COUNT(Id_Sale) as num_sale FROM Fact_Sales

Delete Dim_Customer
Delete Dim_Date
Delete Dim_Product
Delete Dim_Supplier
Delete Dim_Warehouse
Delete Fact_Sales
Delete Fact_Inventory
Delete Dim_Shipping	