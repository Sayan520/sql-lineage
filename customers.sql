-- INSERT
INSERT INTO Customers (CustomerID, FirstName, LastName, Email)
VALUES 
(1, 'John', 'Doe', 'john@example.com'),
(2, 'Alice', 'Smith', 'alice@example.com');

-- UPDATE
UPDATE Customers
SET Email = 'john_updated@example.com'
WHERE CustomerID = 1;

-- MERGE (UPSERT)
MERGE Customers AS Target
USING (VALUES
    (1, 'John', 'Doe', 'john_merge@example.com'),
    (3, 'Ravi', 'Kumar', 'ravi@example.com')
) AS Source (CustomerID, FirstName, LastName, Email)
ON Target.CustomerID = Source.CustomerID
WHEN MATCHED THEN
    UPDATE SET Email = Source.Email
WHEN NOT MATCHED THEN
    INSERT (CustomerID, FirstName, LastName, Email)
    VALUES (Source.CustomerID, Source.FirstName, Source.LastName, Source.Email);