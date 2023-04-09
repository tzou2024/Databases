SELECT * FROM BRANCH;
SELECT * FROM OWNER;
SELECT * FROM PROPERTY;
SELECT * FROM RENTER;
SELECT * FROM STAFF;
SELECT * FROM VIEWING;

-- 1. Find the staff numbers of members of staff who handle no properties.
SELECT StaffNo FROM STAFF WHERE StaffNo NOT IN (SELECT StaffNo FROM PROPERTY);
-- 2. Find their telephone numbers.
SELECT TelNo FROM STAFF WHERE StaffNo NOT IN (SELECT StaffNo FROM PROPERTY);
-- 3. Find the renter numbers of all renters who have not viewed any properties.
SELECT RenterNo FROM RENTER WHERE RenterNo NOT IN (SELECT RenterNo FROM VIEWING);
-- 4. Find their telephone numbers.
SELECT TelNo FROM RENTER WHERE RenterNo NOT IN (SELECT RenterNo FROM VIEWING);
-- 5. Find the property numbers of all properties that have been viewed by at least one renter. (You
-- might use SELECT DISTINCT here.)

-- The fact that it is in viewing means that it has been viewing by at least one Renter
SELECT DISTINCT PropertyNo FROM VIEWING;

-- 6. Find the names of the staff members who handle properties that have been viewed by at least one
-- renter

SELECT FName, LName FROM STAFF WHERE StaffNo in (SELECT StaffNo FROM PROPERTY WHERE PropertyNo IN (SELECT DISTINCT PropertyNo FROM VIEWING));