USE YourCompany
GO

CREATE VIEW BI.vwAccount_Me

AS

SELECT 

	SL.AccountID,
	PL.Code + GL.Code + SL.Code		AS		AccountCode,
	PL.Code		AS	PrimaryCode,
	GL.Code		AS	GeneralCode,
	SL.Code		AS	SubCode,
	Pl.Title	AS	PrimaryTitle,
	GL.Title	AS	GeneralTitle,
	SL.Title	AS	SubTitle
	
	
FROM
	ACC.Account AS SL
INNER JOIN
	ACC.Account AS GL
ON
	SL.ParentAccountID = GL.AccountID
INNER JOIN	
	ACC.Account AS PL
ON
	GL.ParentAccountID = PL.AccountID
WHERE
	SL.Type =3 
	AND GL.Type =2 
	AND PL.Type = 1

GO
