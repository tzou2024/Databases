SELECT * FROM BRANCH;
SELECT * FROM OWNER;
SELECT * FROM PROPERTY;
SELECT * FROM RENTER;
SELECT * FROM STAFF;
SELECT * FROM VIEWING;

-- 1. Find the name of each staff member who is also a renter and an owner. (Assume that having the same name means you’re the same person — not very realistic in real life.)
SELECT FName || ' ' || LName as Name from OWNER INTERSECT
SELECT FName || ' ' || LName as Name from Renter INTERSECT
SELECT FName || ' ' || LName as Name from STAFF;

-- 2. List the names of all staff members living in Cork but working in Dublin.
SELECT STAFF.FName, STAFF.LName FROM STAFF JOIN BRANCH ON Branch.BranchNo = STAFF.BranchNo WHERE STAFF.TelNo LIKE '021%' AND BRANCH.City = 'DUBLIN';

-- 3. Find the names and telephone number of any renters living in the same property (different names
-- at same address).
SELECT FName, LName, TelNo FROM RENTER GROUP BY Address HAVING COUNT(Address) > 1;
-- -- 4. Find the telephone number of any renter who used the word “damp” when viewing property ’PA3’.
SELECT RENTER.TelNo FROM RENTER JOIN VIEWING ON RENTER.RenterNo = VIEWING.RenterNo WHERE ' ' || VIEWING.Comment || ' ' COLLATE UTF8_GENERAL_CI LIKE '% damp %';
-- -- 5. Find the telephone number of any renter who used the word “damp” when viewing any property
-- -- in Cork.
SELECT RENTER.TelNo FROM RENTER JOIN VIEWING ON RENTER.RenterNo = VIEWING.RenterNo JOIN PROPERTY ON VIEWING.PropertyNo = PROPERTY.PropertyNo WHERE ' ' || VIEWING.Comment || ' ' COLLATE UTF8_GENERAL_CI LIKE '% damp %' AND PROPERTY.City = 'Cork';
-- -- 6. Find the names of all owners who own more than one property.
SELECT FName, LName FROM Owner WHERE OwnerNo IN (SELECT OwnerNo FROM PROPERTY GROUP BY OwnerNo HAVING COUNT(OwnerNo) > 1);
