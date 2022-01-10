USE [SodaGallitos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDishes]

	
AS
BEGIN
    SET NOCOUNT ON

	SELECT Id, Nombre, Precio, Estado
	FROM Platillo

END
GO