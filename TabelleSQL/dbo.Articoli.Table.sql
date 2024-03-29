USE [Ecommerce]
GO
/****** Object:  Table [dbo].[Articoli]    Script Date: 16/02/2024 17:17:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articoli](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Descrizione] [nvarchar](200) NOT NULL,
	[Prezzo] [money] NOT NULL,
	[Immagine] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_Articoli] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
