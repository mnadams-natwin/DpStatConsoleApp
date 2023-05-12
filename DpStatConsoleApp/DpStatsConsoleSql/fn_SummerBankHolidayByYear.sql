
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

