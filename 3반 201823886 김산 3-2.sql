--6번, 1981년 2월 20일부터 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 검색
SELECT ename, job, hiredate
FROM employee
WHERE hiredate BETWEEN '81/02/20' AND '81/05/01';

--8번, 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여, 부서번호 검색
--이름순으로 정렬
SELECT ename, salary, dno
FROM employee
WHERE salary BETWEEN 2000 AND 3000
AND dno IN(20, 30) -- dno=20 or dno=30
ORDER BY ename;

--9번, 1981년도에 입사한 사원의 이름과 입사일을 출력(like연산자와 와일드카드 사용)
SELECT ename, hiredate
FROM employee
WHERE hiredate like '81%'; --'81/__/__'

--10번, 관리자가 없는 사원의 이름과 담당업무 검색
SELECT ename, job   
FROM employee
WHERE manager is null;  

--13번, 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 검색
SELECT ename
FROM employee
WHERE ename LIKE '%A%' AND ename LIKE '%E%';

--14번, 담당업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 급여가 1600, 950, 1300이 아닌
--사원의 이름, 담당업무, 급어 검색
SELECT ename, job, salary
FROM employee
WHERE job IN('CLERK', 'SALESMAN')
AND salary NOT IN(1600, 950, 1300);

SELECT ename, job, salary
FROM employee
WHERE (job='CLERK' OR job='SALESMAN')
AND (salary!=1600 AND salary!=950 AND salary!=1300);

--4장, 다양한 함수
--문자 함수
--문자 길이 반환 함수 - length, lengthb
SELECT LENGTH('Oracle Mania'), LENGTH('오라클 매니아')
FROM dual;

SELECT LENGTHB('Oracle Mania'), LENGTHB('오라클매니아')
FROM dual;

--문자를 잘라 추출하는 함수 - substr
SELECT SUBSTR('Oracle Mania', 4, 3), SUBSTR('Oracle Mania', -4, 3)
FROM dual;

--이름이 N으로 끝나는 사원 검색 - subsr 함수 사용
SELECT ename
FROM employee
WHERE SUBSTR(ename, -1, 1)='N';

--87년도에 입사한 사원 검색 - substr 함수 사용
SELECT ename, hiredate
FROM employee
WHERE SUBSTR(hiredate, 1, 2) = '87';