USE [SQL BOOTCAMP]
GO

/****** Object:  Table [dbo].[Sales]    Script Date: 8/23/2022 3:29:22 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sales](
	[SalesID] [int] IDENTITY(100,2) NOT NULL,
	[CustID] [int] NULL,
	[RepID] [int] NULL,
	[SalesDate] [datetime] NOT NULL,
	[UnitCount] [int] NULL,
	[VerificationCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uc_VerificationCode] UNIQUE NONCLUSTERED 
(
	[VerificationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sales] ADD  CONSTRAINT [DF_Sales_SalesDate]  DEFAULT (getdate()) FOR [SalesDate]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Customer] FOREIGN KEY([CustID])
REFERENCES [dbo].[Customer] ([CustID])
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Customer]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SalesReps] FOREIGN KEY([RepID])
REFERENCES [dbo].[SalesReps] ([RepID])
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_SalesReps]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [CK_Sales] CHECK  (([UnitCount]>=(1)))
GO

ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [CK_Sales]
GO


