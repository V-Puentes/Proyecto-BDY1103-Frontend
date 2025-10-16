CREATE OR REPLACE PROCEDURE PROC_REGISTROS_POR_ANIO IS

  -- Tipo para almacenar conteo por año
  TYPE tipo_conteo_anios IS TABLE OF NUMBER INDEX BY VARCHAR2(20);
  V_ANIO_REG tipo_conteo_anios;

  V_TOTAL_CLI NUMBER(16);
  V_FECHA_REG_CLI CLIENTE.FECHA_REG_CLI%TYPE;
  V_CATEGORIA_ANIO VARCHAR2(20);
  V_ANIO_NUM NUMBER;

  -- Cursor para clientes
  CURSOR C_CLIENTES IS
    SELECT FECHA_REG_CLI
    FROM CLIENTE;

  -- Lista de categorías válidas
  TYPE tipo_categorias IS TABLE OF VARCHAR2(20);
  V_CATEGORIAS tipo_categorias := tipo_categorias(
    '2020 o antes',
    '2021',
    '2022',
    '2023',
    '2024',
    'Este año'
  );

BEGIN
  -- Inicializar contadores
  V_TOTAL_CLI := 0;

  V_ANIO_REG('2020 o antes') := 0;
  V_ANIO_REG('2021') := 0;
  V_ANIO_REG('2022') := 0;
  V_ANIO_REG('2023') := 0;
  V_ANIO_REG('2024') := 0;
  V_ANIO_REG('Este año') := 0;

  -- Recorrer clientes
  FOR F_CLIENTE IN C_CLIENTES LOOP
    V_FECHA_REG_CLI := F_CLIENTE.FECHA_REG_CLI;
    V_ANIO_NUM := EXTRACT(YEAR FROM V_FECHA_REG_CLI);

    -- Validar año permitido
    IF V_ANIO_NUM > 2025 THEN
      RAISE_APPLICATION_ERROR(-20001, 'El año de registro ' || V_ANIO_NUM || ' excede el máximo permitido (2025).');
    END IF;

    -- Clasificar por categoría
    V_CATEGORIA_ANIO := CASE 
      WHEN V_ANIO_NUM <= 2020 THEN '2020 o antes'
      WHEN V_ANIO_NUM = 2021 THEN '2021'
      WHEN V_ANIO_NUM = 2022 THEN '2022'
      WHEN V_ANIO_NUM = 2023 THEN '2023'
      WHEN V_ANIO_NUM = 2024 THEN '2024'
      WHEN V_ANIO_NUM = EXTRACT(YEAR FROM SYSDATE) THEN 'Este año'
      ELSE NULL -- No debería llegar aquí
    END;

    -- Aumentar conteo
    IF V_CATEGORIA_ANIO IS NOT NULL THEN
      V_ANIO_REG(V_CATEGORIA_ANIO) := V_ANIO_REG(V_CATEGORIA_ANIO) + 1;
      V_TOTAL_CLI := V_TOTAL_CLI + 1;
    END IF;
  END LOOP;

  -- MERGE por cada categoría
  FOR I IN 1 .. V_CATEGORIAS.COUNT LOOP
    MERGE INTO KPI_1 k
    USING (
      SELECT V_CATEGORIAS(I) AS ANIO, V_ANIO_REG(V_CATEGORIAS(I)) AS TOTAL_REGISTROS FROM DUAL
    ) src
    ON (k.ANIO = src.ANIO)
    WHEN MATCHED THEN
      UPDATE SET k.TOTAL_REGISTROS = src.TOTAL_REGISTROS
    WHEN NOT MATCHED THEN
      INSERT (KPI_1_ID, ANIO, TOTAL_REGISTROS)
      VALUES (KPI_1_SEQ.NEXTVAL, src.ANIO, src.TOTAL_REGISTROS);
  END LOOP;

EXCEPTION
  WHEN OTHERS THEN
    -- Propagar error para verlo en la sesión llamadora
    RAISE;
END PROC_REGISTROS_POR_ANIO;
/
