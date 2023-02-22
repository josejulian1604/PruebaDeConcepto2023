SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- SP que se encarga de retornar los articulos 
-- ordenadados alfabeticamente
-- =============================================
CREATE PROCEDURE OrdenarArticulos 
	
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT * FROM Articulo ORDER BY Nombre ASC;
END
GO