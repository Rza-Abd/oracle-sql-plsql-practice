SET SERVEROUTPUT ON;

ACCEPT emp_id PROMPT 'Enter Employee ID: '

DECLARE
    v_name VARCHAR2(100);
    v_salary NUMBER;

BEGIN

    SELECT first_name || ' ' || last_name, salary
    INTO v_name, v_salary
    FROM employees
    WHERE employee_id = &emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || v_salary);

exception
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('Employee not found');

    when others then
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);


END;
/