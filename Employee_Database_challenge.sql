
-- Deliverable 1

-- Create retirement_titles table
SELECT employees.emp_no AS emp_no, first_name, last_name, title, from_date, to_date
    INTO retirement_titles
    FROM employees INNER JOIN titles
        ON titles.emp_no = employees.emp_no
    WHERE employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
    ORDER BY employees.emp_no;


SELECT emp_no, first_name, last_name, title
	FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no, to_date) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- get counts of retiring employees by job title
SELECT COUNT(emp_no) AS count, title
    INTO retiring_titles
    FROM unique_titles
    GROUP BY title
    ORDER BY count DESC;
