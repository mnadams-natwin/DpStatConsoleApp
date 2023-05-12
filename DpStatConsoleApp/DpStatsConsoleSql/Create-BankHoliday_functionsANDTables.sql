use DpStatService
--Stage 2 Create the BankHoliday functions: Bank hoilday functions are created before executing the setup procedure [uspDropCreatePopulateBankHolidayTable]
--NOTE: This setup file contains a cut and paste of individual sql files.The following code for each function are stored in separate files and stored in version control. $/Digital Platform/DpStatConsoleApp/DpStatConsoleApp/DpStatsConsoleSql
GO	


CREATE FUNCTION [dbo].[fn_BankHoliday]
(
    @date date
)
RETURNS smalldatetime
AS
BEGIN
 
    Declare @output datetime;
 
    With Dates as
    (
        Select @date [Date]
        Union all
        Select DATEADD(day,1,[Date])
        From Dates
        Where DATEADD(day,1,[Date]) < DATEADD(day,7,@date)
    )
     
    Select
        @output = MIN([Date])
    From Dates
    Where datepart(W,[Date]) in (2,3,4,5,6)
 
    Return @output
     
END

GO
 
/*Grabbed from http://www.mssqltips.com/sqlservertip/1537/tsql-function-to-determine-holidays-in-sql-server*/
CREATE FUNCTION [dbo].[fn_EasterSundayByYear] 
    (@Year char(4))
RETURNS smalldatetime 
AS
BEGIN

declare
@c int --Century
, @n int --
, @k int --
, @i int --
, @j int --
, @l int --
, @m int --
, @d int --
, @Easter datetime --
 
set @c = (@Year / 100) 
set @n = @Year - 19 * (@Year / 19) 
set @k = (@c - 17) / 25 
set @i = @c - @c / 4 - ( @c - @k) / 3 + 19 * @n + 15 
set @i = @i - 30 * ( @i / 30 ) 
set @i = @i - (@i / 28) * (1 - (@i / 28) * (29 / (@i + 1)) * ((21 - @n) / 11)) 
set @j = @Year + @Year / 4 + @i + 2 - @c + @c / 4 
set @j = @j - 7 * (@j / 7) 
set @l = @i - @j 
set @m = 3 + (@l + 40) / 44 
set @d = @l + 28 - 31 * ( @m / 4 ) 
 
set @Easter = (select right('0' + convert(varchar(2),@m),2) + '/' + right('0' + convert(varchar(2),@d),2) + '/' + convert(char(4),@Year)) 
 
return @Easter 
END
GO
 
CREATE FUNCTION [dbo].[fn_SummerBankHolidayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
 
    Declare @output datetime;
 
    With Dates as
    (
        Select DATEADD(year,@Year - 1900,'1900/08/01') [Date]
        Union all
        Select [Date] + 1
        From Dates
        Where [Date] + 1 < DATEADD(year,@Year - 1900,'1900/09/01')
    )
     
    Select
        @output = MAX([Date])
    From Dates
    Where datepart(W,[Date]) = 2
 
    Return @output
     
END
GO
 
CREATE FUNCTION [dbo].[fn_SpringBankHolidayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
 
    Declare @output datetime;
 
    With Dates as
    (
        Select DATEADD(year,@Year - 1900,'1900/05/01') [Date]
        Union all
        Select [Date] + 1
        From Dates
        Where [Date] + 1 < DATEADD(year,@Year - 1900,'1900/06/01')
    )
     
    Select
        @output = MAX([Date])
    From Dates
    Where datepart(W,[Date]) = 2
 
    Return @output
     
END
GO
 
CREATE FUNCTION [dbo].[fn_MayBankHolidayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
 
    Declare @output datetime;
 
    With Dates as
    (
        Select DATEADD(year,@Year - 1900,'1900/05/01') [Date]
        Union all
        Select [Date] + 1
        From Dates
        Where [Date] + 1 < DATEADD(year,@Year - 1900,'1900/06/01')
    )
     
    Select
        @output = MIN([Date])
    From Dates
    Where datepart(W,[Date]) = 2
 
    Return @output
     
END
GO
 
CREATE FUNCTION [dbo].[fn_GoodFridayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
     
    RETURN DateAdd(day,-2,dbo.fn_EasterSundayByYear(convert(char(4),@Year)))
 
END
GO
 
CREATE FUNCTION [dbo].[fn_EasterMondayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
     
    RETURN DateAdd(day,1,dbo.fn_EasterSundayByYear(convert(char(4),@Year)))
 
END


GO


GO
EXEC [dbo].[uspDropCreatePopulateBankHolidayTable]


