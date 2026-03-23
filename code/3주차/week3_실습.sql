SELECT datname FROM pg_database;

\c ut;

/*
 [Entities / 개체]
- Professor

 [Properties / 속성]
 - id               (BIGSERIAL) -- 자동으로 증가하는 숫자
 - name             (VARCHAR(30))
 - dept             (VARCHAR(50))
 - salary           (NUMERIC)
 - salary_level     (NUMERIC)
 - hire_date        (DATE) -- 'yyyy-mm-dd'
 */

 DROP TABLE prof;

 CREATE TABLE prof (
     id bigserial,
     name varchar(30),
     dept varchar(50),
     salary numeric,
     salary_level numeric,
     hire_date date
 );

TABLE prof;

-- 데이터 삽입하기
INSERT INTO prof (name, dept, salary, salary_level, hire_date)
VALUES
    ('임영훈', '메카트로닉스공학', 100000, 2, '1998-12-31'),
    ('김미래', '소프트웨어공학', 9999999, 5, '2001-07-19'),
    ('정승민', '나노화학공학', 300000, 3, '1911-01-23'),
    ('차은호', '무역학과', 20550, 1, '2027-05-11'),
    ('김다호', '컴퓨터공학', 50000, 1, '2005-02-19');

-- 데이터 검색하기
SELECT * FROM prof;

SELECT name, salary FROM prof;
SELECT name, salary FROM prof ORDER BY salary DESC; -- ASC
SELECT name, salary FROM prof WHERE salary > 90000;

SELECT name, salary FROM prof WHERE name LIKE '김%'; -- PostgreSQL ILIKE 대/소문자 상관 없다.
SELECT name, dept FROM prof
    WHERE dept LIKE '%공%'
    ORDER BY dept DESC;

SELECT name, dept FROM prof
WHERE dept LIKE '%공%'
ORDER BY dept ASC;

SELECT name, salary FROM prof WHERE salary BETWEEN 10000 AND 70000;
