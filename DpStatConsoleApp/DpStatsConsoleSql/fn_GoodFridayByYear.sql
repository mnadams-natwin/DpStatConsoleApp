CREATE FUNCTION [dbo].[fn_GoodFridayByYear]
(
    @Year int
)
RETURNS smalldatetime
AS
BEGIN
     
    RETURN DateAdd(day,-2,dbo.fn_EasterSundayByYear(convert(char(4),@Year)))
 
END


