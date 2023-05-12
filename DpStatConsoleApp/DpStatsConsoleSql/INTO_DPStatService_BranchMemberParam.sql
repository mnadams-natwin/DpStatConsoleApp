/****** Script for SelectTopNRows command from SSMS  ******/
USE [DpStatService]
GO

/****** Object:  Table [dbo].[BranchMemberParam]    Script Date: 21/10/2022 16:58:55 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BranchMemberParam]') AND type in (N'U'))
DROP TABLE [dbo].[BranchMemberParam]
GO


SELECT [MemberNo]
      ,[Name]
      ,[ShortName]
 into [DPStatService].[dbo].[BranchMemberParam]
 FROM [NwData].[dbo].[t_Members] remoteTbl
 where remoteTbl.IsDeleted <> 1