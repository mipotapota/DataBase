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
values('201823886', '김산', '010-2434-9170', '관광일본어과', '421', '0');
insert into student
values('201886030', '김태선', '010-2434-9170', '컴퓨터정보과', '420', '0');
insert into student
values('201838674', '조열휘', '010-7794-9169', '관광일본어과', '419', '0');
insert into student
values('201752072', '김법성', '010-2475-9696', '전자과', '421', '0');
insert into student
values('201925123', '김정현', '010-6374-1037', '컴퓨터정보과', '422', '0');
-------------------------------------------------------------------------------
insert into details
values(1, sysdate, 2, '설문조사참여', 201823886);
insert into details
values(2, sysdate, 2, '불량학생고발', 201886030);
insert into details
values(3, sysdate, -2, '무단외박', 201838674);
insert into details
values(4, sysdate, -2, '불청결', 201752072);
insert into details
values(5, sysdate, 2, '청결', 201823886);
-------------------------------------------------------------------------------
insert into manager
values('1', '김종현', '051-860-3217');
insert into manager
values('2', '김진숙', '051-860-3214');
insert into manager
values('3', '백건효', '051-860-3215');
insert into manager
values('4', '허봉식', '051-860-3213');
insert into manager
values('5', '김경민', '051-860-3210');
-----------------------------기본select문----------------------------------------
select *
from student;

select *
from details;

select *
from manager;

------------------------------기본where문---------------------------------------
select *
from student
where substr(studentNo, 1, 4) = '2018';

select *
from manager
where managerName = '김경민';

---------------------------------join문-----------------------------------------
select *
from student, details
where student.studentNo = details.studentNo;

select *
from student, details
where student.studentNo = details.studentNo
and name = '김산';

--------------------------------그룹합수-----------------------------------------
select count(*) as "학생의 수"
from student;

select count(room) as "호실의 수"
from student;

select studentNo, name, sum(studentPo) as 상벌점합
from student
group by studentNo, name
order by studentNo, name;

select department as 학과, count(*) as 수
from student
group by department
order by department asc;

select room as 호실, count(*) as 수
from student
group by room
order by room asc;

---------------------------------having-----------------------------------------
select studentNo, max(studentPo)
from student
group by studentNo
having max(studentPo) >= 2;

---------------------------------서브 쿼리---------------------------------------
select studentNo, name, department
from student
where department = (select department
                    from student
                    where name = '김산');

select studentNo, name, department
from student
where department = (select department
                    from student
                    where name = '김태선');                    
                    
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
                    where name = '김정현');
                    
select studentno, name, studentPo
from student
where studentPo < ( select studentPo
                    from student
                    where name = '김정현');
                    
----------------------------------트리거-----------------------------------------
delete from details; --삭제

--insert into details
--values(1, sysdate, 2, '설문조사참여', 201823886);

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