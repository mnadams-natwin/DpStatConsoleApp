use DPStatService
GO 
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BranchParams]') AND type in (N'U'))
DROP TABLE [dbo].[BranchParams]
GO


--select the branches that are visible on the maps web site   
  select Branch_No, MB_No, Branch_Na,Postcode, Area_ID
  INTO [dbo].[BranchParams]
  from [NatWin].[dbo].[tblBranch] as sql33
  where branch_Na is not null and Include_On_Map = '1'