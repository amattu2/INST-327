---Assignment 5, Q1
---Recursive CTE
USE ex;


WITH RECURSIVE management_cte (employee_id, employee_name, department_number, manager_id) AS (
    SELECT       
        employee_id, 
        CONCAT(first_name, " ", last_name) AS employee_name,
            department_number,
        manager_id
    FROM employees
    WHERE manager_id IS NULL
    UNION ALL
    SELECT 
        e.employee_id, 
        CONCAT(e.first_name, " ", e.last_name) AS employee_name,
            e.department_number,
        e.manager_id
    FROM employees e
    INNER JOIN management_cte o ON o.employee_id = e.manager_id
)


SELECT ct.employee_id, ct.employee_name, dp.department_name, CONCAT(em.first_name, " ", em.last_name) AS manager_name
FROM management_cte ct
LEFT JOIN departments dp ON (ct.department_number = dp.department_number)
LEFT JOIN employees em ON (ct.manager_id = em.employee_id);