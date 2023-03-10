USE [Tarea1_2023]
GO
/****** Object:  StoredProcedure [dbo].[InsertarArticulo]    Script Date: 3/6/2023 1:30:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ====================================================
-- SP de insercion. Recibe un nombre y precio y lo 
-- inserta si no existe. Retorna un codigo de resultado
-- ====================================================
ALTER PROCEDURE [dbo].[InsertarArticulo]
	  @inNombre	VARCHAR(124)		-- Nuevo nombre de articulo
	, @inPrecio	MONEY				-- Precio del articulo insertado
	, @outResultCode INT OUTPUT		-- Codigo de resultado del SP
	
	
AS
BEGIN

	SET NOCOUNT ON;

	SET @outResultCode = 0;	-- Codigo por default que indica no hubo error

	IF PATINDEX('%[^a-zA-Z-]%', @inNombre) > 0 -- Validar que el nombre contenga solamente 
	BEGIN									   -- caracteres alfabeticos o "-"
		SET @outResultCode = 50002; -- Error: el nombre no esta bien formado
	END

	ELSE IF NOT EXISTS (SELECT 1 FROM Articulo WHERE Nombre = @inNombre) -- Si el articulo no ha sido guardado
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
		SET @outResultCode = 50001;	-- Error, el articulo ya fue insertado
	END

	SELECT @outResultCode AS resultCode; -- Nos aseguramos de retornar el codigo de error
										 --	para ser utilizado en capa logica
	SET NOCOUNT OFF;

END