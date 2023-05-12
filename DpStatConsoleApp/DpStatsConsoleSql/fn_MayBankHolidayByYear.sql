
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
