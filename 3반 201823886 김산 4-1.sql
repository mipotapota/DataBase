--급여의 왼쪽 자리 채우기
SELECT lpad(salary, 10, '*')
FROM employee;

--급여의 오른 쪽 자리 채우기
SELECT rpad(salary, 10, '*')
FROM employee;

--공백 제거하기 - trim, ltrim, rtrim
SELECT ' Oracle mania ', ltrim(' Oracle mania '), rtrim(' Oracle mania '), trim(' Oracle mania ')
FROM dual;

--숫자함수
SELECT 98.7654, ROUND(98.7654), ROUND(98.7654, 2), ROUND(98.7654, -1)
FROM dual;

--버림 - trunc
SELECT 98.7654, TRUNC(98.7654), TRUNC(98.7654, 2), TRUNC(98.7654, -1)
FROM dual;

--나머지 반환 - mod
SELECT MOD(31,2), MOD(31,5), MOD(31,8)
FROM dual;

--사원의 급여를 500으로 나눈 나머지
SELECT ename, salary, MOD(salary, 500)
FROM employee;