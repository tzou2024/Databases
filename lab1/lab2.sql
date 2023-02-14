-- Find the title of all staff positions paid more than 15,000. Eliminate duplicates from the result
SELECT DISTINCT Job from STAFF WHERE Salary > 15000;

-- Find all comments, and the dates of the comments, made during viewings of property PG28.
SELECT Date, Comment FROM VIEWING WHERE PropertyNo = 'PG28';

--  Find the identifier and name of staff members working for branch B7 as either manager or deputy.
SELECT StaffNo, FName, LName FROM STAFF WHERE BranchNo = 'B7' AND Job IN ('manager', 'deputy');

-- Find the identifier and address of properties available through branch B3 that are either apartments with more than 3 rooms or houses.
SELECT PropertyNo, Street || ', ' || Area || ', ' || City AS Adress FROM PROPERTY WHERE BranchNo = 'B3' AND ((Type = 'apartment' and Rooms > 2) OR (Type = 'house'));

-- • Find the name of assistants, and the identifier of the branch they work at, who live in Cork and
-- earn less than 10,000. Sort the result alphabetically by surname.
SELECT Fname || ' ' || LName AS Name, BranchNo FROM STAFF WHERE Address LIKE '%Cork' And Salary < 10000 ORDER BY LName;


-- • Find the name, gender and position of any staff member living in Dublin who earns more than
-- 20,000.
SELECT Fname || ' ' || LName AS Name, Gender, Job FROM STAFF WHERE Address LIKE '%Dublin' AND Salary > 20000;

-- • List the name of all male employees, together with their position and salary. Use appropriate
-- headers.
SELECT Fname || ' ' || LName AS Name, Job, Salary FROM STAFF WHERE Gender = 'M';

-- • Find the address and rent of 3-roomed apartments handled by branch B2 costing 400–500.
SELECT Street || ', ' || Area || ', ' || City AS Adress, Rent FROM PROPERTY WHERE BranchNo = 'B2' and Rent > 400 and Rent < 500;