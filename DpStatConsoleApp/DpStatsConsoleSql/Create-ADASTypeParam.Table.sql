USE [DpStatTest]
GO
/****** Object:  Table [dbo].[ADASTypeParam]    Script Date: 05/11/2021 10:59:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ADASTypeParam]') AND type in (N'U'))
DROP TABLE [dbo].[ADASTypeParam]
GO
/****** Object:  Table [dbo].[ADASTypeParam]    Script Date: 05/11/2021 10:59:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADASTypeParam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADASType] [nchar](10) NOT NULL,
	[ADASTypeDescription] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ADASTypeParam] ON 

INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (1, N'0         ', N'None')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (2, N'1         ', N'Static/Hybrid Optional')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (3, N'2         ', N'Dynamic Optional')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (4, N'3         ', N'Static/Hybrid Standard')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (5, N'4         ', N'Dynamic Standard')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (6, N'5         ', N'Static/Hybrid or Dynamic Optional')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (7, N'6         ', N'Static/Hybrid or Dynamic Standard')
INSERT [dbo].[ADASTypeParam] ([ID], [ADASType], [ADASTypeDescription]) VALUES (8, N'9         ', N'Not Known')
SET IDENTITY_INSERT [dbo].[ADASTypeParam] OFF
GO
