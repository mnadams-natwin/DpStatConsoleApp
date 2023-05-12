
CREATE FUNCTION [dbo].[fn_EasterMondayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
     
    RETURN DateAdd(day,1,dbo.fn_EasterSundayByYear(convert(char(4),@Year)))
 
END
