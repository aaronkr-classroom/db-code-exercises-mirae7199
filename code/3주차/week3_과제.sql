/*
 [Entities]
 - Product

 [Product properties]
 - id               (BIGSERIAL)
 - name             (VARCHAR(30))
 - price            (NUMERIC)
 - quantity         (NUMERIC)
 - status           (product_status) -- 상품 상태 [SALE, SOLD]
 - registered_at    (DATE) -- 등록 날짜
 - updated_at       (DATE) -- 수정 날짜
 */

CREATE TYPE product_status AS ENUM ('SALE', 'SOLD'); -- ENUM 열거형 타입 생성

CREATE TABLE product (
     id BIGSERIAL,
     name VARCHAR(30),
     price NUMERIC,
     quantity NUMERIC,
     status product_status DEFAULT 'SALE',
     registered_at date,
     updated_at date
 );

INSERT INTO product (name, price, quantity, status, registered_at, updated_at)
    values  ('여름 쿨톤 파스텔 셔츠', 35000, 100, 'SALE', CURRENT_DATE - 5, CURRENT_DATE),
            ('와이드 핏 흑청 데님', 42000, 50, 'SALE', CURRENT_DATE - 4, CURRENT_DATE),
            ('오버핏 라이트 그레이 후드', 39000, 0, 'SOLD', CURRENT_DATE - 3, CURRENT_DATE),
            ('베이직 린넨 슬랙스', 32000, 80, 'SALE', CURRENT_DATE - 2, CURRENT_DATE),
            ('스트라이프 니트 베스트', 28000, 0, 'SOLD', CURRENT_DATE - 1, CURRENT_DATE);

SELECT * FROM product;

SELECT * FROM product
ORDER BY 1 DESC;

SELECT * FROM product
WHERE status = 'SALE';