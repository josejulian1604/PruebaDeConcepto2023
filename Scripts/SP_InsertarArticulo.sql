SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE InsertarArticulo
	  @Nombre	VARCHAR(124)
	, @Precio	MONEY
	
AS
BEGIN
	IF NOT EXISTS (SELECT 1 FROM Articulo WHERE Nombre = @Nombre)
	BEGIN
		INSERT INTO [dbo].[Articulo]
				   ([Nombre]
				   ,[Precio])
			 VALUES
				   (@Nombre
				   ,@Precio)
		SELECT 'Articulo insertado' AS resultado;
	END
	ELSE
	BEGIN
		SELECT 'Nombre de articulo ya ingresado' AS resultado;
	END
END