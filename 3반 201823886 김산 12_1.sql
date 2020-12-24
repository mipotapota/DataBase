--8�� ���̺� ����/����/�����ϱ�
create table dept (
    dno number(2),
    dname varchar2(14),
    loc varchar2(13) );
    
--���������� �̿��ؼ� ���̺� ����
create table dept2
as
select *
from department;

create table dept3
as
select *
from department
where 0=1;

--20�� �μ� �Ҽ� ����� ���� ������ ������ dept20 ���̺� ����
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

--���̺� ������ �����ϴ� alter table��
--Į�� �߰�
--dept20 ���̺� ��¥Ÿ���� ������ birth �߰��ϱ�
alter table dept20
add( birth date );

select *
from dept20;

--Į�� ����
--dept20 ���̺��� ��� �̸� Į�� ũ�⸦ �����ϱ�
alter table dept20
modify ename varchar2(30);

--Į�� ����
--dept20 ���̺��� ���� Į���� �����ϱ�
alter table dept20
drop column job;

--dept20 ���̺��� �����ȣ �����ϱ� set unused
alter table dept20
set unused (eno);

select *
from dept20;

alter table dept20
drop unused columns;

--���̺� �̸� ���� rename��
--dept20�� emp20���� ����
rename dept20 to emp20;

--���̺� ���� drop table��
drop table emp20;

--���̺��� ��� �����͸� �����ϴ� truncate table��
truncate table dept2;

select table_name
from user_tables;

--������ ���� - �ý��� ���̺��� ����
select owner, table_name
from all_tables;

--ȥ�� �غ���
--1. ���� ǥ�� ��õ� ��� DEPT ���̺��� �����Ͻÿ�
drop table dept;

create table dept(
    dno number(2),
    dname varchar(14),
    loc varchar(13) );
    
--2. ���� ǥ�� ��õ� ��� emp ���̺��� �����Ͻÿ�
drop table emp;

create table emp(
    eno number(4),
    ename varchar(10),
    eno number(2) );

--3.�� �̸��� ������ �� �ֵ��� emp ���̺��� �����Ͻÿ�(ENAME Į���� ũ��).
alter table emp
modify ename varchar2(25);

--4.EMPLOYEE ���̺��� �����ؼ� EMPLOYEE2�� �̸��� ���̺��� �����ϵ� �����ȣ, �̸�, �޿�, �μ���ȣ Į���� �����ϰ� ���� ������ ���̺��� Į������ ���� EMP_ID, NAME, SAL, DEPT_ID�� �����Ͻÿ�.
create table employee2(emp_id, name, sal, dept_id)
as
select eno, ename, salary, ename, dno 
from employee;

--5.emp���̺��� �����Ͻÿ�.
drop table emp;

--6.EMPLOYEE2�� �̸��� EMP�� �����Ͻÿ�
rename employee2 to emp;

--7. DEPT ���̺��� DNAMEĮ���� �����Ͻÿ�
alter table dept
drop column dname;

--8.DEPT ���̺��� LOCĮ���� UNUSED�� ǥ���Ͻÿ�.
alter table dept
set unused (loc);

--9.UNUSEDĮ���� ��� �����Ͻÿ�
alter table dept
drop unused columns;
