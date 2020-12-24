--날짜 함수
--현재 날짜 출력
SELECT SYSDATE - 1 AS 어제, SYSDATE AS 오늘, SYSDATE + 1 AS 내일, SYSDATE + 10 AS "10일 뒤"
FROM DUAL;

--사원의 근무일수 계산하기
SELECT ename, ROUND(sysdate-hiredate) AS 근무일수
FROM employee;

--입사일에서 월을 기준으로 잘라내기
SELECT ename, TRUNC(hiredate, 'month')
FROM employee;

--사원의 근무한 개월 수 구하기
SELECT ename, sysdate, hiredate, TRUNC(MONTHS_BETWEEN(sysdate, hiredate))
FROM employee;

--헝 변환 함수 - to char
--사원의 입사일을 다양하게 출력
SELECT ename, hiredate,
        TO_CHAR(hiredate, 'YY-MM'),
        TO_CHAR(hiredate, 'YYYY//MM//DD DAY')
FROM employee;

--현재 날짜와 시간 출력
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS')
FROM dual;

--통합기호와 함께 급여 출력
SELECT ename, salary, TO_CHAR(salary, 'L999,999'), TO_CHAR(salary, 'L000,000')
FROM employee;

--형 변환 함수 - TO_DATE
--1981년 2월 20일에 입사한 사원 검색
SELECT ename, hiredate
FROM employee
WHERE hiredate=TO_DATE(19810220,'YYYY/MM/DD');

--형 변환 함수 - TO_NUMBER
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('50,000', '999,999')
FROM dual;

--일반함수 - NVL, NVL2
--사원의 연봉구하기
SELECT ename, salary, commission, salary * 12 + NVL(commission, 0)
FROM employee;

SELECT ename, salary, commission, NVL2(commission, salary * 12 + commission, salary * 12)
FROM employee;

--일반함수 - DECODE
--사원의 부서이름 출력
SELECT ename, dno, DECODE(dno, 10, 'ACCOUNTING', 
                                20, 'RESEARCH',
                                30, 'SALES', 
                                40, 'OPERATIONS', 
                                'DEFAULT') AS 부서명
FROM employee
ORDER BY dno;

--일반함수 - case
--사원의 부서이름 출력
SELECT ename, dno, 
    CASE WHEN dno = 10 THEN 'ACCOUNTING'
        WHEN dno = 20 THEN 'RESEARCH'
        WHEN dno = 30 THEN 'SALES'
        WHEN dno = 40 THEN 'OPERATIONS'
        ELSE 'DEFAULT'
    END AS 부서명
FROM employee
ORDER BY dno;