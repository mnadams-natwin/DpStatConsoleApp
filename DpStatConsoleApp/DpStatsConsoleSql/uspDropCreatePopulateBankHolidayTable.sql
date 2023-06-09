USE [DPStatService]
GO
/****** Object:  StoredProcedure [dbo].[uspDropCreatePopulateBankHolidayTable]    Script Date: 28/11/2022 18:56:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[uspDropCreatePopulateBankHolidayTable]
AS
BEGIN

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BankHolidays]') AND type in (N'U'))
DROP TABLE [dbo].[BankHolidays]

CREATE TABLE BankHolidays (
  HolidayDate date NOT NULL PRIMARY KEY
, HolidayDescription varchar(255) NULL
, HolidayISORegions varchar(125) NULL
); 


declare @Year int = YEAR(GETDATE()); --Set year value for the bank holidays in the current year
declare @Counter int = 3; -- Counter = n for loop to set the values for n years.
WHILE (@Counter > 0)
BEGIN		
		INSERT INTO BankHolidays (HolidayDate, HolidayDescription, HolidayISORegions)
		(
			Select dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/01/01')) [HolidayDate], 'New Years Day Bank Holiday' [HolidayDescription], 'GB-ENG, GB-WLS, GB-NI, GB-SCT' [HolidayISORegions]
			Union
			Select dbo.fn_GoodFridayByYear(@Year), 'Good Friday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.fn_EasterMondayByYear(@Year), 'Easter Monday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.fn_MayBankHolidayByYear(@Year), 'May Bank Holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.fn_SpringBankHolidayByYear(@Year), 'Spring Bank Holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.fn_SummerBankHolidayByYear(@Year), 'Summer Bank Holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/12/25')), 'Christmas Day Bank Holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.[fn_BankHoliday](DateAdd(day, 1,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/12/25')))), 'Boxing Day Bank Holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			--Scotland
			Union
			Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/11/30')))), 'St Andrew''s Day (Scotland)', 'GB-SCT'
			--N. Ireland
			Union
			Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/03/17')))), 'St Patrick''s Day (N. Ireland)', ' GB-NI'
			Union
			Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/07/12')))), 'Battle of the Boyne (Orangemen''s Day) (N. Ireland)', 'GB-NI'
		);	




		if (@Year = 2022)
		BEGIN
		--Special date for (Spring Bank holiday date 2022) due to 'Platinum Jubilee bank holiday' and Christmas day on a weekend
		DELETE FROM BankHolidays WHERE YEAR(HolidayDate) = @Year AND HolidayDescription LIKE '%Spring%';

		INSERT INTO BankHolidays (HolidayDate, HolidayDescription, HolidayISORegions)
		(

			Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/06/03')))), 'Platinum Jubilee bank holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union 
			Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/06/02')))), 'Spring Bank Holiday', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'
			Union
			Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/09/19')))), 'Bank Holiday for the State Funeral of Queen Elizabeth II', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'

	
		);
		END

		IF (@year = 2023)
		BEGIN
		--Set the year value for the bank holidays of next year
			INSERT INTO BankHolidays (HolidayDate, HolidayDescription, HolidayISORegions)
			(

				Select dbo.[fn_BankHoliday](DateAdd(day, 0,dbo.[fn_BankHoliday](DateAdd(year, @year - 1900,'1900/05/08')))), 'Bank holiday for the coronation of King Charles III', 'GB-ENG, GB-WLS, GB-NI, GB-SCT'

			);
		END

		SET @Year  = @Year + 1; --Set the year value for the bank holidays of next year
		SET @Counter = @Counter - 1;
END--While loop end

PRINT 'Note: Verify the dates in the Bank Holiday data table'
SELECT * FROM [dbo].[BankHolidays];	

END