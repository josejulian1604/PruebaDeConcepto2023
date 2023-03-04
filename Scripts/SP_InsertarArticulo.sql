USE [Tarea1_2023]
GO
/****** Object:  StoredProcedure [dbo].[InsertarArticulo]    Script Date: 3/3/2023 8:12:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[InsertarArticulo]
	  @inNombre	VARCHAR(124)
	, @inPrecio	MONEY
	, @outResultCode INT OUTPUT
	
	
AS
BEGIN

	SET NOCOUNT ON;

	SET @outResultCode = 0;
	IF NOT EXISTS (SELECT 1 FROM Articulo WHERE Nombre = @inNombre) -- Si el articulo no ha sido guardado
	BEGIN
		INSERT INTO [dbo].[Articulo]
				   ([Nombre]
				   ,[Precio])
			 VALUES
				   (@inNombre
				   ,@inPrecio)
	END
	ELSE
	BEGIN
		SET @outResultCode = 50001;
	END

	SELECT @outResultCode AS resultCode;

	SET NOCOUNT OFF;

END