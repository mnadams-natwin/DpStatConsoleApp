USE [DpStatTest]
GO
/****** Object:  Table [dbo].[WorkTypeLHSParam]    Script Date: 01/11/2021 12:06:02 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkTypeLHSParam]') AND type in (N'U'))
DROP TABLE [dbo].[WorkTypeLHSParam]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTypeLHSParam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkTypeLHS] [nchar](10) NOT NULL,
	[WorkTypeLHSDescription] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WorkTypeLHSParam] ON 

INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (1, N'01        ', N'Supply & Fit')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (2, N'02        ', N'Supply only')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (3, N'03        ', N'Fit only')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (4, N'04        ', N'Repair')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (5, N'05        ', N'Remove & Refit')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (6, N'06        ', N'Remove only')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (7, N'07        ', N'Crash Wrap/Perspex')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (8, N'08        ', N'Leak test')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (9, N'09        ', N'Reseal')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (10, N'10        ', N'Trim replacement')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (11, N'11        ', N'Trim refit')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (12, N'12        ', N'Re-attach')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (13, N'13        ', N'Service')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (14, N'14        ', N'Investigate')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (15, N'15        ', N'Investigate wind noise')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (16, N'16        ', N'Camera Calibration')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (17, N'80        ', N'Clean out car')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (18, N'81        ', N'Fleet check')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (19, N'82        ', N'Deposit')
INSERT [dbo].[WorkTypeLHSParam] ([ID], [WorkTypeLHS], [WorkTypeLHSDescription]) VALUES (20, N'83        ', N'Call out')
SET IDENTITY_INSERT [dbo].[WorkTypeLHSParam] OFF
GO
