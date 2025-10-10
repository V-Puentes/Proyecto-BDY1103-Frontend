CREATE OR REPLACE PROCEDURE PROC_REGISTROS_POR_ANIO IS
    v_count_2020 NUMBER(4);
    v_count_2021 NUMBER(4);
    v_count_2022 NUMBER(4);
    v_count_2023 NUMBER(4);
    v_count_2024 NUMBER(4);
    v_count_2025 NUMBER(4);
    v_total_cli NUMBER(4);
BEGIN
    -- Obtener año actual
    v_count_2020 := 0;
    v_count_2021 := 0;
    v_count_2022 := 0;
    v_count_2023 := 0;
    v_count_2024 := 0;
    v_total_cli := 0;
    v_count_2025 :=2025;
    
    -- Limpiar tabla KPI_1
    DELETE FROM KPI_1;
    
    -- Calcular conteos directamente con SQL
    SELECT 
        COUNT(CASE WHEN EXTRACT(YEAR FROM FECHA_REG_CLI) <= 2020 THEN 1 END),
        COUNT(CASE WHEN EXTRACT(YEAR FROM FECHA_REG_CLI) = 2021 THEN 1 END),
        COUNT(CASE WHEN EXTRACT(YEAR FROM FECHA_REG_CLI) = 2022 THEN 1 END),
        COUNT(CASE WHEN EXTRACT(YEAR FROM FECHA_REG_CLI) = 2023 THEN 1 END),
        COUNT(CASE WHEN EXTRACT(YEAR FROM FECHA_REG_CLI) = 2024 THEN 1 END),
        COUNT(CASE WHEN EXTRACT(YEAR FROM FECHA_REG_CLI) = 2025 THEN 1 END),
        v_total_cli
    INTO 
        v_count_2020,
        v_count_2021,
        v_count_2022,
        v_count_2023,
        v_count_2024,    
        v_count_2025,
        v_total_cli
    FROM CLIENTE;
    
    -- Mostrar los valores para debug
    DBMS_OUTPUT.PUT_LINE('Total clientes: ' || v_total_cli);
    DBMS_OUTPUT.PUT_LINE('2020 o antes: ' || v_count_2020);
    DBMS_OUTPUT.PUT_LINE('2021: ' || v_count_2021);
    DBMS_OUTPUT.PUT_LINE('2022: ' || v_count_2022);
    DBMS_OUTPUT.PUT_LINE('2023: ' || v_count_2023);
    DBMS_OUTPUT.PUT_LINE('2024: ' || v_count_2024);
    DBMS_OUTPUT.PUT_LINE('2025: ' || v_count_2025);
    
    -- Insertar datos
    INSERT INTO KPI_1 (KPI_1_ID, ANIO, TOTAL_REGISTROS) 
    VALUES (KPI_1_SEQ.NEXTVAL, '2020 o antes', v_count_2020);
    
    INSERT INTO KPI_1 (KPI_1_ID, ANIO, TOTAL_REGISTROS) 
    VALUES (KPI_1_SEQ.NEXTVAL, '2021', v_count_2021);
    
    INSERT INTO KPI_1 (KPI_1_ID, ANIO, TOTAL_REGISTROS) 
    VALUES (KPI_1_SEQ.NEXTVAL, '2022', v_count_2022);
    
    INSERT INTO KPI_1 (KPI_1_ID, ANIO, TOTAL_REGISTROS) 
    VALUES (KPI_1_SEQ.NEXTVAL, '2023', v_count_2023);
    
    INSERT INTO KPI_1 (KPI_1_ID, ANIO, TOTAL_REGISTROS) 
    VALUES (KPI_1_SEQ.NEXTVAL, '2024', v_count_2024);
    
    INSERT INTO KPI_1 (KPI_1_ID, ANIO, TOTAL_REGISTROS) 
    VALUES (KPI_1_SEQ.NEXTVAL, '2025', v_count_2025);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Inserción en KPI_1 completada.');
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error en PROC_REGISTROS_POR_ANIO: ' || SQLERRM);
        RAISE;
END PROC_REGISTROS_POR_ANIO;
/