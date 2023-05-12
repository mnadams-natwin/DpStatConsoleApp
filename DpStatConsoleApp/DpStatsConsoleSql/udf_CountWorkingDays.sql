 use DpStatService

-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,Michael Adams>
-- Create date: <Create Date,23/08/2021>
-- Description:	<Description, This function counts the (working day). Excludes regional bank holidays from the difference of the start date and the end date>
--			     The pre-requisite for this is the data table [dbo].[BankHolidays] which is set up by the stored procedure [uspDropCreatePopulateBankHolidayTable]
-- =============================================
ALTER FUNCTION [dbo].[udf_CountWorkingDays]
(
   @StartDate DATETIME,
   @EndDate DATETIME,
   @ISORegion varchar(12)
)
RETURNS INT 
AS
BEGIN
DECLARE @WorkingDaysCount INT;

 SET @WorkingDaysCount =(SELECT
   DATEDIFF(dd, @StartDate, @EndDate)
  -(DATEDIFF(wk, @StartDate, @EndDate) * 2)
  -(CASE WHEN DATENAME(dw, @StartDate) = 'Sunday' THEN 1 ELSE 0 END)
  -(CASE WHEN DATENAME(dw, @EndDate) = 'Saturday' THEN 1 ELSE 0 END))
  -(SELECT   COUNT(*) 
	FROM    dbo.BankHolidays h
	WHERE   (h.HolidayDate BETWEEN @StartDate AND @EndDate) AND h.HolidayISORegions LIKE '%'+@ISORegion+'%'); 

	-- Return the non negative result of the function

	IF(@WorkingDaysCount < 0)
	   SET @WorkingDaysCount = 0 

	RETURN @WorkingDaysCount

END
GO

