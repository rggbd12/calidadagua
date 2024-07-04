CREATE DATABASE WATER;
USE WATER;
SELECT * FROM [dbo].[waterquality];
------------------------------------------------------------------------------------------------------------------
/*TRASNFORMAR TIPO DE DATOS*/

-- CREAR COPIA DEL DATASET ORIGINAL
SELECT * INTO AGUA FROM [dbo].[waterquality];

-- CAMBIAR TIPO DE DATO POR FECHA
SELECT 
	CAST(TRIM(Date) AS date)
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS
UPDATE AGUA SET Date = CAST(TRIM(Date) AS date);

-- MODIFICACION DEL TIPO DE DATO EN LA COLUMNA DATE
ALTER TABLE AGUA ALTER COLUMN Date Date;

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].Date', 'Fecha', 'COLUMN';

commit;
rollback;

-- VISUALIZACION DE CAMBIOS;
exec sp_help agua;
select * from AGUA;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN SALINIDAD
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT Salinity
FROM AGUA;

SELECT 
	TRY_CAST(TRIM(Salinity) AS decimal(2,1)), Salinity
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE SALINIDAD
UPDATE AGUA SET Salinity = TRY_CAST(TRIM(Salinity) AS decimal(2,1));

-- ACTUALIZAMOS DATOS DE SALINIDAD QUE SEAN NULOS A 0.0
UPDATE AGUA SET Salinity = 0.0 WHERE Salinity  IS NULL;

-- MODIFICACION DEL TIPO DE DATO DECIMAL EN LA COLUMNA DATE
ALTER TABLE AGUA ALTER COLUMN Salinity decimal(2,1);

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].Salinity', 'Salinidad', 'COLUMN';

commit;
rollback;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN DissolvedOxygen
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT [DissolvedOxygen (mg L)]
FROM AGUA;

SELECT 
	TRY_CAST(TRIM([DissolvedOxygen (mg L)]) AS decimal(3,1)), [DissolvedOxygen (mg L)]
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE DissolvedOxygen
UPDATE AGUA SET [DissolvedOxygen (mg L)] = TRY_CAST(TRIM([DissolvedOxygen (mg L)]) AS decimal(3,1));

-- ACTUALIZAMOS DATOS DE DissolvedOxygen QUE SEAN NULOS A 0.0
UPDATE AGUA SET [DissolvedOxygen (mg L)] = 0.0 WHERE [DissolvedOxygen (mg L)]  IS NULL;

-- MODIFICACION DEL TIPO DE DECIMAL EN LA COLUMNA DissolvedOxygen
ALTER TABLE AGUA ALTER COLUMN [DissolvedOxygen (mg L)] decimal(3,1);

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].[DissolvedOxygen (mg L)]', 'Oxigeno_Disuelto', 'COLUMN';

commit;
rollback;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN pH
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT PH
FROM AGUA;

SELECT 
	TRY_CAST(TRIM(pH) AS decimal(3,1)), pH
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE pH
UPDATE AGUA SET pH =TRY_CAST(TRIM(pH) AS decimal(3,1))

-- ACTUALIZAMOS DATOS DE pH QUE SEAN NULOS A 0.0
UPDATE AGUA SET pH = 0.0 WHERE pH IS NULL;

-- MODIFICACION DEL TIPO DE DECIMAL EN LA COLUMNA pH
ALTER TABLE AGUA ALTER COLUMN pH decimal(2,1);

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].pH', 'Ph', 'COLUMN';

commit;
rollback;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN [SecchiDepth (m)]
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT [SecchiDepth (m)]
FROM AGUA;

SELECT 
	TRY_CAST(TRIM([SecchiDepth (m)]) AS decimal(3,2)), [SecchiDepth (m)]
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE [SecchiDepth (m)]
UPDATE AGUA SET [SecchiDepth (m)] =TRY_CAST(TRIM([SecchiDepth (m)]) AS  decimal(3,2));

-- ACTUALIZAMOS DATOS DE [SecchiDepth (m)] QUE SEAN NULOS A 0.0
UPDATE AGUA SET [SecchiDepth (m)] = 0.00 WHERE [SecchiDepth (m)] IS NULL;

-- MODIFICACION DEL TIPO DE DECIMAL EN LA COLUMNA [SecchiDepth (m)]
ALTER TABLE AGUA ALTER COLUMN [SecchiDepth (m)]  decimal(3,2);

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].[SecchiDepth (m)]', 'Disco_Secchi', 'COLUMN';

commit;
rollback;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN [WaterDepth (m)]
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT [WaterDepth (m)]
FROM AGUA;

SELECT 
	TRY_CAST(TRIM([WaterDepth (m)]) AS  decimal(3,1)),[WaterDepth (m)]
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE [WaterDepth (m)]
UPDATE AGUA SET [WaterDepth (m)] = TRY_CAST(TRIM([WaterDepth (m)]) AS decimal(3,1));

-- ACTUALIZAMOS DATOS DE [WaterDepth (m)] QUE SEAN NULOS A 0.0
UPDATE AGUA SET [WaterDepth (m)] = 0.0 WHERE [WaterDepth (m)]IS NULL;

-- MODIFICACION DEL TIPO DE DECIMAL EN LA COLUMNA [WaterDepth (m)]
ALTER TABLE AGUA ALTER COLUMN [WaterDepth (m)] decimal(3,1);

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].[WaterDepth (m)]', 'Profundidad_Agua', 'COLUMN';

commit;
rollback;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN [WaterDepth (m)]
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT [WaterTemp (C)]
FROM AGUA;

SELECT 
	TRY_CAST(TRIM([WaterTemp (C)]) AS decimal(3,1)),[WaterTemp (C)]
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE [WaterDepth (m)]
UPDATE AGUA SET [WaterTemp (C)] = TRY_CAST(TRIM([WaterTemp (C)]) AS decimal(3,1));

-- ACTUALIZAMOS DATOS DE [WaterDepth (m)] QUE SEAN NULOS A 0.0
UPDATE AGUA SET [WaterTemp (C)] = 0.0 WHERE [WaterTemp (C)] IS NULL;

-- MODIFICACION DEL TIPO DE DECIMAL EN LA COLUMNA [WaterDepth (m)]
ALTER TABLE AGUA ALTER COLUMN [WaterTemp (C)] decimal(3,1);

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].[WaterTemp (C)]', 'Temperatura_Agua', 'COLUMN';

commit;
rollback;

------------------------------------------------------------------------------------------------------------------
-- MODIFICAR CAMPOS VACIOS Y TIPO DE DATO EN [AirTemp (C)]
-- VERIFICAR DATOS UNICOS
SELECT 
	DISTINCT [AirTemp (C)]
FROM AGUA;

SELECT 
	TRY_CAST(TRIM([AirTemp (C)]) AS float),[AirTemp (C)]
FROM AGUA;

-- INICIAMOS LA TRANSACCION
begin transaction;

-- ACTUALIZAMOS DATOS DE [AirTemp (C)]
UPDATE AGUA SET [AirTemp (C)] = TRY_CAST(TRIM([AirTemp (C)]) AS float);

-- ACTUALIZAMOS DATOS DE [AirTemp (C)] QUE SEAN NULOS A 0.0
UPDATE AGUA SET [AirTemp (C)] = 0.0 WHERE [AirTemp (C)] IS NULL;

-- MODIFICACION DEL TIPO DE DECIMAL EN LA COLUMNA [AirTemp (C)]
ALTER TABLE AGUA ALTER COLUMN [AirTemp (C)] float;

-- REEMPLAZAMOS NOMBRE DE COLUMNA
EXEC sp_rename '[dbo].[AGUA].[AirTemp (C)]', 'Temperatura_Aire', 'COLUMN';

commit;
rollback;

----------------------------------------------------------------------------------------------------------------------------------------------

select distinct Profundidad_Agua from AGUA order by Profundidad_Agua desc;
select distinct Disco_Secchi from AGUA order by Disco_Secchi desc;

select 
cast(AVG(salinidad) AS decimal(2,1)) as av_sal, 
try_cast(AVG(Oxigeno_Disuelto) AS decimal(2,1))as av_ox,  
YEAR(Fecha) from AGUA 
group by YEAR(Fecha) 
-- having cast(AVG(salinidad) AS decimal(2,1)) <= 0.5 
-- and cast(AVG(Oxigeno_Disuelto) AS decimal(3,1)) > 5.0
order by YEAR(fecha) desc;