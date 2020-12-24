--9장 데이터 조작과 트랜픽션
--테이블에 내용을 추가하는 Insert문
insert into dept2
values (10, 'accounting', 'new york');

insert into dept2 (dno, loc, dname)
values (20, 'dallas', 'research');

insert into dept2 (dno, dname)
values (30, 'sales');

insert into dept2
values (40, 'operations', null);

insert into dept2
values (60, 'computing2','');

select * from dept2;

create table emp
as
select *
from employee
where 1=0;

insert into emp
values (7000, 'candy', null, null, to_date('2015-05-01', 'yyyy-mm-dd'), null, null, 10);

insert into emp
values (8000, 'tom', null, null, sysdate, null, null, 20);

insert into emp
values (9000, 'jerry', null, null, sysdate-1, null, null, 30);

select * from emp;

--다른 테이블에서 데이터 복사하기
insert into dept2
select * from department;

select * from dept2;

--테이블의 내용을 수정하는 update문
update dept2
set dname = 'programming'
where dno = 10;

update dept2
set dname = 'programming';

update dept2
set dname = 'computing', loc = 'seoul'
where dno = 10;

--10번 부서의 지역명을 60번 부서의 지역명으로 변경
update dept2
set loc = ( select loc
            from dept2
            where dno = 60 )
where dno = 10;

update dept2
set loc = (select loc
            from dept2
            where dno = 60) ,
        dname = (select dname
                from dept2
                where dno = 60)
where dno = 10;

update dept2
set (dname, loc) = (select dname, loc
                    from dept
                    where dno = 60)
where dno = 10;

select *from dept2;

--테이블의 내용을 삭제하는 delete문
delete dept
where dno = 10;

delete dept2;

insert into emp
select * from employee;

select * from emp;

--영업부에 근무하는 사원 삭제
delete emp
where dno = ( select dno
                from department
                where dname = 'SALES');

delete emp;

rollback;

--혼자해보기
--1번
create table emp_insert
as
select * from employee where 1 = 0;

--2번
inner into emp_insert
values(1, 'KIMSAN', 'STUDENT', null, sysdate, 9999, 9999, 10);

--3번
insert into emp_insert
values(2, 'LEEJH', 'SOLDIER', null,
        to_date(sysdate-1, 'YY/MM/DD'), 1150, null, 20);
        
--4번
create table emp_copy
as
select *from employee;

--5번
update emp_copy
set dno=10
where eno = 7788;

--6번
update emp_copy
set(job, salary) = (select job, salary
                    from emp_copy
                    where eno = 7499)
where eno = 7788;

--7번
update emp_copy
set dno = (select dno
            from emp_copy
            where eno=7369)
where job = (select job
            from emp_copy
            where eno = 7369);
            
--8번
create table dept_copy
as
select * from department;

--9번
delete from dept_copy
where dname = 'RESEARCH';

--10번
delete from dept_copy
where dno in(10, 40);