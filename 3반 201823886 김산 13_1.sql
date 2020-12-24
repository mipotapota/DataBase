--9�� ������ ���۰� Ʈ���ȼ�
--���̺� ������ �߰��ϴ� Insert��
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

--�ٸ� ���̺��� ������ �����ϱ�
insert into dept2
select * from department;

select * from dept2;

--���̺��� ������ �����ϴ� update��
update dept2
set dname = 'programming'
where dno = 10;

update dept2
set dname = 'programming';

update dept2
set dname = 'computing', loc = 'seoul'
where dno = 10;

--10�� �μ��� �������� 60�� �μ��� ���������� ����
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

--���̺��� ������ �����ϴ� delete��
delete dept
where dno = 10;

delete dept2;

insert into emp
select * from employee;

select * from emp;

--�����ο� �ٹ��ϴ� ��� ����
delete emp
where dno = ( select dno
                from department
                where dname = 'SALES');

delete emp;

rollback;

--ȥ���غ���
--1��
create table emp_insert
as
select * from employee where 1 = 0;

--2��
inner into emp_insert
values(1, 'KIMSAN', 'STUDENT', null, sysdate, 9999, 9999, 10);

--3��
insert into emp_insert
values(2, 'LEEJH', 'SOLDIER', null,
        to_date(sysdate-1, 'YY/MM/DD'), 1150, null, 20);
        
--4��
create table emp_copy
as
select *from employee;

--5��
update emp_copy
set dno=10
where eno = 7788;

--6��
update emp_copy
set(job, salary) = (select job, salary
                    from emp_copy
                    where eno = 7499)
where eno = 7788;

--7��
update emp_copy
set dno = (select dno
            from emp_copy
            where eno=7369)
where job = (select job
            from emp_copy
            where eno = 7369);
            
--8��
create table dept_copy
as
select * from department;

--9��
delete from dept_copy
where dname = 'RESEARCH';

--10��
delete from dept_copy
where dno in(10, 40);