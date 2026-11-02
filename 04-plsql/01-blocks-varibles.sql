SET SERVEROUTPUT ON;

DECLARE

    v_define VARCHAR2(20) := 'salary of emplyee';
    v_name VARCHAR2(20);
    v_salary employees.salary%TYPE;
    v_id NUMBER := &ENTER_ID;

BEGIN
    
    SELECT first_name || last_name, salary
    INTO v_name, v_salary
    FROM employees
    WHERE employee_id = v_id;


    DBMS_OUTPUT.PUT_LINE(v_define);
    DBMS_OUTPUT.PUT_LINE('employee name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('salary: ' || v_salary);

END;
/


