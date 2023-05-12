USE [DpStatTest]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Michael Adams>
-- Create date: <Create Date,,10/07/2021>
-- Description:	<Description,,This procedure lists the parameters to be used in the DpService Application>
-- =============================================
ALTER PROCEDURE uspGetInputFetchAvailableAppointmentDate
AS
BEGIN
SELECT [ID]
      ,[BNNo]
      ,[LocationType]
      ,[ADAS]
      ,[WorkBranch]
      ,[WorkType]
      ,[Postcode]
FROM InputFetchAvailableAppointmentDate
END
GO
