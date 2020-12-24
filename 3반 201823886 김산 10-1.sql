--1. EQUI조인을 사용하여 SCOTT사원의 부서번호와 부서이름을 출력하시오.
select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

select e.ename, e.dno, d.dname
from employee e join department d
on e.dno = d.dno
where ename = 'SCOTT';
--2. INNER JOIN과 ON연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
select e.ename, d.dname, loc
from employee e join department d
on e.dno = d.dno;

--3. INNER JOIN과 USING연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유 목록(한 번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
select dno, job, loc
from employee e join department d
using(dno)
where dno = 10;

--4. NATURAL JOIN을 사용하여 커미션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력하시오.
select e.ename, d.dname, loc
from employee e join department d
on e.dno = d.dno
where commission>0;

--5. EQUI조인과 WildCard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select e.ename, d.dname
from employee e join department d
on e.dno = d.dno
where e.ename like '%A%';

--6. NATURAL JOIN을 사용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select e.ename, d.dname, job, e.dno
from employee e join department d
on e.dno = d.dno
where d.loc='NEW YORK';

--7.SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오. 단 각 열의 별칭은 결과 화면과 같도록 하시오.
select emp.ename as "Employee",
    emp.manager as "Emp#",
    mgr.eno as "Manager",
    mgr.ename as "Mgr#"
from employee emp, employee mgr
where emp.manager = mgr.eno;

select emp.eno, emp.ename, mgr.eno, mgr.ename
from employee emp, employee mgr
where emp.manager = mgr.eno;

--8. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select emp.ename as "Employee",
    emp.manager as "Emp#",
    mgr.eno as "Manager",
    mgr.ename as "Mgr#"
from employee emp, employee mgr
where emp.manager = mgr.eno(+)
order by emp.eno desc;

select emp.eno, emp.ename, mgr.eno, mgr.ename
from employee emp left outer join employee mgr
on emp.manager = mgr.eno
order by emp.eno desc;

--9. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. 단, 각 열의 변칭은 이름, 부서번호, 동료로 하시오.
select e.ename as 이름, e.dno as 부서번호, d.ename as 동료
from employee e join employee d
on e.dno = d.dno
where e.ename = 'SCOTT'
and d.ename != 'SCOTT';

select me.ename, me.dno, other.ename as "동료"
from employee me join employee other
on me.dno = other.dno
where me.ename = 'SCOTT'
and other.ename != 'SCOTT';

--10. SELF JOIN을 사용하여 WARD사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select e.ename, e.hiredate
from employee WARD join employee e
on ward.ename = 'WARD'
where e.hiredate>WARD.hiredate
order by hiredate;

-- join 방법4 - join ~ on
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno -- 조인 조건
where eno = 7788; -- 검색 조건

--서브쿼리
--SCOTT과 동일한 부서에서 근무하는 사원 검색
select ename, dno
from employee
where dno = ( select dno
              from employee
              where ename = 'SCOTT' );
              
--최소 급여를 받은 사원의 이름, 담당 업무, 급여 검색
select ename, job, salary
from employee
where salary = ( select min(salary)
                from employee );
                
--30번 부서에서 최소 급여를 구한 후, 부서별 최소 급여가 구한 최소 급여보다 큰 부서만 검색
select dno, min(salary)
from employee
group by dno
having min(salary) > ( select min(salary)
                       from employee
                       where dno=30 );