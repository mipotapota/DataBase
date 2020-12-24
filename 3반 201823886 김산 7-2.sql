--1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균에 대해서는 정수로 반올림하시오.
select max(salary) as "max",
       min(salary) as "min",
       sum(salary) as "sum",
       round(avg(salary)) as "avg"
from employee;
--2. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균에 대해서는 정수로 반올림하시오.
select job as "job",
       max(salary) as "max",
       min(salary) as "min",
       sum(salary) as "sum",
       round(avg(salary)) as "avg" 
from employee
group by job;
--3. count(*)함수를 이용하여 담당 업무가 동일한 사원 수를 출력하시오.
select job, count(*)
from employee
group by job;
--4. 관리자 수를 나열하시오. 킬럼의 별칭은 결과 화면과 동일하게 지정하시오.
select count(manager)
from employee;
--5. 급여 최고액, 급여 최저액의 차액을 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하시오.
select max(salary)-min(salary) as difference
from employee;
--6. 직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 출력하시오.
select job, min(salary)
from employee
group by job
having not min(salary)<2000
order by min(salary)desc;
--7. 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균 급여는 소수점 둘쨰 자리로 반올림하시오.
select dno,
       count(*) as "Number of People",
       round(avg(salary),2) as "Salary"
from employee
group by dno
order by dno asc;
--8. 각 부서에 대해 부서번호 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오. 칼럼의 별칭은 결과 화면과 동일하게 지정하고 평균 급여는 정수로 반올림하시오.
select decode(dno, 10, 'ACCOUNTING',
                   20, 'RESEARCH',
                   30, 'SALES',
                   40, 'OPERATIONS') as "daname",
       decode(dno, 10, 'NEW YORK',
                   20, 'DALLAS',
                   30, 'CHICAGO',
                   40, 'BOSTON') as "Location",
    count(*) as "Number of People",
    round(avg(salary)) as "Salary"
from employee
group by dno;
--9. 업무를 표시한 다음 해당 업무에 대해 부서번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오. 각 칼럼에 별칭은 각각 Job, 부서 10, 부서 20, 부서30, 총액으로 지정하시오.
select job, dno,
       decode(dno, 10, sum(salary)) as "부서 10",
       decode(dno, 20, sum(salary)) as "부서 20",
       decode(dno, 30, sum(salary)) as "부서 30",
       sum(salary) as "총액"
from employee
group by job, dno
order by dno;