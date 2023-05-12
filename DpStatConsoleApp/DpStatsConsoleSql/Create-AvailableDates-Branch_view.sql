USE [DPStatService]
GO

/****** Object:  View [dbo].[AvailableDates-Branch_view]    Script Date: 12/01/2023 12:26:49 ******/
DROP VIEW [dbo].[AvailableDates-Branch_view]
GO

/****** Object:  View [dbo].[AvailableDates-Branch_view]    Script Date: 12/01/2023 12:26:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE View [dbo].[AvailableDates-Branch_view] as 
  SELECT ADV.[BranchNo] 
		,ADV.[Branch Name]
		,ADV.[Member Description]
		,ADV.[BNNo Style Description]
		,ADV.AgreedDate		
		,Min(ADV.AvailableDate) as '1st Available Appointment'
		,min(ADV.[Working Days]) as  'Working Days' 
  FROM [dbo].[AvailableDates-BASE_view] as ADV
  where    ADV.LocationType ='B'
  group by ADV.AgreedDate,ADV.[BranchNo], ADV.[Branch Name], ADV.[Member Description], ADV.[BNNo Style Description]
GO


