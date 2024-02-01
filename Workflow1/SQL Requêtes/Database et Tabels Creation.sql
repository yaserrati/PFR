CREATE DATABASE PFR_Data;


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
