
-- 경기 등록 (새로운 경기 등록)
INSERT INTO `game` (`game_id`,`home`,`away`,`start_time`,`end_time`,`win`,`lose`,`home_score`,`away_score`,`stadium`) 
VALUES
(5021, 5, 1, '2024-06-22 18:00:00', '2024-06-22 21:00:00', 5, 1, 7, 6, '광주기아챔피언스필드');


-- 경기 수정 (home이 7점, away가 10점, win에는 이긴 팀 id, lose에는 진 팀 id 수정)
UPDATE game
SET 
  home_score = 7,
  away_score = 10,
  win = 1,         
  lose = 5
WHERE game_id = 1001;

-- 경기 리스트 조회
SELECT  
  ht.team_name AS '홈팀',
  at.team_name AS '어웨이팀',
  DATE_FORMAT(g.start_time, '%Y년 %m월 %d일 %H시 %i분') AS '경기일시',
  IFNULL(wt.team_name, '무승부') AS '승리팀',
  g.home_score AS '홈팀 점수',
  g.away_score AS '어웨이팀 점수',
  g.stadium AS '경기장'
FROM game g
LEFT JOIN team ht ON g.home = ht.team_id
LEFT JOIN team AT ON g.away = at.team_id
LEFT JOIN team wt ON g.win = wt.team_id
ORDER BY 3 ASC;

-- 경기 삭제
DELETE FROM game
WHERE game_id = 1001
