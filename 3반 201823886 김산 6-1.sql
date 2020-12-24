--4장 혼자해보기
--1. substr 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력
SELECT ename, substr(hiredate, 1, 2) as 년도,
              substr(hiredate, 4, 2) as 달
FROM employee;

--2. substr 함수를 사용하여 4월에 입사한 사원만 출력
SELECT *
FROM employee
WHERE SUBSTR(hiredate, 4, 2) = '04';

--3. mod 함수를 사용하여 사원번호가 작수인 사원만 검색
SELECT *
FROM employee
WHERE mod(eno, 2) = 0;

--4. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 출력
SELECT ename, hiredate, to_char(hiredate, 'yy/mon/dd dy')
FROM employee;

--5. 올해 며칠이 지났는지 출력
-- 현재 날짜에서 올해 1월1일을 뺀 결과를 출력, to_date 함수를 사용하여 데이터 형을 일치
SELECT trunc(sysdate - to_date('2020/01/01', 'yyyy/mm/dd'))
FROM dual;

--6. 사원들의 상관 사번을 출력, 상관 없는 사원은 NULL 대신에 0으로 출력
SELECT eno, ename, nvl(manager, 0)
FROM employee;

--7. decode 함수로 직급에 따라 급여를 인상 --> case 문으로도 작성해보기
--'ANALYST" : 200, 'SALESMAN' : 180, 'MANAGER' : 150, 'CLERK' : 100
SELECT ename, job, salary, decode(job, 'ANALYST', salary+200,
                                       'SALESMAN', salary+180, 
                                       'MANAGER', salary+150,
                                       'CLERK', salary+100,
                                       salary) as 급여인상
FROM employee
order by job;

SELECT ename, job, salary, case when job = 'ANALYST' then salary+200
                                when job = 'SALESMAN' then salary+180 
                                when job = 'MANAGER' then salary+150
                                when job = 'CLERK' then salary+100
                                else salary 
                                end as 급여인상
FROM employee
order by job;