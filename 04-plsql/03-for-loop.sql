SET serveroutput ON;

BEGIN

    FOR emp in (
        SELECT first_name, last_name, salary
        FROM employees
        )
    LOOP DBMS_OUTPUT.PUT_LINE(
        'name: ' || emp.first_name ||
        '  last name: ' || emp.last_name ||
        '  salary: ' || emp.salary
        );
    END LOOP;
        
END;
/