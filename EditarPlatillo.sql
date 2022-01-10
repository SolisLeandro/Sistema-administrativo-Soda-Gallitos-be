USE [SodaGallitos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditDishWithElements]
	@pIdDish INT,
	@pElementsIdList AS dbo.ElementIdList READONLY,
	@pName as NVARCHAR(50),
	@pPrice as MONEY
	
AS
BEGIN
    SET NOCOUNT ON

		DELETE ElementosxPlatillo
		WHERE idPlatillo = @pIdDish

		UPDATE dbo.[Platillo] 
        SET Nombre = @pName, Precio = @pPrice, Estado = 1
		WHERE Id = @pIdDish

		INSERT INTO dbo.[ElementosxPlatillo] (IdElemento, idPlatillo)
		SELECT IdElement, @pIdDish
		FROM @pElementsIdList
		
END
GO