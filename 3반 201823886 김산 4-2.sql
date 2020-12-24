--��¥ �Լ�
--���� ��¥ ���
SELECT SYSDATE - 1 AS ����, SYSDATE AS ����, SYSDATE + 1 AS ����, SYSDATE + 10 AS "10�� ��"
FROM DUAL;

--����� �ٹ��ϼ� ����ϱ�
SELECT ename, ROUND(sysdate-hiredate) AS �ٹ��ϼ�
FROM employee;

--�Ի��Ͽ��� ���� �������� �߶󳻱�
SELECT ename, TRUNC(hiredate, 'month')
FROM employee;

--����� �ٹ��� ���� �� ���ϱ�
SELECT ename, sysdate, hiredate, TRUNC(MONTHS_BETWEEN(sysdate, hiredate))
FROM employee;

--�� ��ȯ �Լ� - to char
--����� �Ի����� �پ��ϰ� ���
SELECT ename, hiredate,
        TO_CHAR(hiredate, 'YY-MM'),
        TO_CHAR(hiredate, 'YYYY//MM//DD DAY')
FROM employee;

--���� ��¥�� �ð� ���
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS')
FROM dual;

--���ձ�ȣ�� �Բ� �޿� ���
SELECT ename, salary, TO_CHAR(salary, 'L999,999'), TO_CHAR(salary, 'L000,000')
FROM employee;

--�� ��ȯ �Լ� - TO_DATE
--1981�� 2�� 20�Ͽ� �Ի��� ��� �˻�
SELECT ename, hiredate
FROM employee
WHERE hiredate=TO_DATE(19810220,'YYYY/MM/DD');

--�� ��ȯ �Լ� - TO_NUMBER
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('50,000', '999,999')
FROM dual;

--�Ϲ��Լ� - NVL, NVL2
--����� �������ϱ�
SELECT ename, salary, commission, salary * 12 + NVL(commission, 0)
FROM employee;

SELECT ename, salary, commission, NVL2(commission, salary * 12 + commission, salary * 12)
FROM employee;

--�Ϲ��Լ� - DECODE
--����� �μ��̸� ���
SELECT ename, dno, DECODE(dno, 10, 'ACCOUNTING', 
                                20, 'RESEARCH',
                                30, 'SALES', 
                                40, 'OPERATIONS', 
                                'DEFAULT') AS �μ���
FROM employee
ORDER BY dno;

--�Ϲ��Լ� - case
--����� �μ��̸� ���
SELECT ename, dno, 
    CASE WHEN dno = 10 THEN 'ACCOUNTING'
        WHEN dno = 20 THEN 'RESEARCH'
        WHEN dno = 30 THEN 'SALES'
        WHEN dno = 40 THEN 'OPERATIONS'
        ELSE 'DEFAULT'
    END AS �μ���
FROM employee
ORDER BY dno;