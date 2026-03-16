CREATE DATABASE knut;

CREATE TABLE animals(
	id bigserial,
	name varchar(20),
	age integer,
	kind varchar(20),
	dob date,
	location varchar(50)
);

TABLE animals; --

INSERT INTO animals (name, age, kind, dob, location)
values ('냥냥이', 6, '고양이', '2020-10-10', '경기도 광주시'),
	('멍멍이', 3, '강아지', '2023-05-12', '서울특별시 강남구'),
	('바둑이', 5, '강아지', '2021-02-28', '부산광역시 해운대구'),
	('나비', 2, '고양이', '2024-08-15', '대구광역시 수성구'),
	('토실이', 1, '햄스터', '2025-01-10', '인천광역시 부평구'),
	('짹짹이', 4, '앵무새', '2022-11-05', '광주광역시 서구');

SELECT * FROM animals;
	