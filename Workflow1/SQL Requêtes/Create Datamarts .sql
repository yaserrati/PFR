USE PFR_Data;

-- Vue pour les Ventes
CREATE VIEW [Sales_Datamart] AS
SELECT
    fs.Id_Sale,
    c.Customer_Segment,
    p.Product,
    p.Category,
    p.Subcategory,
    fs.Quantity,
    fs.Price,
    ds.Shipping_Method,
    ds.Shipper,
    fs.Weight,
    fs.Tax_5_percent,
    fs.Shipping_Costs,
    dd.Date_
FROM
    Fact_Sales fs
JOIN
    Dim_Customer c ON fs.Id_Customer = c.Id_Customer
JOIN
    Dim_Product p ON fs.Id_Product = p.Id_Product
JOIN
    Dim_Shipping ds ON fs.Id_Shipping = ds.Id_Shipping
JOIN
    Dim_Date dd ON fs.Id_Date_Order = dd.Id_Date;




-- Vue pour l'Inventaire
CREATE VIEW [Inventory_Datamart] AS
SELECT
    fi.Inventory_id,
    ds.Supplier_Name,
    ds.Location_Supplier,
    ds.Supplier_Phone,
    ds.Quality_Score,
    dw.Warhouse_Name,
    dw.Location_warehouse,
    dp.Product,
    dp.Category,
    dp.Subcategory,
    fi.StockLevel,
    fi.Restock_Threshold,
    dd.Date_
FROM
    Fact_Inventory fi
JOIN
    Dim_Supplier ds ON fi.Id_Supplier = ds.Id_Supplier
JOIN
    Dim_Warehouse dw ON fi.Id_Warehouse = dw.Id_Warehouse
JOIN
    Dim_Product dp ON fi.Id_Product = dp.Id_Product
JOIN
    Dim_Date dd ON fi.Id_Restock_Date = dd.Id_Date;

