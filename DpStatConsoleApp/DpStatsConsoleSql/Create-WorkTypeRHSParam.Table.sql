USE [DpStatTest]
GO
/****** Object:  Table [dbo].[WorkTypeRHSParam]    Script Date: 01/11/2021 12:10:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkTypeRHSParam]') AND type in (N'U'))
DROP TABLE [dbo].[WorkTypeRHSParam]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTypeRHSParam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkTypeRHS] [nchar](10) NOT NULL,
	[WorkTypeRHSDescription] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WorkTypeRHSParam] ON 

INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (1, N'01        ', N'Windscreen')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (2, N'02        ', N'Backlight')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (3, N'03        ', N'Front vent/Quarterlight')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (4, N'04        ', N'Front door')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (5, N'05        ', N'Rear door')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (6, N'06        ', N'Rear vent')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (7, N'07        ', N'Rear quarterlight')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (8, N'08        ', N'Alarm')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (9, N'09        ', N'Air conditioning')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (10, N'10        ', N'Window tinting')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (11, N'11        ', N'Mirror')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (12, N'12        ', N'Wiper')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (13, N'13        ', N'Sensor')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (14, N'14        ', N'Radio')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (15, N'15        ', N'Sunroof')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (16, N'16        ', N'Towbar')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (17, N'17        ', N'Scuttle')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (18, N'18        ', N'Tools')
INSERT [dbo].[WorkTypeRHSParam] ([ID], [WorkTypeRHS], [WorkTypeRHSDescription]) VALUES (19, N'19        ', N'Accessories')
SET IDENTITY_INSERT [dbo].[WorkTypeRHSParam] OFF
GO
