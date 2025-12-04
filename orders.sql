-- INSERT
INSERT INTO Orders (OrderID, CustomerID, Status, Amount)
VALUES 
(101, 1, 'Pending', 1500.00),
(102, 2, 'Completed', 900.00);

-- UPDATE
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 101;

-- MERGE (UPSERT)
MERGE Orders AS Target
USING (VALUES
    (101, 1, 'Delivered', 1500.00),
    (103, 1, 'Pending', 1200.00)
) AS Source (OrderID, CustomerID, Status, Amount)
ON Target.OrderID = Source.OrderID
WHEN MATCHED THEN
    UPDATE SET Status = Source.Status
WHEN NOT MATCHED THEN
    INSERT (OrderID, CustomerID, Status, Amount)
    VALUES (Source.OrderID, Source.CustomerID, Source.Status, Source.Amount);