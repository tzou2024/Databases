-- CREATE TABLE BRANCH(
--     BranchNo TEXT primary key,
--     Street TEXT,
--     Area TEXT,
--     City TEXT,
--     TelNo TEXT
-- );

-- INSERT INTO BRANCH VALUES (
--     'B2',
--     'South Mall',
--     'city centre',
--     'Cork',
--     '021-123-4567'
-- );


-- CREATE TABLE STAFF(
--     StaffNo TEXT PRIMARY KEY,
--     FName TEXT ,
--     LName TEXT ,
--     Address TEXT ,
--     TelNo TEXT ,
--     Job TEXT,
--     Gender TEXT,
--     Salary INT,
--     BranchNo TEXT REFERENCES BRANCH(BranchNo)
-- );

-- INSERT INTO STAFF VALUES (
--     'SL33',
--     'Mary',
--     'Jones',
--     '10 New St, Ballincollig',
--     '021-765-4321',
--     'manager',
--     'F',
--     28000,
--     'B2'
-- );

-- CREATE TABLE OWNER (
--     OwnerNo TEXT PRIMARY KEY,
--     FName TEXT,
--     LName TEXT,
--     Address TEXT,
--     TelNo TEXT
-- );

-- INSERT INTO OWNER VALUES (
--     'CO46',
--     'Mary',
--     'McAleese',
--     '1 Main St, Dublin',
--     '01-222-333'
-- );

-- CREATE TABLE PROPERTY (
--     PropertyNo TEXT PRIMARY KEY,
--     Street TEXT,
--     Area TEXT,
--     City TEXT,
--     Type TEXT,
--     Rooms INT,
--     Rent INT,
--     OwnerNo TEXT REFERENCES OWNER(OwnerNo),
--     StaffNo TEXT REFERENCES STAFF(StaffNo),
--     BranchNo TEXT REFERENCES BRANCH(BranchNo),
--     CONSTRAINT chk_Type CHECK (Type IN ('house', 'apartment'))
-- );

-- INSERT INTO PROPERTY VALUES (
--     'PA14',
--     'Old St',
--     'Blackrock',
--     'Cork',
--     'apartment',
--     3,
--     450,
--     'CO46',
--     'SL33',
--     'B2'

-- );

-- CREATE TABLE RENTER (
--     RenterNo TEXT PRIMARY KEY,
--     Fname TEXT,
--     LName TEXT,
--     Address TEXT,
--     TelNo TEXT,
--     TypePreference TEXT,
--     MaxRent INT,
--     CONSTRAINT chk_TypePreference CHECK (TypePreference IN ('house', 'apartment'))
-- );

-- INSERT INTO RENTER VALUES(
--     'CR76',
--     'Mike',
--     'Donovan',
--     '8 Barrack St, Cork',
--     '021-333-444',
--     'house',
--     550
-- );

-- CREATE TABLE VIEWING (
--     RenterNo TEXT REFERENCES RENTER(RenterNo),
--     PropertyNo TEXT REFERENCES PROPERTY(PropertyNo),
--     Date DATE,
--     Comment TEXT
-- );

-- INSERT INTO VIEWING VALUES(
--     'CR76',
--     'PA14',
--     '10-04-2000',
--     'Damp on Walls'
-- );



-- SELECT * from BRANCH;
SELECT * FROM STAFF;
-- SELECT * FROM PROPERTY;
-- SELECT * FROM OWNER;
-- SELECT * FROM RENTER;
-- SELECT * FROM VIEWING;

-- //////////////////////////////////////
-- QUERIES
-- //////////////////////////////////////
-- 1. Find the name and address of staff members earning less than 20000.
SELECT Fname, Lname, Address FROM STAFF WHERE Salary < 20000;
-- 2. Find the name and address of male staff members earning less than 20000.
SELECT Fname, Lname, Address FROM STAFF WHERE Gender='M' and Salary < 20000;
-- 3. Find all information on female staff members who do not have a telephone number.
SELECT * FROM STAFF WHERE Gender='F' and TelNo IS NULL;
-- 4. Find the name and address of renters requesting an apartment for less than 500 (euros per month).
SELECT * FROM RENTER WHERE MaxRent < 500;
-- 5. Find the name and address of renters living in the Cork area (phone number starting 021) requesting an apartment for less than 500.
SELECT Fname || ' ' || LName as Name, Address FROM RENTER WHERE TelNo LIKE '021%' AND MaxRent < 500;
-- 6. Find the property number and address of apartments in Cork having more than 3 rooms and costing between 400 and 500.
SELECT * FROM PROPERTY;

SELECT PropertyNo, Street || ', ' || Area || ', ' || City AS Adress FROM PROPERTY WHERE Type = 'apartment' AND Rooms > 3 and Rent < 500 AND Rent > 400;
-- 7. Find the property number, address and rent of apartments handled by either branch B3 or B7. Sort the result by city and by area.
SELECT PropertyNo,Street || ', ' || Area || ', ' || City AS Adress, Rent FROM PROPERTY WHERE Type = 'apartment' AND (BranchNo = 'B3' OR BranchNo = 'B7') ORDER BY City, Area;
-- 8. Find all information on property owner Carol Farrell.
SELECT * FROM OWNER WHERE FName = 'Carol' AND LName = 'Farrell';