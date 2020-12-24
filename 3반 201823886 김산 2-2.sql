--�����͸� ��ȸ�ϱ� ���� select ��
--��� �μ����� �˻�
SELECT * FROM department;

--��� ������� �˻�
SELECT * FROM employee;

--�����ȣ, ����� �˻�
SELECT eno, ename FROM employee;

--�����, �޿�, ���� �˻�1 - ��������� ���
SELECT ename, salary, salary * 12 from employee;

--�����, �޿�, ���� �˻�2 - nvl �Լ�, ��Ī���
SELECT ename, salary, salary * 12 + NVL(commission, 0) as ���� from employee;
SELECT ename, salary, salary * 12 + NVL(commission, 0) ���� from employee;
SELECT ename �����, salary �޿�, salary * 12 + NVL(commission, 0) "�� ��" from employee;

--������̺��� �μ���ȣ �˻� - �ߺ������� ���� distinct
SELECT DISTINCT dno
FROM employee;

--���� ��¥ ��� - sysdate, dual ���̺�, ���̺��� desc
SELECT SYSDATE from dual;
desc dual;
SELECT * FROM dual;

--���� �˻� - where ��
--�޿��� 1500 �̻��� �����, �޿� �˻�
SELECT ename, salary
FROM employee
WHERE salary >= 1500;

--�μ���ȣ�� 10�� ��� �˻�
SELECT * 
FROM employee
WHERE dno = 10;

--scott ��� ���� �˻� - ���� ������ ��ȸ
SELECT *
FROM employee
WHERE ename = 'SCOTT';

--�Ի����� 1981/01./01 ������ ����� �˻�
SELECT *
FROM employee
WHERE hiredate < '1981/01/01';

--�μ���ȣ�� 10�̰� ������ 'MANAGER'�� ��� �˻�
SELECT *
FROM employee
WHERE dno=10 and job = 'MANAGER';

--�μ���ȣ�� 10�̰ų� ������ 'MANAGER'�� ��� �˻�
SELECT *
FROM employee
WHERE dno=10 OR job = 'MANAGER';

--�μ���ȣ�� 10�� �ƴ� ��� �˻�
SELECT *
FROM employee
WHERE NOT dno = 10;

SELECT *
FROM employee
WHERE dno<>10;

--�޿��� 1000���� 1500 ������ ��� �˻�
SELECT *
FROM employee
WHERE salary>=1000 and salary<=1500;