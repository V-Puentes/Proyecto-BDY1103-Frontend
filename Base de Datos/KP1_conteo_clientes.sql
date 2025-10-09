--==============DECLARACIÓN===============--
DECLARE
    --CREACION DE VARIABLES
    V_RUN_CLI CLIENTE.RUN_CLI%TYPE;
    V_DV_RUN_CLI CLIENTE.DV_RUN_CLI%TYPE;
    V_NOMBRE_CLI CLIENTE.NOMBRE_CLI%TYPE;
    V_FECHA_NAC_CLI CLIENTE.FECHA_NAC_CLI%TYPE;
    V_DIREC_CLI CLIENTE.DIREC_CLI%TYPE;
    V_FECHA_REG_CLI CLIENTE.FECHA_REG_CLI%TYPE;
    V_RUN_COMPRA COMPRA.CLIENTE_RUN_CLI%TYPE;

    --CREACION DE VARIABLES PARA OPERACIONES
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
            COM.CLIENTE_RUN_CLI
        FROM
            CLIENTE CLI
        JOIN COMPRA COM ON (CLI.RUN_CLI = COM.CLIENTE_RUN_CLI);
        
--================INICIO==================--
BEGIN
    -- Inicializar contadores
    V_TOTAL_CLI := 0;
    V_TOTAL_CLI_FREC := 0;

    --CICLO FOR PARA RECORRER LA TABLA CLIENTE
    FOR F_CLIENTE IN C_CLIENTE LOOP
        V_RUN_CLI := F_CLIENTE.RUN_CLI;
        V_DV_RUN_CLI := F_CLIENTE.DV_RUN_CLI;
        V_NOMBRE_CLI := F_CLIENTE.NOMBRE_CLI;
        V_FECHA_NAC_CLI := F_CLIENTE.FECHA_NAC_CLI;
        V_DIREC_CLI := F_CLIENTE.DIREC_CLI;
        V_FECHA_REG_CLI := F_CLIENTE.FECHA_REG_CLI;
        V_RUN_COMPRA := F_CLIENTE.CLIENTE_RUN_CLI;

        V_TOTAL_CLI := V_TOTAL_CLI + 1;

        IF V_RUN_COMPRA==V_RUN_CLI THEN
            V_TOTAL_CLI_FREC := V_TOTAL_CLI_FREC + 1;
        END IF;
        
    END LOOP;

    -- Mostrar resultados después del loop
    DBMS_OUTPUT.PUT_LINE('======================================================');
    DBMS_OUTPUT.PUT_LINE('CALCULO DE CANTIDAD DE CLIENTES');
    DBMS_OUTPUT.PUT_LINE('======================================================');
    DBMS_OUTPUT.PUT_LINE('Total de Clientes: '||V_TOTAL_CLI);
    DBMS_OUTPUT.PUT_LINE('Total de Clientes Frecuentes: '||V_TOTAL_CLI_FREC);
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
/