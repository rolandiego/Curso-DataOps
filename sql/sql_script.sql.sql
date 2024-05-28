USE Kaggle
GO

/*EN CASO NO EXISTA LA TABLA NETFLIX LA VOY A CREAR*/
IF NOT EXISTS (SELECT*FROM SYS.TABLES WHERE object_id = OBJECT_ID(N'dbo.netflix') AND type = 'U')

CREATE TABLE dbo.netflix (
    show_id varchar(20),
	type_show varchar(20),
	title varchar(max),
	director varchar(max),
	cast_show varchar(max),
	country varchar(200),
	date_added varchar(50),
	release_year varchar(max),
	rating varchar(max),
	duration varchar(max),
	listed_in varchar(max),
	description_show varchar(max)
)

--SI LA TABLA YA EXISTE ENTONCES LA TRUNCO
TRUNCATE TABLE dbo.netflix

--INGESTAR DATASET
BULK INSERT dbo.netflix
FROM 'C:\Users\HP\OneDrive\Documentos\proyecto_parcial\phyton\dataset\netflix_titles.csv'
WITH
(
    FIRSTROW = 2, --empieza en la 2da fila, ya que la 1era es la cabecera
	FIELDTERMINATOR = ',', --indicamos separador de columnas
	ROWTERMINATOR = '0x0a' -- hace referencia a un salto de linea
)

GO



