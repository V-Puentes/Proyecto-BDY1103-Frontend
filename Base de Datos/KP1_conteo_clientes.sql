--==============DECLARACIÓN===============--
DECLARE
    --CREACION DE VARIABLES
    V_RUN_CLI CLIENTE.RUN_CLI%TYPE;
    V_DV_RUN_CLI CLIENTE.DV_RUN_CLI%TYPE;
    V_NOMBRE_CLI CLIENTE.NOMBRE_CLI%TYPE;
    V_FECHA_NAC_CLI CLIENTE.FECHA_NAC_CLI%TYPE;
    V_DIREC_CLI CLIENTE.DIREC_CLI%TYPE;
    V_FECHA_REG_CLI CLIENTE.FECHA_REG_CLI%TYPE;
    TYPE tipo_conteo_anios IS_TABLE_OF NUMBER INDEX BY VARCHAR(20);
    V_CONTEO_A tipo conteo anios;

    --CREACION DE VARIABLES PARA OPERACIONES
    V_FREC_CLI NUMBER (4)
    V_TOTAL_CLI NUMBER(16);
    V_TOTAL_CLI_FREC NUMBER(15);
    
    --CURSOR PARA RECORRER LA TABLA CLIENTE
    CURSOR C_CLIENTE IS
        SELECT
            CLI.RUN_CLI,
            CLI.DV_RUN_CLI,
            CLI.NOMBRE_CLI,
            CLI.FECHA_NAC_CLI,
            CLI.DIREC_CLI,
            CLI.FECHA_REG_CLI,
            FREC_CLI AS COUNT(COM.CLIENTE_RUN_CLI)
        FROM
            CLIENTE CLI
        LELF JOIN COMPRA COM ON (CLI.RUN_CLI = COM.CLIENTE_RUN_CLI)
GROUP BY 
            CLI.RUN_CLI,
            CLI.DV_RUN_CLI,
            CLI.NOMBRE_CLI,
            CLI.FECHA_NAC_CLI,
            CLI.DIREC_CLI,
            CLI.FECHA_REG_CLI,
;
        
--================INICIO==================--
BEGIN
    -- Inicializar contadores
    V_TOTAL_CLI := 0;
    V_TOTAL_CLI_FREC := 0;
– inicializar valores para el record 
V_YEAR_COUNTS('2020 o antes') := 0;
	V_YEAR_COUNTS('2021') := 0;
	V_YEAR_COUNTS('2022') := 0;
	V_YEAR_COUNTS('2023') := 0;
	V_YEAR_COUNTS('2024') := 0;
	V_YEAR_COUNTS('Este año') := 0;
	V_YEAR_COUNTS('Otros años') := 0;


    --CICLO FOR PARA RECORRER LA TABLA CLIENTE
    FOR F_CLIENTE IN C_CLIENTE LOOP
        V_RUN_CLI := F_CLIENTE.RUN_CLI;
        V_DV_RUN_CLI := F_CLIENTE.DV_RUN_CLI;
        V_NOMBRE_CLI := F_CLIENTE.NOMBRE_CLI;
        V_FECHA_NAC_CLI := F_CLIENTE.FECHA_NAC_CLI;
        V_DIREC_CLI := F_CLIENTE.DIREC_CLI;
        V_FECHA_REG_CLI := F_CLIENTE.FECHA_REG_CLI;
        V_RUN_COMPRA := F_CLIENTE.CLIENTE_RUN_CLI;
        V_FREC_CLI := F_CLIENTE.FREC_CLI;

        V_TOTAL_CLI := V_TOTAL_CLI + 1;
     V_ANIO_REG_CLI := 
            CASE 
                WHEN EXTRACT(YEAR FROM V_FECHA_REG_CLI) <= “2020 o antes”
                WHEN EXTRACT(YEAR FROM V_FECHA_REG_CLI) = 2021 THEN 2021
                WHEN EXTRACT(YEAR FROM V_FECHA_REG_CLI) = 2022 THEN 2022
                WHEN EXTRACT(YEAR FROM V_FECHA_REG_CLI) = 2023 THEN 2023
                WHEN EXTRACT(YEAR FROM V_FECHA_REG_CLI) = 2024 THEN 2024
                WHEN EXTRACT(YEAR FROM V_FECHA_REG_CLI) = 2025 THEN “Este año”
                ELSE EXTRACT(YEAR FROM V_FECHA_REG_CLI)
            END;

        IF V_FREC_CLI >1 THEN
            V_TOTAL_CLI_FREC := V_TOTAL_CLI_FREC + 1;
END IF;
-- Calcular año de registro
    V_ANIO_REG_CLI := EXTRACT(YEAR FROM V_FECHA_REG_CLI);
  

        V_TOTAL_CLI := V_TOTAL_CLI + 1;

        IF V_FREC_CLI > 1 THEN
            V_TOTAL_CLI_FREC := V_TOTAL_CLI_FREC + 1;
        END IF;
    END LOOP;

    -- clientes registrados

DBMS_OUTPUT.PUT_LINE('======================================================');
DBMS_OUTPUT.PUT_LINE('CALCULO DE CANTIDAD DE CLIENTES');
DBMS_OUTPUT.PUT_LINE('======================================================');
DBMS_OUTPUT.PUT_LINE('Total de Clientes: '||V_TOTAL_CLI);
DBMS_OUTPUT.PUT_LINE('======================================================');
    DBMS_OUTPUT.PUT_LINE('2020 o antes: ' || V_YEAR_COUNTS('2020 o antes'));
    DBMS_OUTPUT.PUT_LINE('2021: ' || V_YEAR_COUNTS('2021'));
    DBMS_OUTPUT.PUT_LINE('2022: ' || V_YEAR_COUNTS('2022'));
    DBMS_OUTPUT.PUT_LINE('2023: ' || V_YEAR_COUNTS('2023'));
    DBMS_OUTPUT.PUT_LINE('2024: ' || V_YEAR_COUNTS('2024'));
    DBMS_OUTPUT.PUT_LINE('Este año: ' || V_YEAR_COUNTS('Este año'));
    DBMS_OUTPUT.PUT_LINE('Otros años: ' || V_YEAR_COUNTS('Otros años'));
    DBMS_OUTPUT.PUT_LINE('======================================================');

-clientes frecuentes
DBMS_OUTPUT.PUT_LINE('Total de Clientes Frecuentes: '||V_TOTAL_CLI_FREC);
DBMS_OUTPUT.PUT_LINE('======================================================');
-- MOSTRAR TOP 3 CLIENTES MÁS FRECUENTES
DBMS_OUTPUT.PUT_LINE('TOP 3 CLIENTES MÁS FRECUENTES:');
DBMS_OUTPUT.PUT_LINE('======================================================');

FOR I IN (SELECT * FROM C_CLIENTE WHERE ROWNUM <= 3) 
LOOP
    DBMS_OUTPUT.PUT_LINE('- ' || I.NOMBRE_CLI || ' (' || I.RUN_CLI || '-' || I.DV_RUN_CLI || 
                       ') - Compras: ' || I.FREC_CLI);
END LOOP;
DBMS_OUTPUT.PUT_LINE('======================================================');
                        
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron datos.');
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Se encontraron demasiadas filas.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inesperado.');
        DBMS_OUTPUT.PUT_LINE('Codigo de error: '||SQLERRM);
END;
