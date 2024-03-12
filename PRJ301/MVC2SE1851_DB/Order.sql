USE [master]
GO

/****** Object:  Table [dbo].[Order]    Script Date: 3/12/2024 9:08:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Order](
	[id] [varchar](5) NOT NULL,
	[date] [datetime] NULL,
	[address] [nvarchar](250) NULL,
	[total] [float] NULL,
 CONSTRAINT [PK_TOrder] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


