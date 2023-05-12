/****** Script for SelectTopNRows command from SSMS  ******/

--USE [DPStatService]
--GO

/****** Object:  View [dbo].[AvailableDates-BASE_view]   Script Date: 16/08/2021 14:07:09 ******/
DROP VIEW [dbo].[AvailableDates-BASE_view]
GO

/****** Object:  View [dbo].[AvailableDates-BASE_view]   Script Date: 16/08/2021 14:07:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script to create a filtered view of the last 30 days   ******/
Create View [dbo].[AvailableDates-BASE_view] as 
SELECT avd.[ID]
      ,avd.[AgreedDate]
      ,avd.[BranchNo]
	  ,avd.ADASType
	  ,atp.ADASTypeDescription
	  ,avd.WorkType
	  ,wtlhs.WorkTypeLHSDescription
	  ,wtrhs.WorkTypeRHSDescription
	  ,bp.Branch_Na as 'Branch Name'
	  ,bp.MB_No as 'Member Number'
	  ,bmp.[Name] as 'Member Description'
	  ,bmp.[ShortName] as 'Member Short Name'
      ,avd.[BNNo]
	  ,bnnp.[BNStyle]
      ,bnnp.[BNName]
	  ,bnsp.[Description] as 'BNNo Style Description'
	  ,ltp.[Description] as 'Location Type Description'
	  ,ap.AreaID
	  ,ap.AreaName
	  ,ap.ISORegion
      ,avd.[LocationType]
      ,avd.[AvailableDate]
	  ,dbo.udf_CountWorkingDays(avd.[AgreedDate], avd.[AvailableDate],ap.ISORegion) as 'Working Days'
  FROM [AvailableAppointmentDates] avd
  left join [BranchParams] bp on bp.Branch_No = avd.BranchNo COLLATE Latin1_General_CI_AS
  left join [LocationTypeParam] ltp on ltp.LocationType = avd.LocationType COLLATE Latin1_General_CI_AS
  left join [BNNoParam] bnnp on bnnp.BNNo = avd.BNNo COLLATE Latin1_General_CI_AS
  left join [BNStyleParam] bnsp on bnnp.BNStyle = bnsp.ID 
  left join [BranchMemberParam] bmp on bmp.MemberNo = LEFT(bp.Branch_No,2)
  left join [ADASTypeParam] atp on avd.ADASType = atp.ADASType
  left join [WorkTypeLHSParam] wtlhs on wtlhs.WorkTypeLHS = LEFT(avd.WorkType,2)
  left join [WorkTypeRHSParam] wtrhs on wtrhs.WorkTypeRHS = RIGHT(RTRIM([WorkType]),2)
  left join [AreaParam] ap on ap.AreaID = bp.Area_ID
  join (SELECT distinct top 30 MAX([AgreedDate]) AS 'LatestAgreedDate'
		FROM [AvailableAppointmentDates]
		GROUP BY [AgreedDate] 
		ORDER BY LatestAgreedDate desc) lad on lad.[LatestAgreedDate] = avd.[AgreedDate]
GO

SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('InputFetchAvailableAppointmentDate')

GO

SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('AvailableAppointmentDates')

GO

SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('BranchParams')

GO 

SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('LocationTypeParam')

GO 
SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('BNNoParam')


GO 
SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('AreaParam')



GO 
SELECT name, collation_name, OBJECT_NAME(object_id)
FROM sys.columns 
WHERE OBJECT_NAME(object_id) IN ('AvailableDates-BASE_view')

GO 

select top 1000 * from  [dbo].[AvailableDates-BASE_view]


