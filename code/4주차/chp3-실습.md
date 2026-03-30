/*
 게임 유저 관리
 [Entities]
 - User
 - Profile

 [User properties]
 - id               (BIGSERIAL)
 - name             (VARCHAR(30))
 - email            (VARCHAR(100))
 - password         (VARCHAR(255)) -- 암호화해서 DB에 저장해야 함.
 - role             (user_role) -- 유저 권한 [ADMIN, USER]
 - status           (user_status) -- 유저 상태 ['INACTIVE', 'ACTIVE', 'SUSPENDED', 'DELETED']
 - registered_at    (DATE) -- 등록 날짜
 - updated_at       (DATE) -- 수정 날짜

 [profile properties]
 - profile_id               (BIGSERIAL)
 - nickname         (VARCHAR(30))
 - level            (NUMERIC)
 - exp              (NUMERIC)
 - user_id          (FOREIGN KEY)
 */

~~~
CREATE TYPE user_role AS ENUM ('ADMIN', 'USER'); -- ENUM 열거형 타입 생성
CREATE TYPE user_status AS ENUM ('INACTIVE', 'ACTIVE', 'SUSPENDED', 'DELETED');

CREATE TABLE users(
    user_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE, -- 중복 X
    password VARCHAR(255) NOT NULL,
    role user_role DEFAULT 'USER',
    status user_status DEFAULT 'INACTIVE', -- 등록 시 'INACTIVE' -> 'ACTIVE' 변경
    create_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE profile(
    profile_id BIGSERIAL PRIMARY KEY,
    nickname VARCHAR(30) NOT NULL UNIQUE, -- 닉네임 중복 X
    level NUMERIC NOT NULL DEFAULT 1,
    exp NUMERIC NOT NULL DEFAULT 0,
    user_id BIGINT NOT NULL UNIQUE, -- FK

    CONSTRAINT fk_profile_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE -- 삭제 시 같이 삭제.
);

INSERT INTO users (name, email, password, role, status, create_at, updated_at)
VALUES
    ('김철수', 'chulsoo@gmail.com',  'hashed_pw_1', 'USER',  'ACTIVE',   NOW(), NOW()),
    ('이영희', 'younghee@gmail.com', 'hashed_pw_2', 'USER',  'ACTIVE',   NOW(), NOW()),
    ('박관리', 'admin@game.com',     'hashed_pw_3', 'ADMIN', 'ACTIVE',   NOW(), NOW()),
    ('최휴면', 'dormant@gmail.com',  'hashed_pw_4', 'USER',  'INACTIVE', NOW(), NOW()),
    ('정정지', 'banned@gmail.com',   'hashed_pw_5', 'USER',  'SUSPENDED',NOW(), NOW());


INSERT INTO profile (nickname, level, exp, user_id)
VALUES
    ('철수킹',   10,  3500, 1),
    ('희희야',    5,  1200, 2),
    ('갓관리자', 99, 99999, 3),
    ('잠자는곰',  3,   800, 4),
    ('정지유저',  7,  2100, 5);

SELECT * FROM users;
SELECT user_id, name, role, status from users;

SELECT count(user_id), role
FROM users
GROUP BY role;

SELECT * FROM profile;

SELECT * FROM profile
ORDER BY level desc;

SELECT * FROM users
WHERE status = 'ACTIVE';
~~~
