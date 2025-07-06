-- 경기 제거시 게임레코드디테일도 같이 삭제
ALTER TABLE game_record_detail
ADD CONSTRAINT FK_game_TO_game_record_detail_1
FOREIGN KEY (game_id) REFERENCES game(game_id)
ON DELETE CASCADE;

-- 선수의 소속팀이 해당 경기의 홈팀/원정팀이 아닌 경우
-- 아무것도 안떠야 논리 적합
SELECT 
  grd.game_id,
  grd.player_id,
  p.player_name,
  p.team_id AS player_team,
  g.home AS home_team,
  g.away AS away_team
FROM game_record_detail grd
JOIN player p ON grd.player_id = p.player_id
JOIN game g ON grd.game_id = g.game_id
WHERE p.team_id NOT IN (g.home, g.away);

-- 포지션이 투수가 아닌데 투수 기록이 존재하는 경우 
-- 아무것도 안떠야 논리 적합
SELECT 
  grd.player_id, p.player_name, grd.game_id, pos.position_name,
  grd.pitcher_g, grd.ip, grd.win
FROM game_record_detail grd
JOIN player_position pp ON grd.player_id = pp.player_id AND pp.is_main_position = TRUE
JOIN position pos ON pp.position_id = pos.position_id
JOIN player p ON grd.player_id = p.player_id
WHERE pp.position_id != 1
  AND (grd.pitcher_g IS NOT NULL OR grd.ip IS NOT NULL OR grd.win IS NOT NULL);

-- 한 경기에 동일 선수가 중복 기록된 경우
-- 아무것도 안떠야 논리 적합
SELECT player_id, game_id, COUNT(*) AS cnt
FROM game_record_detail
GROUP BY player_id, game_id
HAVING cnt > 1;

-- LG 트윈스 선수의 경기별 상세 기록 확인
SELECT 
  grd.game_detail_id,
  p.player_name,
  pos.position_name AS main_position,
  g.game_id,
  g.start_time,
  g.stadium,
  t_home.team_name AS home_team,
  t_away.team_name AS away_team,
  
  -- 타자 스탯
  grd.ab, grd.hit, grd.hr, grd.rbi,
  
  -- 투수 스탯
  grd.ip, grd.er, grd.pitcher_so, grd.win, grd.lose,
  
  -- 수비/주루
  grd.error, grd.dp, grd.sb
  
FROM game_record_detail grd
JOIN player p ON grd.player_id = p.player_id
LEFT JOIN player_position pp ON p.player_id = pp.player_id AND pp.is_main_position = TRUE -- 주포지션 표기
LEFT JOIN position pos ON pp.position_id = pos.position_id
JOIN game g ON grd.game_id = g.game_id
JOIN team t_home ON g.home = t_home.team_id
JOIN team t_away ON g.away = t_away.team_id

WHERE p.team_id = 1 -- LG 트윈스 소속 선수만 대상
ORDER BY g.game_id, p.player_name;

-- 타자 기록만 보기
SELECT 
  grd.game_detail_id,
  p.player_name,
  pos.position_name AS main_position,
  g.game_id,
  g.start_time,
  g.stadium,
  t_home.team_name AS home_team,
  t_away.team_name AS away_team,
  grd.ab, grd.hit, grd.hr, grd.rbi,
  grd.hitter_so, grd.hitter_bb,
  grd.error, grd.assist, grd.dp, grd.sb, grd.cs

FROM game_record_detail grd
JOIN player p ON grd.player_id = p.player_id
LEFT JOIN player_position pp ON p.player_id = pp.player_id AND pp.is_main_position = TRUE
LEFT JOIN position pos ON pp.position_id = pos.position_id
JOIN game g ON grd.game_id = g.game_id
JOIN team t_home ON g.home = t_home.team_id
JOIN team t_away ON g.away = t_away.team_id

WHERE pp.position_id != 1 -- 메인 포지션이 투수가 아닌 경우만
ORDER BY g.game_id, p.player_name;



-- 투수 기록만 보기
SELECT 
  grd.game_detail_id,
  p.player_name,
  pos.position_name AS main_position,
  g.game_id,
  g.start_time,
  g.stadium,
  t_home.team_name AS home_team,
  t_away.team_name AS away_team,
  grd.pitcher_g, grd.ip, grd.er, grd.pitcher_h, grd.pitcher_so, grd.pitcher_bb,
  grd.win, grd.lose, grd.`save`,
  grd.error, grd.assist, grd.dp

FROM game_record_detail grd
JOIN player p ON grd.player_id = p.player_id
LEFT JOIN player_position pp ON p.player_id = pp.player_id AND pp.is_main_position = TRUE
LEFT JOIN position pos ON pp.position_id = pos.position_id
JOIN game g ON grd.game_id = g.game_id
JOIN team t_home ON g.home = t_home.team_id
JOIN team t_away ON g.away = t_away.team_id

-- 메인 포지션이 투수인 경우만
WHERE pp.position_id = 1
ORDER BY g.game_id, p.player_name;
