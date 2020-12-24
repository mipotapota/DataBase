--6��, 1981�� 2�� 20�Ϻ��� 5�� 1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� �˻�
SELECT ename, job, hiredate
FROM employee
WHERE hiredate BETWEEN '81/02/20' AND '81/05/01';

--8��, ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿�, �μ���ȣ �˻�
--�̸������� ����
SELECT ename, salary, dno
FROM employee
WHERE salary BETWEEN 2000 AND 3000
AND dno IN(20, 30) -- dno=20 or dno=30
ORDER BY ename;

--9��, 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ���(like�����ڿ� ���ϵ�ī�� ���)
SELECT ename, hiredate
FROM employee
WHERE hiredate like '81%'; --'81/__/__'

--10��, �����ڰ� ���� ����� �̸��� ������ �˻�
SELECT ename, job   
FROM employee
WHERE manager is null;  

--13��, �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� �˻�
SELECT ename
FROM employee
WHERE ename LIKE '%A%' AND ename LIKE '%E%';

--14��, �������� �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� 1600, 950, 1300�� �ƴ�
--����� �̸�, ������, �޾� �˻�
SELECT ename, job, salary
FROM employee
WHERE job IN('CLERK', 'SALESMAN')
AND salary NOT IN(1600, 950, 1300);

SELECT ename, job, salary
FROM employee
WHERE (job='CLERK' OR job='SALESMAN')
AND (salary!=1600 AND salary!=950 AND salary!=1300);

--4��, �پ��� �Լ�
--���� �Լ�
--���� ���� ��ȯ �Լ� - length, lengthb
SELECT LENGTH('Oracle Mania'), LENGTH('����Ŭ �ŴϾ�')
FROM dual;

SELECT LENGTHB('Oracle Mania'), LENGTHB('����Ŭ�ŴϾ�')
FROM dual;

--���ڸ� �߶� �����ϴ� �Լ� - substr
SELECT SUBSTR('Oracle Mania', 4, 3), SUBSTR('Oracle Mania', -4, 3)
FROM dual;

--�̸��� N���� ������ ��� �˻� - subsr �Լ� ���
SELECT ename
FROM employee
WHERE SUBSTR(ename, -1, 1)='N';

--87�⵵�� �Ի��� ��� �˻� - substr �Լ� ���
SELECT ename, hiredate
FROM employee
WHERE SUBSTR(hiredate, 1, 2) = '87';