--1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
select max(salary) as "max",
       min(salary) as "min",
       sum(salary) as "sum",
       round(avg(salary)) as "avg"
from employee;
--2. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
select job as "job",
       max(salary) as "max",
       min(salary) as "min",
       sum(salary) as "sum",
       round(avg(salary)) as "avg" 
from employee
group by job;
--3. count(*)�Լ��� �̿��Ͽ� ��� ������ ������ ��� ���� ����Ͻÿ�.
select job, count(*)
from employee
group by job;
--4. ������ ���� �����Ͻÿ�. ų���� ��Ī�� ��� ȭ��� �����ϰ� �����Ͻÿ�.
select count(manager)
from employee;
--5. �޿� �ְ��, �޿� �������� ������ ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����Ͻÿ�.
select max(salary)-min(salary) as difference
from employee;
--6. ���޺� ����� ���� �޿��� ����Ͻÿ�. �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ ����Ͻÿ�.
select job, min(salary)
from employee
group by job
having not min(salary)<2000
order by min(salary)desc;
--7. �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��� �޿��� �Ҽ��� �Ѥ� �ڸ��� �ݿø��Ͻÿ�.
select dno,
       count(*) as "Number of People",
       round(avg(salary),2) as "Salary"
from employee
group by dno
order by dno asc;
--8. �� �μ��� ���� �μ���ȣ �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�. Į���� ��Ī�� ��� ȭ��� �����ϰ� �����ϰ� ��� �޿��� ������ �ݿø��Ͻÿ�.
select decode(dno, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS') as "daname",
       decode(dno, 10, 'NEW YORK',
                   20, 'DALLAS',
                   30, 'CHICAGO',
                   40, 'BOSTON') as "Location",
    count(*) as "Number of People",
    round(avg(salary)) as "Salary"
from employee
group by dno;
--9. ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �޿� �� �μ� 10, 20, 30�� �޿� �Ѿ��� ���� ����Ͻÿ�. �� Į���� ��Ī�� ���� Job, �μ� 10, �μ� 20, �μ�30, �Ѿ����� �����Ͻÿ�.
select job, dno,
       decode(dno, 10, sum(salary)) as "�μ� 10",
       decode(dno, 20, sum(salary)) as "�μ� 20",
       decode(dno, 30, sum(salary)) as "�μ� 30",
       sum(salary) as "�Ѿ�"
from employee
group by job, dno
order by dno;