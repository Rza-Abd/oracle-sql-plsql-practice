create or replace package department_pkg as

    procedure show_dep_emp(p_emp_id in number);

    function get_dep_count(p_dep in varchar2)
        return number;

end department_pkg;
/

create or replace package body department_pkg as

    procedure show_dep_emp(p_emp_id in number)
    is
        v_dep varchar2(10);
    begin
        select departmant
        into v_dep
        from employees
        where employee_id = p_emp_id;

        dbms_output.put_line(v_dep);

        exception
            when no_data_found then
                dbms_output.put_line('employee not found');
    end show_dep_emp;

    function get_dep_count(p_dep in varchar2)
    return number
    is
        v_count number;
    begin
        select count(*)
        into v_count
        from employees
        where departmant = p_dep;

        return v_count;

        exception 
            when no_data_found then
                dbms_output.put_line('not such dep');

    end get_dep_count;

end department_pkg;
/
