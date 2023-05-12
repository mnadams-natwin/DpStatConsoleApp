
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