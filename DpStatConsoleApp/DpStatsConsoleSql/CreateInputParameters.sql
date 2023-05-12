USE [DpStatService]
GO
--DECLARE @BNNoVar  VarChar(50);
DECLARE @ADASVar nchar(10);
--DECLARE @WorkType varchar(50);



--SET @BNNoVar = 7082; --replaced with table BNNoParam
SET @ADASVar = 0; --ADAS(0)= None: to be replaced with table ADASTypeParam
--SET @WorkType = '0101'; --workType(0101)= Supply and Fit: to be replaced with tables WorkTypeLHSParam + WorkTypeRHSParam

TRUNCATE TABLE [InputFetchAvailableAppointmentDate]; 

INSERT INTO [dbo].[InputFetchAvailableAppointmentDate]
           ([BNNo]
           ,[LocationType]
           ,[ADAS]
           ,[WorkBranch]
           ,[WorkType]
           ,[Postcode])
(SELECT bnno.BNNo as BNNo,  ltp.LocationType, @ADASVar as ADAS, bp.Branch_No, RTRIM(wtlhs.WorkTypeLHS)+RTRIM(wtrhs.WorkTypeRHS) as WorkType, bp.[Postcode]
FROM [BranchParams] as bp, LocationTypeParam as ltp, BNNoParam as bnno, WorkTypeLHSParam as wtlhs, WorkTypeRHSParam as wtrhs)

/* using all combination of ADAS and WorkType (Amount to over 2million rows)
  (SELECT bnno.BNNo as BNNo,  ltp.LocationType, atp.ADASType as ADAS,bp.Branch_No, RTRIM(wtlhs.WorkTypeLHS)+RTRIM(wtrhs.WorkTypeRHS) as WorkType, bp.[Postcode]
FROM [BranchParams] as bp, LocationTypeParam as ltp, BNNoParam as bnno, ADASTypeParam as atp, WorkTypeLHSParam as wtlhs, WorkTypeRHSParam as wtrhs)
*/


GO 


/*Remove all parameters that are neither Repair nor Supply&Replace otherwise the tables will be too big for Arran's BI*/
DELETE FROM [dbo].[InputFetchAvailableAppointmentDate]
      WHERE WorkType <> '0401' AND WorkType <> '0101'
GO

