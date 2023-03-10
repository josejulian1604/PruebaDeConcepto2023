USE [Tarea1_2023]
GO
/****** Object:  StoredProcedure [dbo].[OrdenarArticulos]    Script Date: 3/5/2023 1:19:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- SP que se encarga de retornar los articulos 
-- ordenadados alfabeticamente
-- =============================================
ALTER PROCEDURE [dbo].[OrdenarArticulos] 
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT * FROM Articulo ORDER BY Nombre ASC; -- Selecciona los articulos por nombre
												-- de manera ascendente
	SET NOCOUNT OFF;

END
