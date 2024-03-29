USE [Ecommerce]
GO
/****** Object:  Table [dbo].[Carrello]    Script Date: 16/02/2024 17:17:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrello](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdArticolo] [int] NOT NULL,
	[NomeArticolo] [nvarchar](100) NOT NULL,
	[Prezzo] [money] NOT NULL,
	[Quantità] [int] NULL,
	[Immagine] [nvarchar](300) NULL,
 CONSTRAINT [PK_Carrello] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carrello]  WITH CHECK ADD  CONSTRAINT [FK_Carrello_Articoli] FOREIGN KEY([IdArticolo])
REFERENCES [dbo].[Articoli] ([Id])
GO
ALTER TABLE [dbo].[Carrello] CHECK CONSTRAINT [FK_Carrello_Articoli]
GO
