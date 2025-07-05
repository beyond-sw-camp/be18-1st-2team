-- 시즌이 겹치는걸 인서트 하면 안된다. 
ALTER TABLE team_record
ADD CONSTRAINT uq_team_season UNIQUE (team_id, season);


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

SELECT *
FROM team
WHERE team_id > 10;

SELECT t.team_name AS 팀명, ROUND(AVG(r.winning_per), 3) AS 평균승률
FROM team_record r
JOIN team t ON r.team_id = t.team_id
GROUP BY t.team_name
ORDER BY 평균승률 DESC;



