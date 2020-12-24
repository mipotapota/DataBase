--최소 급여를 받는 사원번호와 이름 검색
select eno, ename, salary
from employee
where salary = ( select min(salary)
                from employee );

--부서별 최소 급여를 받는 사원번호와 이름 검색
select eno, ename, salary, dno
from employee
where salary in ( select min(salary)
                 from employee
                 group by dno )
order by dno;

--직급이 SALESMAN이 아니면서 급여가 임의의 SALESMAN 보다 낮은 사원 검색
-- < any : 최대값보다 작음
select eno, ename, job, salary
from employee
where salary < any ( select salary
                     from employee
                     where job = 'SALESMAN' )
and job <> 'SALESMAN';

--직급이 SALESMAN이 아니면서 급여가 SALESMAN 보다 낮은 사원 검색
-- < all : 최소값보다 작음
select eno, ename, job, salary
from employee
where salary < all ( select salary
                     from employee
                     where job = 'SALESMAN' )
and job <> 'SALESMAN';

--1. 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원이름과 담당 업무)하시오.
select ename, job
from employee
where job = ( select job
from employee
where eno = 7788 );
--2. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시(사원이름과 담당 업무)하시오.
select ename, job
from employee
where salary > (select salary
                from employee
                where eno = 7499);
                
--3. 최소 급여를 받는 사원의 이름, 담당 업무 및 급여를 표시하시오(그룹함수 사용).
select ename, job, salary
from employee
where salary = (select 
                min(salary)
                from employee);
--4. 직급별 평균 급여가 가장 적은 사원의 담당 업무를 찾아 직급별 평균 급여를 표시하시오.
select job, round(avg(salary), 1)
from employee
group by job
having round(avg(salary), 1) = (select min(round(avg(salary), 1))
                                from employee
                                group by job);
                                
--5. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select ename, salary, dno
from employee
where salary in (select min(salary)
                from employee
                group by dno);
                
--6. 담당 업무가 모든 ANALYST인 사원보다 급여가 적으면서 업무가 모든 ANALAYST가 아닌 사원들을 표시(사원번호, 이름, 담당업무, 급여)하시오.
select eno, ename, job, salary
from employee
where salary < any(select salary
                   from employee
                   where job='ANALYST')
and job <> 'ANALYST';

--7. 부하직원이 없는 사원의 이름을 표시하시오.
 select ename
 from employee
 where eno in (select eno
               from employee
               where manager is null);
 
--8. 부하직원이 있는 사원의 이름을 표시하시오.
select ename
from employee
where eno in (select eno
              from employee
              where manager is not null);
              
--9. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오. (단, BLAKE는 제외)
select ename, hiredate
from employee
where dno = (select dno
             from employee
             where ename = 'BLAKE')
and ename <> 'BLAKE';

--10. 급여가 평균 급여 보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.
select eno, ename
from employee
where salary > (select avg(salary)
                from employee)
                order by salary asc;
                
--11. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하는 질의를 작성하시오.
select eno, ename
from employee
where dno in (select dno
              from employee
              where ename like '%K%');

--12. 부서 위치가 DALLAS인 사원의 이름과 부서번호 및 담당 업무를 표시하시오.
select ename, dno, job
from employee
where dno = (select dno
             from department
             where loc = 'DALLAS');
             
--13. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select ename, salary
from employee
where manager = (select eno
                 from employee
                 where ename = 'KING');

--14. PESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.
select dno, ename, job
from employee
where dno = (select dno
             from department
             where dname = 'RESEARCH');
             
--15. 평균 급여 보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시하시오.
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in(select dno
           from employee
           where ename like '%M%');

--16. 평균 급여가 가장 적은 업무를 찾으시오.
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                      from employee
                      group by job);