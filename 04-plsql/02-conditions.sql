SET SERVEROUTPUT ON;

DECLARE

    v_avg_salary NUMBER;

BEGIN

    SELECT  AVG(salary)
    INTO  v_avg_salary
    FROM employees;

    IF v_avg_salary > 40000000 THEN
        DBMS_OUTPUT.PUT_LINE('Above 40 million');

    ELSIF v_avg_salary < 40000000 THEN
        DBMS_OUTPUT.PUT_LINE('Below 40 million');

    ELSE
        DBMS_OUTPUT.PUT_LINE('Equal to 40 million');
    END IF;
END;
/