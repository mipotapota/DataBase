--1. EQUI������ ����Ͽ� SCOTT����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�.
select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

select e.ename, e.dno, d.dname
from employee e join department d
on e.dno = d.dno
where ename = 'SCOTT';
--2. INNER JOIN�� ON�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
select e.ename, d.dname, loc
from employee e join department d
on e.dno = d.dno;

--3. INNER JOIN�� USING�����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ ���� ���(�� ������ ǥ��)�� �μ��� �������� �����Ͽ� ����Ͻÿ�.
select dno, job, loc
from employee e join department d
using(dno)
where dno = 10;

--4. NATURAL JOIN�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����Ͻÿ�.
select e.ename, d.dname, loc
from employee e join department d
on e.dno = d.dno
where commission>0;

--5. EQUI���ΰ� WildCard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
select e.ename, d.dname
from employee e join department d
on e.dno = d.dno
where e.ename like '%A%';

--6. NATURAL JOIN�� ����Ͽ� NEW YORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
select e.ename, d.dname, job, e.dno
from employee e join department d
on e.dno = d.dno
where d.loc='NEW YORK';

--7.SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�. �� �� ���� ��Ī�� ��� ȭ��� ������ �Ͻÿ�.
select emp.ename as "Employee",
    emp.manager as "Emp#",
    mgr.eno as "Manager",
    mgr.ename as "Mgr#"
from employee emp, employee mgr
where emp.manager = mgr.eno;

select emp.eno, emp.ename, mgr.eno, mgr.ename
from employee emp, employee mgr
where emp.manager = mgr.eno;

--8. OUTER JOIN, SELF JOIN�� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
select emp.ename as "Employee",
    emp.manager as "Emp#",
    mgr.eno as "Manager",
    mgr.ename as "Mgr#"
from employee emp, employee mgr
where emp.manager = mgr.eno(+)
order by emp.eno desc;

select emp.eno, emp.ename, mgr.eno, mgr.ename
from employee emp left outer join employee mgr
on emp.manager = mgr.eno
order by emp.eno desc;

--9. SELF JOIN�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. ��, �� ���� ��Ī�� �̸�, �μ���ȣ, ����� �Ͻÿ�.
select e.ename as �̸�, e.dno as �μ���ȣ, d.ename as ����
from employee e join employee d
on e.dno = d.dno
where e.ename = 'SCOTT'
and d.ename != 'SCOTT';

select me.ename, me.dno, other.ename as "����"
from employee me join employee other
on me.dno = other.dno
where me.ename = 'SCOTT'
and other.ename != 'SCOTT';

--10. SELF JOIN�� ����Ͽ� WARD������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select e.ename, e.hiredate
from employee WARD join employee e
on ward.ename = 'WARD'
where e.hiredate>WARD.hiredate
order by hiredate;

-- join ���4 - join ~ on
select e.eno, e.ename, e.job, d.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno -- ���� ����
where eno = 7788; -- �˻� ����

--��������
--SCOTT�� ������ �μ����� �ٹ��ϴ� ��� �˻�
select ename, dno
from employee
where dno = ( select dno
              from employee
              where ename = 'SCOTT' );
              
--�ּ� �޿��� ���� ����� �̸�, ��� ����, �޿� �˻�
select ename, job, salary
from employee
where salary = ( select min(salary)
                from employee );
                
--30�� �μ����� �ּ� �޿��� ���� ��, �μ��� �ּ� �޿��� ���� �ּ� �޿����� ū �μ��� �˻�
select dno, min(salary)
from employee
group by dno
having min(salary) > ( select min(salary)
                       from employee
                       where dno=30 );