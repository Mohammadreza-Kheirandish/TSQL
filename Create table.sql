CREATE TABLE AS Sales.Invoice

(
  InvoiceID INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
  DATEID [DATETIME] REFERENCES CALANDER(DATEID) NOT NULL, /* Foreign key */
  PersonID INT REFERENCES Person(PersonID), 
  CurrencyID INT REFERENCES Currency(CurrencyID), 
  LocationID INT REFERENCES Location(LocationID),
  Number INT NOT NULL, 
  Price DECIMAL(19,4),
  Discount DECIMAL(19,4),
  Tax DECIMAL(19,4)
 )
 
 

