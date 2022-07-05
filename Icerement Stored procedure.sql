USE YourCompany_DW
GO

CREATE OR ALTER PROC BI.IspFactSales
(
	@yearcount INT
)

AS
BEGIN

DECLARE 
	@DateID	 INT
SET
	@DateID = (
					SELECT 
						DateID
					FROM
						BI.DimDate
					WHERE
					GregorianDate = CONVERT(DATE, DATEADD(YEAR, @yearcount, GETDATE()))
					
				)

DELETE FROM BI.FactSales
WHERE DateID >= @DateID

MERGE INTO BI.DimPerson AS TARGET
USING [YourCompany].[BI].[vwDimPerson] AS SOURCE
ON	TARGET.PersonID = SOURCE.PersonID

WHEN MATCHED THEN UPDATE
	SET
	TARGET.[PersonID] = SOURCE.[PersonID],
	TARGET.[FirstName] = SOURCE.[FirstName],
	TARGET.[LastName] = SOURCE.[LastName],
	TARGET.[FullName] = SOURCE.[FullName],
	TARGET.[FatherName] = SOURCE.[FatherName],
	TARGET.[PersonType] = SOURCE.[PersonType],
	TARGET.[PersonSubType] = SOURCE.[PersonSubType],
	TARGET.[Nationality] = SOURCE.[Nationality],
	TARGET.[MarriageStatus] = SOURCE.[MarriageStatus],
	TARGET.[EducationDegree] = SOURCE.[EducationDegree],
	TARGET.[EducationField] = SOURCE.[EducationField],
	TARGET.[Sex] = SOURCE.[Sex],
	TARGET.[MilitaryStatus] = SOURCE.[MilitaryStatus],
	TARGET.[BirthDate] = SOURCE.[BirthDate],
	TARGET.[BirthLocation] = SOURCE.[BirthLocation],
	TARGET.[HireDate] = SOURCE.[HireDate],
	TARGET.[JobTitle] = SOURCE.[JobTitle],
	TARGET.[WorkSiteTitle]= SOURCE.[WorkSiteTitle],
	TARGET.[ContractTypeTitle]= SOURCE.[ContractTypeTitle],
	TARGET.[CostCenterTitle]= SOURCE.[CostCenterTitle],
	TARGET.[EmploymentTypeTitle]= SOURCE.[EmploymentTypeTitle],
	TARGET.[IsBroker]= SOURCE.[IsBroker],
	TARGET.[IsCustomer]= SOURCE.[IsCustomer],
	TARGET.[IsEmployee]= SOURCE.[IsEmployee],
	TARGET.[IsInBlacklist]= SOURCE.[IsInBlacklist],
	TARGET.[IsVendor]= SOURCE.[IsVendor]

WHEN NOT MATCHED BY TARGET 
THEN INSERT 
VALUES(SOURCE.[PersonID], SOURCE.[FirstName], SOURCE.[LastName], SOURCE.[FullName], SOURCE.[FatherName], SOURCE.[PersonType], SOURCE.[PersonSubType], SOURCE.[Nationality], SOURCE.[MarriageStatus], SOURCE.[EducationDegree], SOURCE.[EducationField], SOURCE.[Sex], SOURCE.[MilitaryStatus], SOURCE.[BirthDate], SOURCE.[BirthLocation], SOURCE.[HireDate], SOURCE.[JobTitle], SOURCE.[WorkSiteTitle], SOURCE.[ContractTypeTitle], SOURCE.[CostCenterTitle], SOURCE.[EmploymentTypeTitle], SOURCE.[IsBroker], SOURCE.[IsCustomer], SOURCE.[IsEmployee], SOURCE.[IsInBlacklist], SOURCE.[IsVendor])

WHEN NOT MATCHED BY SOURCE
THEN DELETE ; 


END 
