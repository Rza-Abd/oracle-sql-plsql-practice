CREATE OR REPLACE TRIGGER trg_check_salary
BEFORE INSERT OR UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    if :NEW.salary < 0 then
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    end if;
END;
/
