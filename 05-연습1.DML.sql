DROP DATABASE IF EXISTS db_menu;
CREATE DATABASE IF NOT EXISTS db_menu;
USE db_menu;


DROP TABLE IF EXISTS tbl_payment_order CASCADE;
DROP TABLE IF EXISTS tbl_payment CASCADE;
DROP TABLE IF EXISTS tbl_order CASCADE;
DROP TABLE IF EXISTS tbl_order_menu CASCADE;
DROP TABLE IF EXISTS tbl_cartegory CASCADE;
DROP TABLE IF EXISTS tbl_menu CASCADE;

CREATE TABLE IF NOT EXISTS tbl_cartegory
(
    cartegory_code     INT NOT NULL AUTO_INCREMENT COMMENT '카테고리코드',
    cartegory_name     VARCHAR(30) NOT NULL COMMENT '카테고리명',
    ref_cartegory_code INT COMMENT '상위카테고리코드',
    CONSTRAINT pk_cartegory PRIMARY KEY(cartegory_code),
    CONSTRAINT fk_ref_cartegory FOREIGN KEY(ref_cartegory_code) REFERENCES tbl_cartegory(cartegory_code) 
 )ENGINE=INNODB COMMENT '카테고리';

CREATE TABLE IF NOT EXISTS tbl_menu
(
    menu_code        INT NOT NULL AUTO_INCREMENT COMMENT '메뉴코드',
    menu_name        VARCHAR(30) NOT NULL COMMENT '메뉴명',
    menu_price       INT NOT NULL COMMENT '메뉴가격',    
    cartegory_code   INT NOT NULL COMMENT '카테고리코드',
    orderable_status CHAR(1) NOT NULL COMMENT '주문가능상태',
    CONSTRAINT pk_menu PRIMARY KEY(menu_code),
    CONSTRAINT fk_menu_category FOREIGN KEY(cartegory_code) REFERENCES tbl_cartegory(cartegory_code) 
) ENGINE=INNODB COMMENT '메뉴';

CREATE TABLE IF NOT EXISTS tbl_order
(
    order_code        INT NOT NULL AUTO_INCREMENT COMMENT '주문코드',
    order_date        VARCHAR(8) NOT NULL COMMENT '주문일',
    order_time        VARCHAR(8) NOT NULL COMMENT '주문시간',
    total_order_price INT NOT NULL COMMENT '총주문금액',
    CONSTRAINT pk_order PRIMARY KEY(order_code)
) ENGINE=INNODB COMMENT '주문';

CREATE TABLE IF NOT EXISTS tbl_order_menu
(
    order_code   INT NOT NULL COMMENT '주문코드',
    menu_code    INT NOT NULL COMMENT '메뉴코드',
    order_amount INT NOT NULL COMMENT '주문수량',
    CONSTRAINT pk_ordermenu PRIMARY KEY(order_code, menu_code),
    CONSTRAINT fk_ordermenu_order FOREIGN KEY(order_code) REFERENCES tbl_order(order_code),     
    CONSTRAINT fk_ordermenu_menu FOREIGN KEY(menu_code) REFERENCES tbl_menu(menu_code)
 )ENGINE=INNODB COMMENT '주문별메뉴';

CREATE TABLE IF NOT EXISTS tbl_payment 
(
    payment_code  INT NOT NULL AUTO_INCREMENT COMMENT '결제코드',
    payment_date  VARCHAR(8) NOT NULL COMMENT '결제일',
    payment_time  VARCHAR(8) NOT NULL COMMENT '결제시간',
    payment_price INT NOT NULL COMMENT '결제금액',
    payment_type  VARCHAR(6) NOT NULL COMMENT '결제구분',
    CONSTRAINT pk_payment PRIMARY KEY(payment_code)
) ENGINE=INNODB COMMENT '결제';

CREATE TABLE IF NOT EXISTS tbl_payment_order
(
    order_code   INT NOT NULL COMMENT '주문코드',
    payment_code INT NOT NULL COMMENT '결제코드',
    CONSTRAINT pk_paymentorder PRIMARY KEY(order_code, payment_code),
    CONSTRAINT fk_order_paymentorder FOREIGN KEY(order_code) REFERENCES tbl_order(order_code), 
    CONSTRAINT fk_payment_paymentorder FOREIGN KEY(payment_code) REFERENCES tbl_payment(payment_code) 
 )ENGINE=INNODB COMMENT '주문결제';


INSERT INTO tbl_cartegory VALUES
    (NULL, '식사', NULL), 
    (NULL, '음료', NULL),
    (NULL, '디저트', NULL),    
    (NULL, '한식', 1),
    (NULL, '중식', 1),
    
    (NULL, '일식', 1),
    (NULL, '퓨전', 1),    
    (NULL, '커피', 2),
    (NULL, '쥬스', 2),
    (NULL, '기타', 2),
    
    (NULL, '동양', 3),
    (NULL, '서양', 3);


INSERT INTO tbl_menu VALUES 
    (null, '열무김치라떼', 4500, 8, 'Y'),                 -- 커피
    (null, '우럭스무디', 5000, 10, 'Y'),                  -- 기타
    (null, '생갈치쉐이크', 6000, 10, 'Y'),                -- 기타
    (null, '갈릭미역파르페', 7000, 10, 'Y'),              -- 기타
    (null, '앙버터김치찜', 13000, 4, 'N'),                -- 한식
    
    (null, '생마늘샐러드', 12000, 4, 'Y'),                -- 한식
    (null, '민트미역국', 15000, 4, 'Y'),                  -- 한식
    (null, '한우딸기국밥', 20000, 4, 'Y'),                -- 한식
    (null, '홍어마카롱', 9000, 12, 'Y'),                  -- 서양
    (null, '코다리마늘빵', 7000, 12, 'N'),                -- 서양

    (null, '정어리빙수', 10000, 10, 'Y'),                 -- 기타
    (null, '날치알스크류바', 2000, 10, 'Y'),              -- 기타
    (null, '직화구이젤라또', 8000, 12, 'Y'),              -- 서양
    (null, '과메기커틀릿', 13000, 6, 'Y'),                -- 일식
    (null, '죽방멸치튀김우동', 11000, 6, 'N'),            -- 일식

    (null, '흑마늘아메리카노', 9000, 8, 'Y'),             -- 한식
    (null, '아이스가리비관자육수', 6000, 10, 'Y'),        -- 기타    
    (null, '붕어빵초밥', 35000, 6, 'Y'),                  -- 일식
    (null, '까나리코코넛쥬스', 9000, 9, 'Y'),             -- 쥬스
    (null, '마라깐쇼한라봉', 22000, 5, 'N'),              -- 중식

    (null, '돌미나리백설기', 5000, 11, 'Y');              -- 동양


COMMIT;    
    
    
    
    
    
    
    






