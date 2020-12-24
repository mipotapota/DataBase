--10�� ������ ���Ἲ�� ��������
create table dept100 (
    dno number(20) constraint dept100_dno_pk primary key, --���̺��_Į����_������������
    dname varchar(14) constraint dept100_dname_nn not null,
    loc varchar2(13) );
    
create table dept200 (
    dno number(20) , --
    dname varchar(14) constraint dept200_dname_nn not null, --Į�� ����
    loc varchar2(13),
    constraint dept200_dno_pk primary key(dno) ); --���̺� ����
    
create table emp100 (
    eno number(4) constraint emp100_eno_pk primary key,
    ename varchar2(20) constraint emp100_ename_nn not null,
    job varchar2(20),
    salary number(10) constraint emp100_salary_chk check (salary > 0),
    dno number(2) constraint emp100_dno_fk references department ) ;
    
insert into emp100
values (1000, 'candy', 'manaver', 100, 10);

insert into emp100
values (2000, 'babi', null, 100, 10);

insert into emp100
values (3000, 'babi', null, 100, 40);

select *
from emp100;

--�������� �߰�/����/����
alter table dept100
add constraint dept100_loc_nn unique(loc);

alter table dept100
modify loc constraint dept100_loc_nn not null;

alter table dept100
drop unique(loc);