--8장 테이블 생성/수정/삭제하기
create table dept (
    dno number(2),
    dname varchar2(14),
    loc varchar2(13) );
    
--서브쿼리를 이용해서 테이블 생성
create table dept2
as
select *
from department;

create table dept3
as
select *
from department
where 0=1;

--20번 부서 소속 사원에 대한 정보를 포함한 dept20 테이블 생성
create table dept20
as
select *
from employee
where dno=20;

create table dept30
as
select eno, ename, dno
from employee
where dno=30;

--테이블 구조를 변경하는 alter table문
--칼럼 추가
--dept20 테이블에 날짜타입을 가지는 birth 추가하기
alter table dept20
add( birth date );

select *
from dept20;

--칼럼 변경
--dept20 테이블의 사원 이름 칼럼 크기를 변경하기
alter table dept20
modify ename varchar2(30);

--칼럼 제거
--dept20 테이블의 직급 칼럼을 제거하기
alter table dept20
drop column job;

--dept20 테이블의 사원번호 제거하기 set unused
alter table dept20
set unused (eno);

select *
from dept20;

alter table dept20
drop unused columns;

--테이블 이름 변경 rename문
--dept20을 emp20으로 변경
rename dept20 to emp20;

--테이블 제거 drop table문
drop table emp20;

--테이블의 모든 데이터를 제거하는 truncate table문
truncate table dept2;

select table_name
from user_tables;

--데이터 사전 - 시스템 테이블의 집합
select owner, table_name
from all_tables;

--혼자 해보기
--1. 다음 표에 명시된 대로 DEPT 테이블을 생성하시오
drop table dept;

create table dept(
    dno number(2),
    dname varchar(14),
    loc varchar(13) );
    
--2. 다음 표에 명시된 대로 emp 테이블을 생성하시오
drop table emp;

create table emp(
    eno number(4),
    ename varchar(10),
    eno number(2) );

--3.긴 이름을 지정할 수 있도록 emp 테이블을 수정하시오(ENAME 칼럼의 크기).
alter table emp
modify ename varchar2(25);

--4.EMPLOYEE 테이블을 복사해서 EMPLOYEE2란 이름의 테이블을 생성하되 사원번호, 이름, 급여, 부서번호 칼럼만 복사하고 새로 생성된 테이블의 칼럼명은 각각 EMP_ID, NAME, SAL, DEPT_ID로 지정하시오.
create table employee2(emp_id, name, sal, dept_id)
as
select eno, ename, salary, ename, dno 
from employee;

--5.emp테이블을 삭제하시오.
drop table emp;

--6.EMPLOYEE2란 이름을 EMP로 변경하시오
rename employee2 to emp;

--7. DEPT 테이블에서 DNAME칼럼을 제거하시오
alter table dept
drop column dname;

--8.DEPT 테이블에서 LOC칼럼을 UNUSED로 표시하시오.
alter table dept
set unused (loc);

--9.UNUSED칼럼을 모두 제거하시오
alter table dept
drop unused columns;
