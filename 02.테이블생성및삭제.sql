-- 스키마 선택하기
USE testdb;

/*
  테이블은 부모 테이블을 먼저 만들고, 자식 테이블(FK 를 가진 테이블)을 나중에 만든다.
  테이블 삭제와 생성 순서는 항상 역순으로 작업한다,  
*/

-- 테이블 삭제하기
DROP TABLE IF EXISTS tbl_order CASCADE;	 -- 참조 중인 테이블이 존재하면 함께 삭제하는 CASCADE 옵션
DROP TABLE IF EXISTS tbl_product CASCADE;

-- 테이블 만들기
CREATE TABLE IF NOT EXISTS tbl_product
(
    prod_id   INT         NOT NULL    AUTO_INCREMENT PRIMARY KEY    COMMENT '제품코드',
    prod_name VARCHAR(20) NULL                                      COMMENT '제품이름',
    price     INT(5)                                                COMMENT '제품가격',
    stock     SMALLINT    DEFAULT 0                                 COMMENT '재고'
) ENGINE=INNODB COMMENT '제품';

CREATE TABLE IF NOT EXISTS tbl_order
(
    order_id   INT         NOT NULL    AUTO_INCREMENT    COMMENT '주문번호',
    order_user VARCHAR(20)                               COMMENT '주문자',
    prod_id    INT 										 COMMENT '제품번호',
    order_dt   DATETIME    DEFAULT NOW()                 COMMENT '주문일자',
    PRIMARY KEY(order_id),
    FOREIGN KEY(prod_id) REFERENCES tbl_product(prod_id)
) ENGINE=INNODB COMMENT '주문';

-- 주문 테이블의 자동 증가 순번을 1000 에서 시작한다.
ALTER TABLE tbl_order AUTO_INCREMENT = 1000;



-- 연습문제
DROP TABLE IF EXISTS tbl_customer CASCADE;
DROP TABLE IF EXISTS tbl_bank CASCADE;

CREATE TABLE IF NOT EXISTS tbl_bank
(
    bank_id VARCHAR(20) NOT NULL,
    bank_name VARCHAR(30),
    CONSTRAINT pk_bank PRIMARY KEY(bank_id)
) ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS tbl_customer
(
    cust_id INT NOT NULL AUTO_INCREMENT,
    cust_name VARCHAR(30) NOT NULL,
    phone VARCHAR(30) UNIQUE,
    age SMALLINT CHECK (age BETWEEN 0 AND 100),
    bank_id VARCHAR(20),
    CONSTRAINT pk_customer PRIMARY KEY(cust_id),
    CONSTRAINT fk_bank_customer FOREIGN KEY(bank_id) REFERENCES tbl_bank(bank_id)
) ENGINE=INNODB;

















