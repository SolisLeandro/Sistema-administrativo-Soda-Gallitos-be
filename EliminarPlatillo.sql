USE [SodaGallitos]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteDish]
	@pIdDish INT

	
AS
BEGIN
    SET NOCOUNT ON

		UPDATE dbo.[Platillo] 
        SET Estado = 0
		WHERE Id = @pIdDish

END
GO