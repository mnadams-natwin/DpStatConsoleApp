
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