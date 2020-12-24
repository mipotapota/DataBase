-- join : ���� ���̺��� �ʿ��� ������ �����ͼ�, ������ ���̺��� ����� ����� �����ִ� ��
select *
from employee, department
where employee.dno = department.dno;

-- join ���1 - ,
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno -- ���� ����
and eno = 7788; -- �˻� ����

-- join ���2 - natural join
select e.eno, e.ename, e.job, dno, d.dname, d.loc
from employee e natural join department d
where eno = 7788;

-- join ���3 - join ~ using
select e.eno, e.ename, e.job, dno, d.dname, d.loc
from employee e join department d
using (dno) -- ���� ����
where eno = 7788; -- �˻� ����

-- join ���4 - join ~ on
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno -- ���� ����
where eno = 7788; -- �˻� ����

-- non-equl join
--������� �޿� ��� �˻�
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between s.losal and s.hisal
and s.grade = 3;

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between s.losal and s.hisal
where s.grade = 3;

-- ������� �޿� ��� �˻�, �μ��� ����
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
select e.ename as ����̸�, m.ename as ���ӻ���̸�
from employee e, employee m
where e.manager = m.eno;

select e.ename as ����̸�, m.ename as ���ӻ���̸�
from employee e join employee m
on e.manager = m.eno;

select e.ename || '�� ���� ����� ' || m.ename || '�Դϴ�.'
from employee e join employee m
on e.manager = m.eno;

-- outer join
select e.ename || '�� ���� ����� ' || m.ename || '�Դϴ�.'
from employee e left outer join employee m
on e.manager = m.eno;