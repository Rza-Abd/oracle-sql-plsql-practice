/*create a procedure for show employee with who the user whants*/
create or replace procedure show_employee(
    p_employee_id IN number
)
AS
    v_first_name employees.first_name%type;
    v_last_name employees.LAST_NAME%TYPE;
    v_salary employees.SALARY%TYPE;
begin
    select first_name, last_name, SALARY
    into v_first_name, v_last_name, v_salary
    from EMPLOYEES
    where employee_id = p_employee_id;

    DBMS_OUTPUT.PUT_LINE(
        'Name:' || v_first_name || ' ' || v_last_name
    );
    DBMS_OUTPUT.PUT_LINE(
        'salary:' || v_salary
    );
end;

/*create a procedure for show all of employees*/
create or replace PROCEDURE show_employees
AS
BEGIN
    FOR emp IN (
        SELECT employee_id, first_name, last_name, salary
        FROM employees
        ORDER BY employee_id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            emp.employee_id || '-' ||
            emp.first_name || '-' ||
            emp.last_name || '-' ||
            emp.salary
        );

    END LOOP;
END;

/*show employees department who the user whants */
create or replace procedure show_employee_departmant(
    p_employee_id in number
)
as
    v_first_name EMPLOYEES.FIRST_NAME%TYPE;
    v_last_name employees.LAST_NAME%TYPE;
    v_departmant employees.DEPARTMANT%TYPE;
begin
    select first_name, last_name, departmant
    into v_first_name, v_last_name, v_departmant
    from EMPLOYEES
    where EMPLOYEE_ID = p_employee_id;

    dbms_output.put_line(
        'name: ' || v_first_name || ' ' || v_last_name || 'departmant: ' || v_departmant
    );
end;