-- join : 여러 테이블에서 필요한 정보만 가져와서, 가상의 테이블을 만들어 결과를 보여주는 것
select *
from employee, department
where employee.dno = department.dno;

-- join 방법1 - ,
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno -- 조인 조건
and eno = 7788; -- 검색 조건

-- join 방법2 - natural join
select e.eno, e.ename, e.job, dno, d.dname, d.loc
from employee e natural join department d
where eno = 7788;

-- join 방법3 - join ~ using
select e.eno, e.ename, e.job, dno, d.dname, d.loc
from employee e join department d
using (dno) -- 조인 조건
where eno = 7788; -- 검색 조건

-- join 방법4 - join ~ on
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno -- 조인 조건
where eno = 7788; -- 검색 조건

-- non-equl join
--사원별로 급여 등급 검색
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between s.losal and s.hisal
and s.grade = 3;

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between s.losal and s.hisal
where s.grade = 3;

-- 사원별로 급여 등급 검색, 부서명 포함
select e.ename, e.salary, s.grade, d.dname
from employee e, salgrade s, department d
where e.salary between s.losal and s.hisal
and e.dno = d.dno;

select e.ename, e.salary, s.grade, d.dname
from employee e join salgrade s join department d
on e.salary between s.losal and s.hisal
join department d
and e.dno = d.dno;

-- self join
select e.ename as 사원이름, m.ename as 직속상관이름
from employee e, employee m
where e.manager = m.eno;

select e.ename as 사원이름, m.ename as 직속상관이름
from employee e join employee m
on e.manager = m.eno;

select e.ename || '의 직속 상관은 ' || m.ename || '입니다.'
from employee e join employee m
on e.manager = m.eno;

-- outer join
select e.ename || '의 직속 상관은 ' || m.ename || '입니다.'
from employee e left outer join employee m
on e.manager = m.eno;