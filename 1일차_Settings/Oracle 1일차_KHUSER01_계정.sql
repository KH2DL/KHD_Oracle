show user;

CREATE TABLE EMPLOYEE(
    NAME VARCHAR2(20),
    T_CODE VARCHAR2(10),
    D_CODE VARCHAR2(10),
    AGE NUMBER
);
-- 1. 컬럼의 데이터 타입없이 테이블 생성하여 오류남
-- -> 데이터타입 작성
-- 2. 권한도 없이 테이블을 생성하여 오류남
-- -> System_계정에서 resource 권한 부어
-- 3. 접속해제 후 접속, 새로운 워크시트 말고 기존 워크시트에서 접속을 선택하여
-- 명령어 재실행

INSERT INTO EMPLOYEE(NAME, T_CODE, D_CODE, AGE)
VALUES('일용자', 'T1', 'D1', 33);
INSERT INTO EMPLOYEE(NAME, T_CODE, D_CODE, AGE)
VALUES('이용자', 'T2', 'D1', 44);
INSERT INTO EMPLOYEE
VALUES('삼용자', 'T1', 'D2', 32);
INSERT INTO EMPLOYEE
VALUES('일용자', 'T2', 'D2', 43);

-- 테이블 삭제
DROP TABLE EMPLOYEE;

-- 테이블 안에 있는 데이터 전체 삭제
DELETE FROM EMPLOYEE;

-- 테이블 안에 일부 데이터 삭제 -> 이름이 '일용자'인 데이터 삭제(값이 같을경우 같이 삭제)
DELETE FROM EMPLOYEE WHERE NAME = '일용자' AND D_CODE = 'D2';

-- 데이터 수정
UPDATE EMPLOYEE SET T_CODE = 'T3' WHERE NAME = '일용자';

-- 테이블 조회
SELECT NAME, T_CODE, D_CODE, AGE FROM EMPLOYEE
WHERE NAME = '일용자';

-- 테이블 전체 조회
SELECT * FROM EMPLOYEE;

-- 이름이 STUDENT_TBL인 테이블을 만드세요
-- 이름, 나이, 학년, 주소를 저장할 수 있도록 하며
-- 일용자, 21, 1, 서울시 중구를 저장하세요
-- 일용자를 사용자로 바꿔주세요.
-- 데이터를 삭제하는 쿼리문을 작성하고 삭제를 확인하시고
-- 테이블을 삭제하는 쿼리문을 작성하여 테이블이 사라진 것을 확인하세요.


CREATE TABLE STUDENT_TBL(
    NAME VARCHAR2(20),
    AGE NUMBER,
    GRADE VARCHAR2(10),
    ADDRESS VARCHAR2(200)
);

INSERT INTO STUDENT_TBL
VALUES('일용자', 21, '1', '서울시 중구');

UPDATE STUDENT_TBL SET NAME = '사용자' WHERE NAME = '일용자';
DELETE FROM STUDENT_TBL WHERE NAME = '사용자';
DROP TABLE STUDENT_TBL;

-- 커밋하기 전으로 돌아감
ROLLBACK;

-- 최종 저장
COMMIT;

-- 아이디가 KHUSER02 비밀번호가 KHUSER02인 계정을 생성하고
-- 접속이 되도록하고 테이블도 만들 수 있도록 하세요.

-- SYSTEM 
CREATE USER KHUSER02 IDENTIFIED BY KHUSER02;
GRANT CONNECT TO KHUSER02;
GRANT RESOURCE TO KHUSER02;

--KHUSER02
CREATE TABLE STUDENT_TBL(
    NAME VARCHAR2(20),
    AGE NUMBER,
    GRADE VARCHAR2(10),
    ADDRESS VARCHAR2(200)
);
DROP TABLE STUDENT_TBL;