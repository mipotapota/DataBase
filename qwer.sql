create table student(
    studentNo number(20) not null,
    name varchar2(20) not null,
    telNo varchar2(20) not null,
    department varchar2(20) not null,
    room number(20) not null,
    studentPo number(20) not null
);
alter table student
add constraint pk_student primary key(studentNo);
-------------------------------------------------------------------------------
create table details(
    pointNo number(20) not null,
    indate date not null,
    point number(20) not null,
    content varchar2(20) not null,
    studentNo number(20) not null
);
alter table details
add constraint pk_details primary key(pointNo);

alter table details
add constraint fk_details foreign key(studentNo)
references student(studentNo);
-------------------------------------------------------------------------------
create table manager(
    managerNo number(20) not null,
    managerName varchar2(20) not null,
    managerTel varchar(20) not null
);

alter table manager
add constraint pk_manager primary key(managerNo);
-------------------------------------------------------------------------------
insert into student
values('201823886', '���', '010-2434-9170', '�����Ϻ����', '421', '0');
insert into student
values('201886030', '���¼�', '010-2434-9170', '��ǻ��������', '420', '0');
insert into student
values('201838674', '������', '010-7794-9169', '�����Ϻ����', '419', '0');
insert into student
values('201752072', '�����', '010-2475-9696', '���ڰ�', '421', '0');
insert into student
values('201925123', '������', '010-6374-1037', '��ǻ��������', '422', '0');
-------------------------------------------------------------------------------
insert into details
values(1, sysdate, 2, '������������', 201823886);
insert into details
values(2, sysdate, 2, '�ҷ��л����', 201886030);
insert into details
values(3, sysdate, -2, '���ܹܿ�', 201838674);
insert into details
values(4, sysdate, -2, '��û��', 201752072);
insert into details
values(5, sysdate, 2, 'û��', 201823886);
-------------------------------------------------------------------------------
insert into manager
values('1', '������', '051-860-3217');
insert into manager
values('2', '������', '051-860-3214');
insert into manager
values('3', '���ȿ', '051-860-3215');
insert into manager
values('4', '�����', '051-860-3213');
insert into manager
values('5', '����', '051-860-3210');
-----------------------------�⺻select��----------------------------------------
select *
from student;

select *
from details;

select *
from manager;

------------------------------�⺻where��---------------------------------------
select *
from student
where substr(studentNo, 1, 4) = '2018';

select *
from manager
where managerName = '����';

---------------------------------join��-----------------------------------------
select *
from student, details
where student.studentNo = details.studentNo;

select *
from student, details
where student.studentNo = details.studentNo
and name = '���';

--------------------------------�׷��ռ�-----------------------------------------
select count(*) as "�л��� ��"
from student;

select count(room) as "ȣ���� ��"
from student;

select studentNo, name, sum(studentPo) as �������
from student
group by studentNo, name
order by studentNo, name;

select department as �а�, count(*) as ��
from student
group by department
order by department asc;

select room as ȣ��, count(*) as ��
from student
group by room
order by room asc;

---------------------------------having-----------------------------------------
select studentNo, max(studentPo)
from student
group by studentNo
having max(studentPo) >= 2;

---------------------------------���� ����---------------------------------------
select studentNo, name, department
from student
where department = (select department
                    from student
                    where name = '���');

select studentNo, name, department
from student
where department = (select department
                    from student
                    where name = '���¼�');                    
                    
select studentNo, name, studentPo
from student
where studentPo = ( select max(studentPo)
                    from student );
                    
select studentNo, name, studentPo
from student
where studentPo = ( select min(studentPo)
                    from student );
                    
select studentno, name, studentPo
from student
where studentPo > ( select studentPo
                    from student
                    where name = '������');
                    
select studentno, name, studentPo
from student
where studentPo < ( select studentPo
                    from student
                    where name = '������');
                    
----------------------------------Ʈ����-----------------------------------------
delete from details; --����

--insert into details
--values(1, sysdate, 2, '������������', 201823886);

select * from student;

create or replace trigger trg_point
after insert
on details
for each row
begin
    update student
    set student.studentPo = (student.studentPo + :new.point)
    where student.studentNo = :new.studentNo;
end;
/