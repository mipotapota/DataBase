--�޿��� 1000�̸��̰ų� 1500�ʰ��� ��� �˻�
SELECT *
FROM employee
WHERE salary < 1000 OR salary > 1500;

--Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� �˻�
SELECT *
FROM employee
WHERE commission = 300 OR commission = 500 OR commission=1400;

--�޿��� 1000���� 15000������ ����� �˻�
SELECT *
FROM employee
WHERE salary>=1000 and salary<=1500;

--�޿��� 1000���� 1500������ ��� �˻� - between
SELECT *
FROM employee
WHERE salary BETWEEN 1000 and 1500;

--�޿��� 1000�̸��̰ų� 1500�ʰ��� ��� �˻� - between
SELECT *
FROM employee
WHERE salary NOT BETWEEN 1000 and 1500;

--1982�⿡ �Ի��� ��� �˻�
SELECT *
FROM employee
WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

--Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ��� �˻� - in
SELECT *
FROM employee
WHERE commission IN(300, 500, 1400);

--Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ��� �ƴ� ��� �˻� - in
SELECT *
FROM employee
WHERE commission NOT IN(300, 500, 1400);

--like �����ڿ� ���ϵ�ī��(%, _)
--�̸��� 'F'�� �����ϴ� ��� �˻�
SELECT *
FROM employee
WHERE ename LIKE 'F%';

--�̸��� 'M'�� ���ԵǾ� �ִ� ��� �˻�
SELECT *
FROM employee
WHERE ename LIKE '%M%';

--�̸��� 'N'���� ������ ��� �˻�
SELECT *
FROM employee
WHERE ename LIKE '%N';

--�̸��� �ι�° ���ڰ� 'A'�� ��� �˻�
SELECT *
FROM employee
WHERE ename LIKE '_A%';

--�̸��� ����° ���ڰ� 'A'�� ��� �˻�
SELECT *
FROM employee
WHERE ename LIKE '__A%';

--�̸��� 'A'�� ���Ե��� �ʴ� ��� �˻�
SELECT *
FROM employee
WHERE ename NOT LIKE '%A%';

--Ŀ�̼� null�� ��� �˻�
SELECT ename, dno, commission
FROM employee
WHERE commission IS NULL;

--Ŀ�̼��� null�� �ƴ� ��� �˻�
SELECT ename, dno, commission
FROM employee
WHERE commission IS NOT NULL;

--������ ���� order by��
--�޿��� ���� ������ ��� �˻�
SELECT *
FROM employee
ORDER BY salary DESC;

--�̸������� ��� �˻�
SELECT *
FROM employee
ORDER BY ename ASC;

--�ֱ� �Ի��ϼ����� ��� �˻�
SELECT *
FROM employee
ORDER BY hiredate DESC;

--�޿� ���� ��, �̸� ������ ��� �˻�
SELECT *
FROM employee
ORDER BY salary DESC, ename ASC;

--ȥ���غ���
--2��, ����� �̸�, �޿�, ������ �˻�, ������ �󿩱� 100�� ���ؼ� ���
--������ ���� ������ �˻�
SELECT ename, salary, salary*12+100
FROM employee
ORDER BY salary*12+100 DESC;

SELECT ename, salary, salary*12+100 AS ����
FROM employee
ORDER BY ���� DESC;

SELECT ename, salary, salary*12+100
FROM employee
ORDER BY 3 DESC;

--3��, �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ���� �ͺ��� �˻�
SELECT ename, salary
FROM employee
WHERE salary>2000
ORDER BY salary DESC;

--5��, �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� �˻�
SELECT ename, salary
FROM employee
WHERE salary NOT BETWEEN 2000 AND 3000
ORDER BY 2; --ASC