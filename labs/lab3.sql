SELECT * FROM BRANCH;
SELECT * FROM OWNER;
SELECT * FROM PROPERTY;
SELECT * FROM RENTER;
SELECT * FROM STAFF;
SELECT * FROM VIEWING;


-- 1. Find the names and addresses of all renters who have viewed properties.

SELECT Fname, LName, Address FROM RENTER WHERE RenterNo = 
    ( SELECT RenterNo FROM VIEWING );

-- 2. Find the type and number of rooms of each property handled by staff members who are managers.

SELECT Rooms, Type FROM PROPERTY WHERE StaffNo = 
(SELECT StaffNo FROM STAFF WHERE Job = 'manager');

-- 3. Find the full name of each person owning an apartment.
SELECT FName, LName from OWNER WHERE OwnerNo =
(SELECT OwnerNo FROM PROPERTY WHERE Type = 'apartment');

-- 4. Find the name and branch number of each staff member handling properties in Cork.
SELECT FName, LName, BranchNo FROM STAFF WHERE StaffNo = 
(SELECT StaffNo FROM PROPERTY WHERE City = 'Cork');

-- 5. Find the names of renters who have viewed properties with at least 3 rooms.
SELECT Fname, Lname FROM RENTER where RenterNo = 
(SELECT RenterNo FROM VIEWING WHERE PropertyNo = (SELECT PropertyNo FROM PROPERTY WHERE Rooms > 2));

-- 6. Find the names of staff members who handle properties owned by Woody Allen.
-- SELECT FName, LName from STAFF WHERE STAFFNO = 
SELECT Fname, LName FROM STAFF WHERE STAFFNo = 
(SELECT StaffNo FROM PROPERTY WHERE OwnerNo = 
(SELECT OwnerNo FROM OWNER WHERE FName = 'Woody' and LName = 'Allen'));