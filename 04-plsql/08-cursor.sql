/
declare
    cursor emp_cursor is
        select first_name, last_name, salary
        from employees;

    v_first_name    employees.first_name%type;
    v_last_name     employees.last_name%type;
    v_salary        employees.salary%type;

begin
    open emp_cursor;

        loop
            fetch emp_cursor
            into v_first_name, v_last_name, v_salary;

            exit when emp_cursor%notfound;

            dbms_output.put_line(
                v_first_name||' '||
                v_last_name||' '||
                v_salary
            );
        end loop;

    close emp_cursor;
end;
/
-----------------------------------------------------
declare

    v_first_name    employees.first_name%type;
    v_last_name     employees.last_name%type;

    cursor emp_id_name (t_employee_id number) is
        select first_name, last_name from employees
        where employee_id = t_employee_id;

begin
    open emp_id_name(1);

        loop
            fetch emp_id_name
            into v_first_name, v_last_name;
            exit when emp_id_name%notfound;
            DBMS_OUTPUT.PUT_LINE(v_first_name || v_last_name);
        end loop;
    close emp_id_name;
end;
/