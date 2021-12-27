USE [master]
GO
/****** Object:  Database [SodaGallitos]    Script Date: 12/26/2021 10:31:15 PM ******/
CREATE DATABASE [SodaGallitos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SodaGallitos', FILENAME = N'E:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\SodaGallitos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SodaGallitos_log', FILENAME = N'E:\sql\MSSQL15.SQLEXPRESS\MSSQL\DATA\SodaGallitos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SodaGallitos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SodaGallitos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SodaGallitos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SodaGallitos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SodaGallitos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SodaGallitos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SodaGallitos] SET ARITHABORT OFF 
GO
ALTER DATABASE [SodaGallitos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SodaGallitos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SodaGallitos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SodaGallitos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SodaGallitos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SodaGallitos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SodaGallitos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SodaGallitos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SodaGallitos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SodaGallitos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SodaGallitos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SodaGallitos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SodaGallitos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SodaGallitos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SodaGallitos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SodaGallitos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SodaGallitos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SodaGallitos] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SodaGallitos] SET  MULTI_USER 
GO
ALTER DATABASE [SodaGallitos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SodaGallitos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SodaGallitos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SodaGallitos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SodaGallitos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SodaGallitos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SodaGallitos] SET QUERY_STORE = OFF
GO
USE [SodaGallitos]
GO
/****** Object:  Table [dbo].[AdicionalesxOrden]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdicionalesxOrden](
	[Id] [int] NOT NULL,
	[IdElemento] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
	[Nota] [nchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Elemento]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elemento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[SiAdicional] [bit] NOT NULL,
	[Precio] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Elemento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElementosxPlatillo]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ElementosxPlatillo](
	[Id] [int] NOT NULL,
	[IdElemento] [int] NOT NULL,
	[idPlatillo] [int] NOT NULL,
 CONSTRAINT [PK_ElementosxPlatillo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Mesa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orden](
	[Id] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdMesa] [int] NOT NULL,
	[Estado] [int] NOT NULL,
	[TipoArregloPrecio] [int] NULL,
	[ValorArregloPrecio] [money] NULL,
	[NotaArregloPrecio] [nchar](100) NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platillo](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[Precio] [money] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Platillo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlatillosxOrden]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatillosxOrden](
	[Id] [int] NOT NULL,
	[IdPlatillo] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
	[Nota] [nchar](100) NULL,
 CONSTRAINT [PK_PlatillosxOrden] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] NOT NULL,
	[Username] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFinal] [datetime] NULL,
	[Estado] [bit] NOT NULL,
	[Rol] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdicionalesxOrden]  WITH CHECK ADD  CONSTRAINT [FK_AdicionalesxOrden_Elemento] FOREIGN KEY([IdElemento])
REFERENCES [dbo].[Elemento] ([Id])
GO
ALTER TABLE [dbo].[AdicionalesxOrden] CHECK CONSTRAINT [FK_AdicionalesxOrden_Elemento]
GO
ALTER TABLE [dbo].[AdicionalesxOrden]  WITH CHECK ADD  CONSTRAINT [FK_AdicionalesxOrden_Orden] FOREIGN KEY([IdOrden])
REFERENCES [dbo].[Orden] ([Id])
GO
ALTER TABLE [dbo].[AdicionalesxOrden] CHECK CONSTRAINT [FK_AdicionalesxOrden_Orden]
GO
ALTER TABLE [dbo].[ElementosxPlatillo]  WITH CHECK ADD  CONSTRAINT [FK_ElementosxPlatillo_Elemento] FOREIGN KEY([IdElemento])
REFERENCES [dbo].[Elemento] ([Id])
GO
ALTER TABLE [dbo].[ElementosxPlatillo] CHECK CONSTRAINT [FK_ElementosxPlatillo_Elemento]
GO
ALTER TABLE [dbo].[ElementosxPlatillo]  WITH CHECK ADD  CONSTRAINT [FK_ElementosxPlatillo_Platillo] FOREIGN KEY([idPlatillo])
REFERENCES [dbo].[Platillo] ([Id])
GO
ALTER TABLE [dbo].[ElementosxPlatillo] CHECK CONSTRAINT [FK_ElementosxPlatillo_Platillo]
GO
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Mesa] FOREIGN KEY([IdMesa])
REFERENCES [dbo].[Mesa] ([Id])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Mesa]
GO
ALTER TABLE [dbo].[PlatillosxOrden]  WITH CHECK ADD  CONSTRAINT [FK_PlatillosxOrden_Orden] FOREIGN KEY([IdOrden])
REFERENCES [dbo].[Orden] ([Id])
GO
ALTER TABLE [dbo].[PlatillosxOrden] CHECK CONSTRAINT [FK_PlatillosxOrden_Orden]
GO
ALTER TABLE [dbo].[PlatillosxOrden]  WITH CHECK ADD  CONSTRAINT [FK_PlatillosxOrden_Platillo] FOREIGN KEY([IdPlatillo])
REFERENCES [dbo].[Platillo] ([Id])
GO
ALTER TABLE [dbo].[PlatillosxOrden] CHECK CONSTRAINT [FK_PlatillosxOrden_Platillo]
GO
/****** Object:  StoredProcedure [dbo].[addElement]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addElement]
    @pName NVARCHAR(50),
	@pSiAdicional BIT,
	@pPrecio MONEY
AS
BEGIN
    SET NOCOUNT ON

        INSERT INTO dbo.[Elemento] (Nombre, SiAdicional, Precio ,Estado)
        VALUES(@pName, @pSiAdicional, @pPrecio, 1)

END
GO
/****** Object:  StoredProcedure [dbo].[addTable]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addTable]
    @pName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON

        INSERT INTO dbo.[Mesa] (Nombre, Estado)
        VALUES(@pName, 1)

END
GO
/****** Object:  StoredProcedure [dbo].[changeElement]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[changeElement]
	@pIdElement INT,
    @pName NVARCHAR(50),
	@pSiAdicional BIT,
	@pPrecio MONEY
AS
BEGIN
    SET NOCOUNT ON

        UPDATE Elemento
        SET Nombre = @pName, SiAdicional = @pSiAdicional, Precio = @pPrecio
		WHERE Id = @pIdElement

END
GO
/****** Object:  StoredProcedure [dbo].[changeTable]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[changeTable]
	@pIdTable INT,
    @pName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON

        UPDATE Mesa
        SET Nombre = @pName
		WHERE Id = @pIdTable

END
GO
/****** Object:  StoredProcedure [dbo].[deleteElement]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteElement]
    @pIdElement INT
AS
BEGIN
    SET NOCOUNT ON
        UPDATE dbo.[Elemento]
        SET Estado = 0
		WHERE Id = @pIdElement
END
GO
/****** Object:  StoredProcedure [dbo].[deleteTable]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteTable]
    @pIdTable INT
AS
BEGIN
    SET NOCOUNT ON
        UPDATE dbo.[Mesa]
        SET Estado = 0
		WHERE Id = @pIdTable
END
GO
/****** Object:  StoredProcedure [dbo].[getElements]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getElements]
AS
BEGIN
    SET NOCOUNT ON

        SELECT Id, Nombre, SiAdicional, Precio, Estado
		FROM Elemento
		WHERE Estado=1
END
GO
/****** Object:  StoredProcedure [dbo].[getTables]    Script Date: 12/26/2021 10:31:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getTables]
AS
BEGIN
    SET NOCOUNT ON

        SELECT Id, Nombre
		FROM Mesa
		WHERE Estado=1
END
GO
USE [master]
GO
ALTER DATABASE [SodaGallitos] SET  READ_WRITE 
GO
