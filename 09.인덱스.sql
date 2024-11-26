USE db_company;

/* 클러스터 인덱스 : PK에 부여된 인덱스 */

-- 1. (인덱스 태우기) 부서번호가 1인 부서 조회하기
SELECT emp_id, dept_id, emp_name
FROM tbl_employee
WHERE dept_id = 1;  -- 인덱스가 설정된 칼럼으로 조회

SELECT emp_id, dept_id, emp_name
FROM tbl_employee
WHERE dept_id * 2 = 2;  -- 인덱스가 설정된 칼럼으로 조회하면(연산, 함수) 더 이상 인텍스를 타지 않는다.

-- 2. (인덱스 안 태우기) 부서명이 '영업부'인 부서 조회하기
SELECT dept_id, dept_name, location
FROM tbl_department
WHERE dept_name = '영업부';

-- 3. 부서번호가 1 이상인 부서 조회하기
SELECT dept_id, dept_name, location
FROM tbl_department
WHERE dept_id >= 1;  -- 인덱스의 범위 조건은 검색 엔진이 'Index Range Scan' 또는 'Full Table Scan' 중 선택해서 동작한다.


/* 보조 인덱스 만들기 */
CREATE INDEX ix_name
    ON tbl_employee(emp_name ASC);

-- 정상적으로 인덱스 태우기     
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee 
 WHERE emp_name LIKE '이은영';

-- 'Index Range Scan'
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee 
 WHERE emp_name LIKE '이%';  
 
-- 'Full Table Scan' (인덱스 컬럼을 함수 저리했기 때문)
SELECT emp_id, dept_id, emp_name, position, gender, hire_date, salary
  FROM tbl_employee 
 WHERE SUBSTRING(emp_name, 1, 1) = '이';  -- SUBSTRING(emp_name, 1, 1) : 1번째 글자부터 1글자만 추출






 