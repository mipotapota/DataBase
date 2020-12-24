--급여가 1000미만이거나 1500초과인 사원 검색
SELECT *
FROM employee
WHERE salary < 1000 OR salary > 1500;

--커미션이 300이거나 500이거나 1400인 사원을 검색
SELECT *
FROM employee
WHERE commission = 300 OR commission = 500 OR commission=1400;

--급여가 1000에서 15000사이인 사원을 검색
SELECT *
FROM employee
WHERE salary>=1000 and salary<=1500;

--급여가 1000에서 1500사이인 사원 검색 - between
SELECT *
FROM employee
WHERE salary BETWEEN 1000 and 1500;

--급여가 1000미만이거나 1500초과인 사원 검색 - between
SELECT *
FROM employee
WHERE salary NOT BETWEEN 1000 and 1500;

--1982년에 입사한 사원 검색
SELECT *
FROM employee
WHERE hiredate BETWEEN '1982/01/01' AND '1982/12/31';

--커미션이 300이거나 500이거나 1400인 사원 검색 - in
SELECT *
FROM employee
WHERE commission IN(300, 500, 1400);

--커미션이 300이거나 500이거나 1400이 모두 아닌 사원 검색 - in
SELECT *
FROM employee
WHERE commission NOT IN(300, 500, 1400);

--like 연산자와 와일드카드(%, _)
--이름이 'F'로 시작하는 사원 검색
SELECT *
FROM employee
WHERE ename LIKE 'F%';

--이름에 'M'이 포함되어 있는 사원 검색
SELECT *
FROM employee
WHERE ename LIKE '%M%';

--이름이 'N'으로 끝나는 사원 검색
SELECT *
FROM employee
WHERE ename LIKE '%N';

--이름의 두번째 글자가 'A'인 사원 검색
SELECT *
FROM employee
WHERE ename LIKE '_A%';

--이름의 세번째 글자가 'A'인 사원 검색
SELECT *
FROM employee
WHERE ename LIKE '__A%';

--이름에 'A'가 포함되지 않는 사원 검색
SELECT *
FROM employee
WHERE ename NOT LIKE '%A%';

--커미션 null인 사원 검색
SELECT ename, dno, commission
FROM employee
WHERE commission IS NULL;

--커미션이 null이 아닌 사원 검색
SELECT ename, dno, commission
FROM employee
WHERE commission IS NOT NULL;

--정렬을 위한 order by절
--급여를 높은 순으로 사원 검색
SELECT *
FROM employee
ORDER BY salary DESC;

--이름순으로 사원 검색
SELECT *
FROM employee
ORDER BY ename ASC;

--최근 입사일순으로 사원 검색
SELECT *
FROM employee
ORDER BY hiredate DESC;

--급여 높은 순, 이름 순으로 사원 검색
SELECT *
FROM employee
ORDER BY salary DESC, ename ASC;

--혼자해보기
--2번, 사원의 이름, 급여, 연봉을 검색, 연봉은 상여금 100을 더해서 계산
--연봉이 높은 순으로 검색
SELECT ename, salary, salary*12+100
FROM employee
ORDER BY salary*12+100 DESC;

SELECT ename, salary, salary*12+100 AS 연봉
FROM employee
ORDER BY 연봉 DESC;

SELECT ename, salary, salary*12+100
FROM employee
ORDER BY 3 DESC;

--3번, 급여가 2000을 넘는 사원의 이름과 급여가 많은 것부터 검색
SELECT ename, salary
FROM employee
WHERE salary>2000
ORDER BY salary DESC;

--5번, 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 검색
SELECT ename, salary
FROM employee
WHERE salary NOT BETWEEN 2000 AND 3000
ORDER BY 2; --ASC