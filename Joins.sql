//Inner join

SELECT
  * 
FROM 
  dbo.Employee As Employee
INNER JOIN 
  dbo.city As City
ON
  Employee.CityID = City.ID 
  
  
//Inner Join with Group By and Having

SELECT 
  II.PartID AS Part ID,
  SUM(II.Price) AS Price Agg
 From 
  SLS.Invoice AS I 
INNER JOIN
  SLS.InvoiceItem AS II
ON 
  I.InvoiceID = II.InvoiceID 
WHERE
  YEAR(I.DATE ) = 2014
GROUP BY
  II.PartID
HAVING
  SUM(II.Price) < 1000
  
// 

