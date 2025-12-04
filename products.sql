-- INSERT
INSERT INTO Products (ProductID, ProductName, Price, Stock)
VALUES 
(10, 'Mouse', 500.00, 100),
(11, 'Keyboard', 700.00, 50);

-- UPDATE
UPDATE Products
SET Price = 550.00
WHERE ProductID = 10;

-- MERGE (UPSERT)
MERGE Products AS Target
USING (VALUES
    (10, 'Mouse', 600.00, 90),
    (12, 'Laptop Stand', 1500.00, 30)
) AS Source (ProductID, ProductName, Price, Stock)
ON Target.ProductID = Source.ProductID
WHEN MATCHED THEN
    UPDATE SET Price = Source.Price
WHEN NOT MATCHED THEN
    INSERT (ProductID, ProductName, Price, Stock)
    VALUES (Source.ProductID, Source.ProductName, Source.Price, Source.Stock);