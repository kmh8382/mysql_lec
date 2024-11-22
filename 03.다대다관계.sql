/*
    다대다 관계
    두 엔티티 사이에 다대다 관계가 존재할 수 있다.
    예시 : 학생과 과목, 고객과 상품 등
    다대다 관계는 두 엔디디의 직접 연결이 불가능하므로, 새로운 엔티티를 추가하여 2개의 일대다 관계로 추가한다.
    예시 학생과 과목(학생 - 수강신청 - 과목), 고객과 상품(고객 - 구매내역 - 상품)
*/

-- 학생 - 수강신청 - 과목
DROP TABLE IF EXISTS tbl_registration CASCADE;
DROP TABLE IF EXISTS tbl_student CASCADE;
DROP TABLE IF EXISTS tbl_subject CASCADE;

CREATE TABLE IF NOT EXISTS tbl_student 
(
    student_id CHAR(5) NOT NULL,
    student_name VARCHAR(20) NOT NULL,
    student_age INT,
    CONSTRAINT pk_student PRIMARY KEY(student_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tbl_subject
(
    subject_id CHAR(1) NOT NULL,
    subject_name VARCHAR(20) NOT NULL,
    professor VARCHAR(20), 
    CONSTRAINT pk_subject PRIMARY KEY(subject_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tbl_registration
(
    student_id CHAR(5) NOT NULL,
    subject_id CHAR(1) NOT NULL,
    CONSTRAINT pk_registration PRIMARY KEY(student_id, subject_id),
    CONSTRAINT fk_student_registration FOREIGN KEY(student_id) REFERENCES tbl_student(student_id),
    CONSTRAINT fk_subject_registration FOREIGN KEY(subject_id) REFERENCES tbl_subject(subject_id)    
) ENGINE=INNODB;














