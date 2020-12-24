--�ּ� �޿��� �޴� �����ȣ�� �̸� �˻�
select eno, ename, salary
from employee
where salary = ( select min(salary)
                from employee );

--�μ��� �ּ� �޿��� �޴� �����ȣ�� �̸� �˻�
select eno, ename, salary, dno
from employee
where salary in ( select min(salary)
                 from employee
                 group by dno )
order by dno;

--������ SALESMAN�� �ƴϸ鼭 �޿��� ������ SALESMAN ���� ���� ��� �˻�
-- < any : �ִ밪���� ����
select eno, ename, job, salary
from employee
where salary < any ( select salary
                     from employee
                     where job = 'SALESMAN' )
and job <> 'SALESMAN';

--������ SALESMAN�� �ƴϸ鼭 �޿��� SALESMAN ���� ���� ��� �˻�
-- < all : �ּҰ����� ����
select eno, ename, job, salary
from employee
where salary < all ( select salary
                     from employee
                     where job = 'SALESMAN' )
and job <> 'SALESMAN';

--1. �����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ��(����̸��� ��� ����)�Ͻÿ�.
select ename, job
from employee
where job = ( select job
from employee
where eno = 7788 );
--2. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ��� ����)�Ͻÿ�.
select ename, job
from employee
where salary > (select salary
                from employee
                where eno = 7499);
                
--3. �ּ� �޿��� �޴� ����� �̸�, ��� ���� �� �޿��� ǥ���Ͻÿ�(�׷��Լ� ���).
select ename, job, salary
from employee
where salary = (select 
                min(salary)
                from employee);
--4. ���޺� ��� �޿��� ���� ���� ����� ��� ������ ã�� ���޺� ��� �޿��� ǥ���Ͻÿ�.
select job, round(avg(salary), 1)
from employee
group by job
having round(avg(salary), 1) = (select min(round(avg(salary), 1))
                                from employee
                                group by job);
                                
--5. �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
select ename, salary, dno
from employee
where salary in (select min(salary)
                from employee
                group by dno);
                
--6. ��� ������ ��� ANALYST�� ������� �޿��� �����鼭 ������ ��� ANALAYST�� �ƴ� ������� ǥ��(�����ȣ, �̸�, ������, �޿�)�Ͻÿ�.
select eno, ename, job, salary
from employee
where salary < any(select salary
                   from employee
                   where job='ANALYST')
and job <> 'ANALYST';

--7. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.
 select ename
 from employee
 where eno in (select eno
               from employee
               where manager is null);
 
--8. ���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename
from employee
where eno in (select eno
              from employee
              where manager is not null);
              
--9. BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�. (��, BLAKE�� ����)
select ename, hiredate
from employee
where dno = (select dno
             from employee
             where ename = 'BLAKE')
and ename <> 'BLAKE';

--10. �޿��� ��� �޿� ���� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ �����Ͻÿ�.
select eno, ename
from employee
where salary > (select avg(salary)
                from employee)
                order by salary asc;
                
--11. �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
select eno, ename
from employee
where dno in (select dno
              from employee
              where ename like '%K%');

--12. �μ� ��ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� ��� ������ ǥ���Ͻÿ�.
select ename, dno, job
from employee
where dno = (select dno
             from department
             where loc = 'DALLAS');
             
--13. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
select ename, salary
from employee
where manager = (select eno
                 from employee
                 where ename = 'KING');

--14. PESEARCH �μ��� ����� ���� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.
select dno, ename, job
from employee
where dno = (select dno
             from department
             where dname = 'RESEARCH');
             
--15. ��� �޿� ���� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�.
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and dno in(select dno
           from employee
           where ename like '%M%');

--16. ��� �޿��� ���� ���� ������ ã���ÿ�.
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                      from employee
                      group by job);