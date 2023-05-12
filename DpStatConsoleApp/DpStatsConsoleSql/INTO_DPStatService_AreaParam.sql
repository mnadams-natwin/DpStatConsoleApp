USE [DpStatTest]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AreaParam]') AND type in (N'U'))
DROP TABLE [dbo].[AreaParam]
GO

CREATE TABLE [AreaParam] (
  AreaID int NOT NULL PRIMARY KEY
, AreaName nvarchar(50) NULL
, ISORegion varchar(12) NULL
); 

GO
INSERT INTO [dbo].[AreaParam](AreaID, AreaName, ISORegion)	
(SELECT [area_ID] as 'AreaID'
      ,[area_name] as 'AreaName'
	  ,CASE WHEN [area_ID] in (1,2,3,4,6,7,10) THEN 'GB_ENG' 
			WHEN [area_ID] = 5 THEN 'GB_WLS'
			WHEN [area_ID] = 8 THEN 'GB_NI'
			WHEN [area_ID] = 9 THEN 'GB_SCT' END as 'ISORegion'		 
FROM [10.201.0.30].[NatWin].[dbo].[Areas]  as sql30)