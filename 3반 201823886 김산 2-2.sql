--데이터를 조회하기 위한 select 문
--모든 부서정보 검색
SELECT * FROM department;

--모든 사원정보 검색
SELECT * FROM employee;

--사원번호, 사원명 검색
SELECT eno, ename FROM employee;

--사원명, 급여, 연봉 검색1 - 산술연산자 사용
SELECT ename, salary, salary * 12 from employee;

--사원명, 급여, 연봉 검색2 - nvl 함수, 별칭사용
SELECT ename, salary, salary * 12 + NVL(commission, 0) as 연봉 from employee;
SELECT ename, salary, salary * 12 + NVL(commission, 0) 연봉 from employee;
SELECT ename 사원명, salary 급여, salary * 12 + NVL(commission, 0) "연 봉" from employee;

--사원테이블에서 부서번호 검색 - 중복데이터 제거 distinct
SELECT DISTINCT dno
FROM employee;

--오늘 날짜 출력 - sysdate, dual 테이블, 테이블구조 desc
SELECT SYSDATE from dual;
desc dual;
SELECT * FROM dual;

--조건 검색 - where 절
--급여가 1500 이상인 사원명, 급여 검색
SELECT ename, salary
FROM employee
WHERE salary >= 1500;

--부서번호기 10인 사원 검색
SELECT * 
FROM employee
WHERE dno = 10;

--scott 사원 정보 검색 - 문자 데이터 조회
SELECT *
FROM employee
WHERE ename = 'SCOTT';

--입사일이 1981/01./01 이전인 사원만 검색
SELECT *
FROM employee
WHERE hiredate < '1981/01/01';

--부서번호가 10이고 직급이 'MANAGER'인 사원 검색
SELECT *
FROM employee
WHERE dno=10 and job = 'MANAGER';

--부서번호가 10이거나 직급이 'MANAGER'인 사원 검색
SELECT *
FROM employee
WHERE dno=10 OR job = 'MANAGER';

--부서번호가 10이 아닌 사원 검색
SELECT *
FROM employee
WHERE NOT dno = 10;

SELECT *
FROM employee
WHERE dno<>10;

--급여가 1000에서 1500 사이인 사원 검색
SELECT *
FROM employee
WHERE salary>=1000 and salary<=1500;