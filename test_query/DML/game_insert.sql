-- 홈팀 외래키 추가
ALTER TABLE `game`
ADD CONSTRAINT `FK_home_team`
FOREIGN KEY (`home`) REFERENCES `team`(`team_id`);

-- 원정팀 외래키 추가
ALTER TABLE `game`
ADD CONSTRAINT `FK_away_team`
FOREIGN KEY (`away`) REFERENCES `team`(`team_id`);

-- 하나만 연결돼있던 키 삭제
ALTER TABLE game DROP FOREIGN KEY FK_team_TO_game_1;

INSERT INTO game (game_id, home, away, start_time, end_time, win, lose, home_score, lose_score, stadium) VALUES
(1, 1, 9, '2025-05-01 18:00:00', '2025-05-01 21:00:00', 1, 9, 6, 1, '잠실야구장'),
(2, 1, 6, '2025-05-02 18:00:00', '2025-05-02 21:00:00', 1, 6, 9, 1, '잠실야구장'),
(3, 1, 5, '2025-05-03 18:00:00', '2025-05-03 21:00:00', 1, 5, 7, 1, '잠실야구장'),
(4, 1, 2, '2025-05-04 18:00:00', '2025-05-04 21:00:00', 1, 2, 6, 1, '잠실야구장'),
(5, 1, 4, '2025-05-05 18:00:00', '2025-05-05 21:00:00', 1, 4, 7, 2, '잠실야구장'),
(6, 6, 1, '2025-06-01 18:00:00', '2025-06-01 21:00:00', 6, 1, 3, 6, '대구삼성라이온즈파크'),
(7, 8, 1, '2025-06-02 18:00:00', '2025-06-02 21:00:00', 8, 1, 4, 8, '한화생명이글스파크'),
(8, 3, 1, '2025-06-03 18:00:00', '2025-06-03 21:00:00', 1, 3, 6, 8, '인천SSG랜더스필드'),
(9, 5, 1, '2025-06-04 18:00:00', '2025-06-04 21:00:00', 1, 5, 4, 10, '광주기아챔피언스필드'),
(10, 4, 1, '2025-06-05 18:00:00', '2025-06-05 21:00:00', 1, 4, 0, 10, '고척스카이돔');

-- LG와 해당 없는 경기 입력
INSERT INTO game (game_id, home, away, start_time, end_time, win, lose, home_score, lose_score, stadium) VALUES
(11, 2, 9, '2025-06-06 18:00:00', '2025-06-06 21:00:00', 2, 9, 5, 2, '잠실야구장'),
(12, 8, 6, '2025-06-07 18:00:00', '2025-06-07 21:00:00', 6, 8, 3, 4, '한화생명이글스파크'),
(13, 5, 3, '2025-06-08 18:00:00', '2025-06-08 21:00:00', 3, 5, 1, 5, '광주기아챔피언스필드'),
(14, 10, 2, '2025-06-09 18:00:00', '2025-06-09 21:00:00', 10, 2, 6, 1, '수원KT위즈파크');

-- 전체 경기 불러오기
SELECT 
  g.game_id,
  g.start_time,
  g.end_time,
  g.stadium,
  home.team_name AS home_team,
  away.team_name AS away_team,
  g.home_score,
  g.lose_score,
  g.win,
  g.lose
FROM game g
JOIN team home ON g.home = home.team_id
JOIN team away ON g.away = away.team_id
ORDER BY g.start_time;

-- LG 트윈스 경기만 조회 + 승패 결과 포함
SELECT 
  g.game_id,
  g.start_time,
  g.stadium,
  home.team_name AS home_team,
  away.team_name AS away_team,
  g.home_score,
  g.lose_score,
  CASE 
    WHEN g.win = 1 THEN '승'
    WHEN g.lose = 1 THEN '패'
    ELSE '무'
  END AS LG결과
FROM game g
JOIN team home ON g.home = home.team_id
JOIN team away ON g.away = away.team_id
WHERE g.home = 1 OR g.away = 1
ORDER BY g.start_time;
