-- Query 1: UPDATE with arithmetic and WHERE clause
UPDATE employee_salary 
SET salary = salary * 1.1 
WHERE perf_score > 3;

-- Query 2: MERGE statement
MERGE INTO product_dim target
USING product_stg source
ON target.prod_id = source.prod_id
WHEN MATCHED THEN
  UPDATE SET target.update_ts = CURRENT_TIMESTAMP
WHEN NOT MATCHED THEN
  INSERT (prod_id, prod_name, created_at)
  VALUES (source.prod_id, source.prod_name, CURRENT_TIMESTAMP);
