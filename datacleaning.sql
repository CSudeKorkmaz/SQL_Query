USE sudek;

SELECT BusinessEntityID, FirstName, LastName, EmailPromotion
FROM Person
WHERE EmailPromotion NOT IN (0,1);

UPDATE Person
SET EmailPromotion = 0
WHERE EmailPromotion NOT IN (0,1);

UPDATE Person
SET FirstName = UPPER(FirstName),
    LastName = UPPER(LastName);

SELECT EmailPromotion, COUNT(*) AS Count
FROM Person
GROUP BY EmailPromotion;
