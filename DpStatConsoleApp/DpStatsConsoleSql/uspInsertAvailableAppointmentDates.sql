USE [DpStatTest]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[uspInsertAvailableAppointmentDates] 
	@AgreedDate date,
    @BranchNo nvarchar(10),
	@BNNo nvarchar(10),
    @LocationType varchar(10),
    @AvailableDate date,    
	@ADASType   varchar(50),
	@WorkType  nchar(10)

AS
BEGIN
INSERT INTO [dbo].[AvailableAppointmentDates]
           ([AgreedDate]
           ,[BranchNo]
           ,[BNNo]
           ,[LocationType]
           ,[AvailableDate]
		   ,[ADASType]
           ,[WorkType])
     VALUES
           (@AgreedDate,
            @BranchNo,
			@BNNo,
			@LocationType,
			@AvailableDate,
			@ADASType,
			@WorkType)

END
GO
