-- 시즌이 겹치는걸 인서트 하면 안되기 떄문에 유니크 키 추가. 
ALTER TABLE team_record
ADD CONSTRAINT uq_team_season UNIQUE (team_id, season);

ALTER TABLE team_record
ADD CONSTRAINT fk_team_record_team_id FOREIGN KEY(team_id)
REFERENCES team(team_id);

-- 팀의 PK 추가.
ALTER TABLE team
ADD CONSTRAINT pk_team PRIMARY KEY (team_id);

--스태프에 팀 FK 추가. 
ALTER TABLE staff
ADD CONSTRAINT fk_staff_team FOREIGN KEY(team_id)
REFERENCES team(team_id);

-- 권한 ID에 PK추가.
ALTER TABLE permission
ADD CONSTRAINT pk_permission_id PRIMARY KEY(permission_id);

-- 사용자에 권한 Id, 팀 id 외래키 추가. 
ALTER TABLE `user`
ADD CONSTRAINT fk_user_permession FOREIGN KEY(permission_id)
REFERENCES permission(permission_id);

ALTER TABLE `user`
ADD CONSTRAINT fk_user_team_id FOREIGN KEY(team_id)
REFERENCES team(team_id);

-- 시즌 도중 염경엽 감독이 해임되고 김정준 수석코치가 감독으로 임명되었다면
UPDATE staff
SET resignation_date = '2023-06-30'
WHERE staff_name = '염경엽' AND role = '감독' AND team_id = 1;

UPDATE staff
SET resignation_date = '2023-06-30'
WHERE staff_name = '김정준' AND role = '수석코치' AND team_id = 1;

INSERT INTO staff (staff_id, team_id, role, staff_name, phone, career, hire_date, resignation_date)
VALUES (21, 1, '감독', '김정준', '010-1111-0002', '15년', '2023-07-01', NULL);

-- 김정준의 이력 조회
SELECT *
FROM staff
WHERE staff_name = '김정준' AND team_id = 1
ORDER BY hire_date;

SELECT team_id, COUNT(*) AS num_directors
FROM staff
WHERE role = '감독'
  AND resignation_date IS NULL
GROUP BY team_id
HAVING COUNT(*) > 1;



--데이터 무결성 검증 쿼리문

-- 퇴사일이 입사일 보다 빠르지 않은지 검증.
SELECT *
FROM staff
WHERE resignation_date IS NOT NULL
  AND resignation_date < hire_date;


-- LG 트윈스의 시즌별 성적 확인
SELECT r.season AS 시즌, r.game_count AS 경기수, r.win_count AS 승, r.draw_count AS 무, r.lose_count AS 패, r.winning_per AS 승률
FROM team_record r
JOIN team t ON r.team_id = t.team_id
WHERE t.team_name = 'LG 트윈스'
ORDER BY r.season DESC;

-- 승률 기준 상위 5개 시즌 (전 구단 기준)
SELECT r.season, r.winning_per
FROM team_record r
JOIN team t ON r.team_id = t.team_id
WHERE t.team_name = 'LG 트윈스'
ORDER BY r.winning_per DESC
LIMIT 5;

-- 특정 구단에 소속된 사용자 목록
SELECT u.name AS 사용자명, t.name AS 팀명
FROM user u
JOIN team t ON u.team_id = t.team_id
WHERE t.name = 'LG 트윈스';




