USE [master]
GO
/****** Object:  Database [SodaGallitos]    Script Date: 1/9/2022 3:47:22 PM ******/
CREATE DATABASE [SodaGallitos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SodaGallitos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\SodaGallitos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SodaGallitos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\SodaGallitos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  UserDefinedTableType [dbo].[ElementIdList]    Script Date: 1/9/2022 3:47:22 PM ******/
CREATE TYPE [dbo].[ElementIdList] AS TABLE(
	[IdElement] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[IdAndNoteList]    Script Date: 1/9/2022 3:47:22 PM ******/
CREATE TYPE [dbo].[IdAndNoteList] AS TABLE(
	[Id] [int] NULL,
	[Note] [nvarchar](100) NULL DEFAULT (NULL)
)
GO
/****** Object:  Table [dbo].[AdicionalesxOrden]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdicionalesxOrden](
	[Id] [int] NOT NULL,
	[IdElemento] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
	[Nota] [nchar](100) NULL,
	[SiPagado] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Elemento]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elemento](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](100) NOT NULL,
	[SiAdicional] [bit] NOT NULL,
	[Precio] [money] NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Elemento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ElementosxPlatillo]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  Table [dbo].[Mesa]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Mesa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orden]    Script Date: 1/9/2022 3:47:23 PM ******/
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
	[ResponsableCreacion] [int] NOT NULL,
 CONSTRAINT [PK_Orden] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  Table [dbo].[PlatillosxOrden]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlatillosxOrden](
	[Id] [int] NOT NULL,
	[IdPlatillo] [int] NOT NULL,
	[IdOrden] [int] NOT NULL,
	[Nota] [nchar](100) NULL,
	[SiPagado] [bit] NOT NULL,
 CONSTRAINT [PK_PlatillosxOrden] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[Id] [int] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] NOT NULL,
	[Username] [nchar](15) NOT NULL,
	[Password] [nchar](15) NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NULL,
	[Estado] [bit] NOT NULL,
	[Rol] [int] NOT NULL,
	[Nombre] [nchar](50) NOT NULL,
	[Apellido] [nchar](50) NOT NULL,
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
ALTER TABLE [dbo].[Orden]  WITH CHECK ADD  CONSTRAINT [FK_Orden_Usuario] FOREIGN KEY([ResponsableCreacion])
REFERENCES [dbo].[Usuario] ([Id])
GO
ALTER TABLE [dbo].[Orden] CHECK CONSTRAINT [FK_Orden_Usuario]
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
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([Rol])
REFERENCES [dbo].[Rol] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
/****** Object:  StoredProcedure [dbo].[addDishAndExtraPerOrder]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addDishAndExtraPerOrder]
    @pExtraList AS dbo.IdAndNoteList READONLY,
	@pDishList AS dbo.IdAndNoteList READONLY,
	@pIdOrder as int
AS
BEGIN
    SET NOCOUNT ON

        INSERT INTO dbo.[PlatillosxOrden] (IdPlatillo, IdOrden, Nota, SiPagado)
        SELECT Id, @pIdOrder, Note, 0
		FROM @pExtraList
		
		INSERT INTO dbo.[AdicionalesxOrden] (IdElemento, IdOrden, Nota, SiPagado)
        SELECT Id, @pIdOrder, Note, 0
		FROM @pDishList

END
GO
/****** Object:  StoredProcedure [dbo].[addElement]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addOrder]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addOrder]
    @pIdMesa int, 
    @pTipoArregloPrecio int = NULL,
    @pValorArregloPrecio money = NULL, 
    @pNotaArregloPrecio NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON

        INSERT INTO dbo.[Orden] (Fecha, IdMesa, Estado, TipoArregloPrecio, ValorArregloPrecio, NotaArregloPrecio)
        VALUES(CURRENT_TIMESTAMP, @pIdMesa, 1, @pTipoArregloPrecio, @pValorArregloPrecio, @pNotaArregloPrecio)
		SELECT SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[addTable]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[addUser]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[addUser]
    @pUserName NVARCHAR(50), 
    @pPassword NVARCHAR(50),
    @pFirstName NVARCHAR(40) = NULL, 
    @pLastName NVARCHAR(40) = NULL,
	@Rol int
AS
BEGIN
    SET NOCOUNT ON

        INSERT INTO dbo.[Usuario] (Username, [Password], FechaInicio, FechaFinal, Estado, Rol, Nombre, Apellido)
        VALUES(@pUserName, @pPassword, getDate(), NULL, 1, @Rol, @pFirstName, @pLastName)

END
GO
/****** Object:  StoredProcedure [dbo].[changeElement]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[changeNameTable]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[changeNameTable]
	@pIdTable int,
    @pName NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON

        UPDATE Mesa
        SET Nombre = @pName
		WHERE Id = @pIdTable

END
GO
/****** Object:  StoredProcedure [dbo].[CreateDishWithElements]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateDishWithElements]
	@pElementsIdList AS dbo.ElementIdList READONLY,
	@pName as NVARCHAR(50),
	@pPrice as MONEY
	
AS
BEGIN
    SET NOCOUNT ON

		INSERT INTO dbo.[Platillo] (Nombre, Precio, Estado)
        VALUES(@pName, @pPrice, 1)

		DECLARE @IdDish as INT
		SET @IdDish = SCOPE_IDENTITY()

		INSERT INTO dbo.[ElementosxPlatillo] (IdElemento, idPlatillo)
		SELECT IdElement, @IdDish
		FROM @pElementsIdList
		
END
GO
/****** Object:  StoredProcedure [dbo].[deleteElement]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteOrder]
	@pIdOrder as int
AS
BEGIN
    SET NOCOUNT ON
		
		DELETE AdicionalesxOrden
		WHERE IdOrden = @pIdOrder

		DELETE PlatillosxOrden
		WHERE IdOrden = @pIdOrder

		DELETE Orden
		WHERE Id = @pIdOrder


END
GO
/****** Object:  StoredProcedure [dbo].[deleteTable]    Script Date: 1/9/2022 3:47:23 PM ******/
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
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[deleteUser]
    @pUserName NVARCHAR(50),
	@pNewPassword NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON
        UPDATE dbo.[Usuario]
        SET [Password] = @pNewPassword
		WHERE Username = @pUserName
END
GO
/****** Object:  StoredProcedure [dbo].[EditDishAndExtraPerOrder]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditDishAndExtraPerOrder]
    @pExtraList AS dbo.IdAndNoteList READONLY,
	@pDishList AS dbo.IdAndNoteList READONLY,
	@pIdOrder as int
AS
BEGIN
    SET NOCOUNT ON

		DELETE AdicionalesxOrden
		WHERE IdOrden = @pIdOrder

		DELETE PlatillosxOrden
		WHERE IdOrden = @pIdOrder

        INSERT INTO dbo.[PlatillosxOrden] (IdPlatillo, IdOrden, Nota, SiPagado)
        SELECT Id, @pIdOrder, Note, 0
		FROM @pExtraList
		
		INSERT INTO dbo.[AdicionalesxOrden] (IdElemento, IdOrden, Nota, SiPagado)
        SELECT Id, @pIdOrder, Note, 0
		FROM @pDishList

END
GO
/****** Object:  StoredProcedure [dbo].[finishOrder]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[finishOrder]
    @pIdOrden int
AS
BEGIN
    SET NOCOUNT ON

        UPDATE Orden
		SET Estado = 2
		WHERE Id = @pIdOrden

END
GO
/****** Object:  StoredProcedure [dbo].[getElements]    Script Date: 1/9/2022 3:47:23 PM ******/
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

END
GO
/****** Object:  StoredProcedure [dbo].[GetOrders]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetOrders]

AS
BEGIN
    SET NOCOUNT ON

        SELECT * 
		FROM Orden

END
GO
/****** Object:  StoredProcedure [dbo].[GetProcessedOrders]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProcessedOrders]

AS
BEGIN
    SET NOCOUNT ON

        SELECT * 
		FROM Orden
		WHERE Estado = 1

END
GO
/****** Object:  StoredProcedure [dbo].[getTables]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getTables]
AS
BEGIN
    SET NOCOUNT ON

        SELECT Id, Nombre, Estado
		FROM Mesa

END
GO
/****** Object:  StoredProcedure [dbo].[getUsers]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getUsers]
AS
BEGIN
    SET NOCOUNT ON

        SELECT Username, FechaInicio, FechaFinal, Estado, Rol, Nombre, Apellido
		FROM Usuario

END
GO
/****** Object:  StoredProcedure [dbo].[login]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[login]
    @pUserName NVARCHAR(50), 
    @pPassword NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON
		
		DECLARE @password nvarchar(50)

		SET @password = (SELECT [Password]
		FROM Usuario 
		WHERE Username = @pUserName)
		IF (@password = @pPassword)
			SELECT Id FROM Usuario WHERE Username = @pUserName
		ELSE
			SELECT -1
END
GO
/****** Object:  StoredProcedure [dbo].[ModifyOrder]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ModifyOrder]

AS
BEGIN
    SET NOCOUNT ON

        SELECT * 
		FROM Orden
		WHERE Estado = 2

END
GO
/****** Object:  StoredProcedure [dbo].[OrderDelivered]    Script Date: 1/9/2022 3:47:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OrderDelivered]
    @pIdOrden int
AS
BEGIN
    SET NOCOUNT ON

        UPDATE Orden
		SET Estado = 3
		WHERE Id = @pIdOrden

END
GO
USE [master]
GO
ALTER DATABASE [SodaGallitos] SET  READ_WRITE 
GO
