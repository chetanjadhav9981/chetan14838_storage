-- 1. List all manager data
SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB='MANAGER';

-- 2. List all employees who are working as manager or analyst or clerk
SELECT EMPNO,ENAME,JOB FROM EMP WHERE JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST';

-- 3. List emp who are earning sal between 3000 and 5000 (inclusive of limit)
SELECT EMPNO,ENAME,SAL FROM EMP WHERE SAL>=3000 AND SAL<=5000;

-- 4. List emp who are working as manager or analyst or clerk and earning between 3000 and 5000
SELECT EMPNO,ENAME,JOB,SAL FROM EMP 
WHERE 
(JOB='CLERK'OR JOB='MANAGER' OR JOB='ANALYST' )AND
SAL BETWEEN 3000 AND 5000;

-- 5. List all emp who are earning comm
select * from emp where COMM is NULL;

-- 6. List all emp whose comm is not null
select * from emp where COMM is NOT NULL;

-- 7. List all employees whose name starts with S
select * from emp where ename like 'S%'; 

-- 8. List all employees whose name ends with R
select * from emp where ename like '%R'; 

-- 10. List all employees whose name contains A as second letter
select * from emp where ename like '_A%'; 

-- 11. List all employees whose name starts with either M or S
select * from emp where ename like 'M%' or 'S%'; 

-- 12. List all employees whose name starts between A to M
select * from emp where ename between 'a' and 'm';

-- 13. List all employees whose name contains _
select * from emp where ename like '%_';

-- 14. List all employees who are working as manager in either dept 10 or 20 and all clerk for dept 30
select * from emp where job ='manager' and deptno in ('10','20') or job ='clerk' and deptno = 30;

-- 15. List ename, sal and bonus as 10% of salary
select ename, sal, (sal*10/100) as bonus from emp;

-- 16. List emp data as per the ascending order of name
SELECT *
FROM emp 
ORDER BY ename ASC;

-- 17. List all as per their salary highest to lowest
select * from emp order by sal desc;

-- 18. List emp as per their dept, with in dept highest to lowest sal
select *  from emp group by deptno order by sal desc;

-- 19. List top 3 highest paid emp
select * from emp order by sal desc limit 3;

-- 20. Return rank based on specified criteria if two emp have same salary they both get same number and next number will be skipped
select empno, ename, deptno, sal,
rank() over(partition by deptno order by sal desc) as 'rank' from emp;

-- 21. List the different job name
select distinct job from emp;

-- 22. List total organization salary
SELECT SUM(sal) AS "Total Salary" FROM emp;

-- 23. List dept wise total salary
select sum(sal), deptno from emp group by DEPTNO;

-- 24. List Jobwise emp count
SELECT job, COUNT(*)
FROM emp
GROUP BY job;

-- 25. List all emp who have joined in month of Feb
Select * from EMP where month(hiredate)='02';

-- 26. List emp count joined between 1981 and 1983
SELECT * 
    FROM emp 
       WHERE HIREDATE  
         BETWEEN '1981-01-01' 
            AND '1983-12-31';

-- 27. List how many years of service completed by each employee arrange based on tenure highest to lowest
select ENAME, year(now())-year(hiredate) as 'Tenure' from emp order by tenure desc;

-- 29. Return consecutive ranking values based on specified criteria 
select empno, ename, deptno, sal,
dense_rank() over(partition by deptno order by sal desc) as 'rank' from em
