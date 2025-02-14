### 오라클 실행

SW "Run SQL Commend Line" 실행

### 1. User 생성
**[DBA User]**접속
conn /as sysdba

**[DBA User]**현재 유저 보기
show user

**[DBA User]** scott  유저 만들기
create user scott identified by 1234;

**[DBA User]** scott 유저 DBA 권한 주기
grant connect, resource, dba to manager;

**[DBA User]** HR 유저/패스워드 생성 및 계정 잠금 해제
alter user hr identified by 1234 account unlock;

**[DBA User]**scott 유저로 접속
conn scott/1234

**[scott** **User]**현재 유저 보기
show user


### [DBA User]테이블 생성하기
[부서]테이블 생성(**Constraints_포함**)
DROP TABLE DEPT CASCADE CONSTRAINTS ;  //테이블 존재시 삭제

CREATE TABLE DEPT(
         DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,                                 --DNO (부서번호)
         DNAME VARCHAR2(14),                                --DNAME (부서이름)
         LOC   VARCHAR2(13) ) ;                             --LOC   (부서위치)

[부서]데이터 입력
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK'); 
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

[부서]데이터 저장
COMMIT;

[사원]테이블 생성
DROP TABLE EMP CASCADE CONSTRAINTS ; //테이블 존재시 삭제

CREATE TABLE EMP 
        (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,                                  --EMPNO (사원번호)
         ENAME VARCHAR2(10),                                --ENAME (사원이름)
         JOB   VARCHAR2(9),                                 --JOB   (사원업무)
         MGR   NUMBER(4),                                   --MGR   (사원의 관리자)
         HIREDATE DATE,                                     --HIREDATE (입사일)
         SAL NUMBER(7,2),                                   --SAL (월급)
         COMM NUMBER(7,2),                                  --COMM (인센티브/보너스)
         DEPTNO NUMBER(2) CONSTRAINT FK_DNO REFERENCES DEPT);  -- EMP TABLE의 Pk 컬럼을 참조                                 --DNAME (부서이름)

[참고] 컬럼명 변경
alter table emp rename column dno to deptno;

[사원]데이터 입력
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MGR',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MGR',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MGR',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);

[사원]데이터 저장
COMMIT;



[부서]테이블 생성(**Constraints_미포함**)
DROP TABLE DEPT ;  -- 제약조건 존재시테이블  삭제

CREATE TABLE DEPT(
         DEPTNO NUMBER(2) ,                                 --DNO (부서번호)
         DNAME VARCHAR2(14),                                --DNAME (부서이름)
         LOC   VARCHAR2(13) ) ;                             --LOC   (부서위치)

[부서]데이터 입력
INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK'); 
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

[부서]데이터 저장
COMMIT;

[사원]테이블 생성
DROP TABLE EMP ; -- 제약조건 존재시테이블  삭제

CREATE TABLE EMP 
        (EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,                                  --EMPNO (사원번호)
         ENAME VARCHAR2(10),                                --ENAME (사원이름)
         JOB   VARCHAR2(9),                                 --JOB   (사원업무)
         MGR   NUMBER(4),                                   --MGR   (사원의 관리자)
         HIREDATE DATE,                                     --HIREDATE (입사일)
         SAL NUMBER(7,2),                                   --SAL (월급)
         COMM NUMBER(7,2),                                  --COMM (인센티브/보너스)
         DEPTNO NUMBER(2) );                                   --DNAME (부서이름)

[사원]데이터 입력
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',    7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN', 7698,to_date('20-2-1981', 'dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',  7698,to_date('22-2-1981', 'dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MGR',  7839,to_date('2-4-1981',  'dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981', 'dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MGR',  7839,to_date('1-5-1981',  'dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MGR',  7839,to_date('9-6-1981',  'dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',  7566,to_date('13-07-1987', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT', NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981',  'dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',    7788,to_date('13-07-1987', 'dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',    7698,to_date('3-12-1981', 'dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',   7566,to_date('3-12-1981', 'dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',   7782,to_date('23-1-1982', 'dd-mm-yyyy'),1300,NULL,10);
[사원]데이터 저장
COMMIT;

[급여]데이블 생성
CREATE TABLE SALGRADE 
	(GRADE NUMBER, 
	 LOSAL NUMBER, 
	 HISAL NUMBER
    );
	
[급여]데이터 입력	
INSERT INTO SALGRADE VALUES(1,	700	,	1200);
INSERT INTO SALGRADE VALUES(2,	1201,	1400);
INSERT INTO SALGRADE VALUES(3,	1401,	2000);
INSERT INTO SALGRADE VALUES(4,	2001,	3000);
INSERT INTO SALGRADE VALUES(5,	3001,	9999);
   
COMMIT;