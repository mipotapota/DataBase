--�޿��� ���� �ڸ� ä���
SELECT lpad(salary, 10, '*')
FROM employee;

--�޿��� ���� �� �ڸ� ä���
SELECT rpad(salary, 10, '*')
FROM employee;

--���� �����ϱ� - trim, ltrim, rtrim
SELECT ' Oracle mania ', ltrim(' Oracle mania '), rtrim(' Oracle mania '), trim(' Oracle mania ')
FROM dual;

--�����Լ�
SELECT 98.7654, ROUND(98.7654), ROUND(98.7654, 2), ROUND(98.7654, -1)
FROM dual;

--���� - trunc
SELECT 98.7654, TRUNC(98.7654), TRUNC(98.7654, 2), TRUNC(98.7654, -1)
FROM dual;

--������ ��ȯ - mod
SELECT MOD(31,2), MOD(31,5), MOD(31,8)
FROM dual;

--����� �޿��� 500���� ���� ������
SELECT ename, salary, MOD(salary, 500)
FROM employee;