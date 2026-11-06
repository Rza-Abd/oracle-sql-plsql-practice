/*Package Specification*/

create or replace package emp_pkg as

    procedure show_employee(p_emp_id in number);

    function get_emp_salary(p_emp_id in number)
        return number;

end emp_pkg;
/

/*Package Body*/

create or replace package Body emp_pkg as

    procedure show_employee(p_emp_id in number)
    is
        v_name varchar2(100);
        v_salary number;
    begin 
        select first_name || last_name, salary
        into v_name, v_salary
        from employees
        where employee_id = p_emp_id;

        dbms_output.put_line('name: '||v_name);
        dbms_output.put_line('salary: '||v_salary);

        exception
            when no_data_found then
                dbms_output.put_line('Employee not found');
    end show_employee;

    function get_emp_salary(p_emp_id in number)
    return number
    is
        v_salary number;
    begin
        select salary
        into v_salary
        from employees
        where employee_id = p_emp_id;

        return v_salary;
    exception 
        when no_data_found then
            dbms_output.put_line('Employee not found');

    end get_emp_salary;

end emp_pkg;
/