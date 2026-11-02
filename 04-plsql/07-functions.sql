    /*create function of geting employees salary*/

create or replace function get_employee_salary(
    p_employee_id in number
)
return number
as
    v_salary employees.salary%type;
begin
    select salary
    into v_salary
    from employees
    where employee_id  = p_employee_id;

    return v_salary;

exception 
    WHEN  NO_DATA_FOUND then
    return NULL;

end;

    /* geting full name of employee with id*/

create or replace function get_full_name(
    p_employee_id in number
)
return varchar2
as
    v_first_name employees.first_name%type;
    v_last_name employees.last_name%type;
begin
    select first_name, last_name
    into v_first_name, v_last_name
    from employees
    where employee_id = p_employee_id;

    return  v_first_name || v_last_name;
end;
/