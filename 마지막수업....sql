create table kaa --��ǰ
( anno number(4) constraint aa_no_pk primary key,
  aaname varchar2(30),
  jego number(4) not null);
  
create table kbb --�ֹ�
( bnno number(4) constraint bb_no_pk primary key,
  bbname varchar2(30),
  su number(4) not null,
  anno number(4) constraint ano_no_fk references kaa);

insert into kaa values (1, '��ǰ1', 5);
insert into kaa values (2, '��ǰ2', 5);

insert into kbb values (1, '�ֹ�2', 3, 2);
insert into kbb values (2, '�ֹ�4', 2, 1);
insert into kbb values (3, '�ֹ�5', -1, 1);

select * from kaa;
select * from kbb;

create or replace trigger trg_update
after insert
on kbb
for each row
begin
    update kaa
    set kaa.jego = (kaa.jego - :new.su)
    where kaa.anno = :new.anno;
end;
/