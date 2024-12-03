--select all data
select *
from dbo.car_prices
--delete the name of the day from the saledate column
UPDATE dbo.car_prices
SET saledate = SUBSTRING(saledate, 4, LEN(saledate))
FROM dbo.car_prices;

--review all data
select *
from dbo.car_prices

--replace column name
EXEC sp_rename 'dbo.car_prices.vin', 'Vehicle Identification Number', 'COLUMN';
EXEC sp_rename 'dbo.car_prices.Vehicle Identification Number', 'Vehicle_Id_NO', 'COLUMN';
EXEC sp_rename 'dbo.car_prices.trim', 'Car trim level', 'COLUMN';

--1* check the data type
--select the needed date only
SELECT LEFT(saledate, 12) AS ModifiedCode
from dbo.car_prices

--update the datset with the needed date only
UPDATE dbo.car_prices
SET saledate = LEFT(saledate, 12)
from dbo.car_prices

--review all data
select *
from dbo.car_prices

--convert the salesdate from varchar into datetime
UPDATE dbo.car_prices
SET saledate = TRY_PARSE(saledate AS DATETIME USING 'en-US')
from dbo.car_prices

UPDATE dbo.car_prices
SET saledate = TRY_PARSE(saledate AS DATE USING 'en-US')
from dbo.car_prices

--2* check null values and remove the Ineffective one
select *
from dbo.car_prices
where sellingprice is null

DELETE FROM dbo.car_prices
WHERE sellingprice IS NULL;

select *
from dbo.car_prices
where saledate is null

DELETE FROM dbo.car_prices
WHERE saledate IS NULL;

select *
from dbo.car_prices
WHERE interior IS NULL;

DELETE FROM dbo.car_prices
WHERE interior IS NULL;

select *
from dbo.car_prices
WHERE odometer IS NULL;

DELETE FROM dbo.car_prices
WHERE odometer IS NULL;

select *
from dbo.car_prices
WHERE condition IS NULL;

DELETE FROM dbo.car_prices
WHERE condition IS NULL;

select *
from dbo.car_prices
WHERE model IS NULL and make is null and body is null

DELETE FROM dbo.car_prices
WHERE model IS NULL and make is null and body is null;

select *
from dbo.car_prices
WHERE body IS null

DELETE FROM dbo.car_prices
WHERE body IS NULL;

SELECT DISTINCT Vehicle_Id_NO
FROM dbo.car_prices;

select *
from dbo.car_prices
WHERE transmission IS null

DELETE FROM dbo.car_prices
WHERE transmission IS NULL;

select *
from dbo.car_prices

--3* check Duplicates values and remove the Ineffective one

SELECT Vehicle_Id_NO, COUNT(*) as duplicate
FROM dbo.car_prices
GROUP BY Vehicle_Id_NO
HAVING COUNT(*) > 1;

