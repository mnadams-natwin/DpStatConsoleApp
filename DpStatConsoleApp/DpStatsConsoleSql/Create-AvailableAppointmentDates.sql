USE [DpStatTest]
GO

/****** Object:  Table [dbo].[AvailableAppointmentDates]    Script Date: 10/12/2021 11:46:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AvailableAppointmentDates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgreedDate] [date] NULL,
	[BranchNo] [nvarchar](10) NULL,
	[BNNo] [nvarchar](10) NULL,
	[LocationType] [varchar](10) NULL,
	[AvailableDate] [date] NULL,
	[ADASType] [nchar](10) NULL,
	[WorkType] [varchar](50) NULL
) ON [PRIMARY]
GO


