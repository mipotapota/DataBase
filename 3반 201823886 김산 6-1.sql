--4�� ȥ���غ���
--1. substr �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ���
SELECT ename, substr(hiredate, 1, 2) as �⵵,
              substr(hiredate, 4, 2) as ��
FROM employee;

--2. substr �Լ��� ����Ͽ� 4���� �Ի��� ����� ���
SELECT *
FROM employee
WHERE SUBSTR(hiredate, 4, 2) = '04';

--3. mod �Լ��� ����Ͽ� �����ȣ�� �ۼ��� ����� �˻�
SELECT *
FROM employee
WHERE mod(eno, 2) = 0;

--4. �Ի����� ������ 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� ���
SELECT ename, hiredate, to_char(hiredate, 'yy/mon/dd dy')
FROM employee;

--5. ���� ��ĥ�� �������� ���
-- ���� ��¥���� ���� 1��1���� �� ����� ���, to_date �Լ��� ����Ͽ� ������ ���� ��ġ
SELECT trunc(sysdate - to_date('2020/01/01', 'yyyy/mm/dd'))
FROM dual;

--6. ������� ��� ����� ���, ��� ���� ����� NULL ��ſ� 0���� ���
SELECT eno, ename, nvl(manager, 0)
FROM employee;

--7. decode �Լ��� ���޿� ���� �޿��� �λ� --> case �����ε� �ۼ��غ���
--'ANALYST" : 200, 'SALESMAN' : 180, 'MANAGER' : 150, 'CLERK' : 100
SELECT ename, job, salary, decode(job, 'ANALYST', salary+200,
                                       'SALESMAN', salary+180, 
                                       'MANAGER', salary+150,
                                       'CLERK', salary+100,
                                       salary) as �޿��λ�
FROM employee
order by job;

SELECT ename, job, salary, case when job = 'ANALYST' then salary+200
                                when job = 'SALESMAN' then salary+180 
                                when job = 'MANAGER' then salary+150
                                when job = 'CLERK' then salary+100
                                else salary 
                                end as �޿��λ�
FROM employee
order by job;