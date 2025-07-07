
-- pitcher_g 제거 여부
-- game_record_detail 생성
INSERT INTO game_record_detail (
game_detail_id, player_id, game_id, season,
hitter_g, ab, hit, hr, rbi, hitter_so, hitter_bb,
pitcher_g, ip, er, pitcher_h, pitcher_so, pitcher_bb, win, lose, save,
error, assist, dp, sb, cs
) VALUES
(1, 3001, 1001, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.0, 0, 0, 5, 0, 0, 1, 0, 0, 0, 0, NULL, NULL),
(2, 3001, 1002, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.1, 1, 1, 6, 1, 1, 0, 0, 1, 1, 1, NULL, NULL),
(3, 3002, 1003, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.2, 2, 2, 7, 2, 0, 1, 0, 2, 2, 0, NULL, NULL),
(4, 3003, 1004, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.3, 3, 3, 8, 3, 1, 0, 0, 0, 3, 1, NULL, NULL),
(5, 3004, 1005, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.4, 4, 4, 9, 4, 0, 1, 0, 1, 4, 0, NULL, NULL),
(6, 3005, 1001, 2024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.5, 5, 5, 10, 5, 1, 0, 0, 2, 0, 1, NULL, NULL),
(7, 3006, 1002, 2022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.6, 0, 6, 11, 0, 0, 1, 0, 0, 1, 0, NULL, NULL),
(8, 3007, 1003, 2023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6.7, 1, 7, 12, 1, 1, 0, 0, 1, 2, 1, NULL, NULL),
(9, 4001, 1001, 2022, 1, 1, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0);

-- game_record_detail 생성
INSERT INTO game_record_detail (
game_detail_id, player_id, game_id, season,
hitter_g, ab, hit, hr, rbi, hitter_so, hitter_bb,
pitcher_g, ip, er, pitcher_h, pitcher_so, pitcher_bb, win, lose, save,
error, assist, dp, sb, cs
) VALUES
(10, 4002, 1002, 2023, 1, 2, 1, 0, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1),
(11, 4003, 1003, 2024, 1, 3, 2, 0, 2, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 0, 2, 0),
(12, 4004, 1004, 2022, 1, 4, 3, 1, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 1, 0, 1),
(13, 4005, 1005, 2023, 1, 5, 0, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0),
(14, 4006, 1001, 2024, 1, 1, 1, 0, 1, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, 1),
(15, 4007, 1002, 2022, 1, 2, 2, 0, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, 0),
(16, 4008, 1003, 2023, 1, 3, 3, 1, 3, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 1),
(17, 4009, 1004, 2024, 1, 4, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 2, 0),
(18, 4010, 1005, 2022, 1, 5, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1),
(19, 4011, 1001, 2023, 1, 1, 2, 0, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 0, 1, 0),
(20, 4012, 1002, 2024, 1, 2, 3, 1, 3, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 2, 1),
(21, 4001, 1003, 2022, 1, 3, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0),
(22, 4002, 1004, 2023, 1, 4, 1, 0, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1),
(23, 4003, 1005, 2024, 1, 5, 2, 0, 2, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 0, 2, 0),
(24, 4004, 1001, 2022, 1, 1, 3, 1, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 1, 0, 1),
(25, 4005, 1002, 2023, 1, 2, 0, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0),
(26, 4006, 1003, 2024, 1, 3, 1, 0, 1, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, 1),
(27, 4007, 1004, 2022, 1, 4, 2, 0, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, 0),
(28, 4008, 1005, 2023, 1, 5, 3, 1, 3, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 1),
(29, 4009, 1001, 2024, 1, 1, 0, 0, 0, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 0, 2, 0),
(30, 4010, 1002, 2022, 1, 2, 1, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1),
(31, 4011, 1003, 2023, 1, 3, 2, 0, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 0, 1, 0),
(32, 4012, 1004, 2024, 1, 4, 3, 1, 3, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 1, 2, 1);

-- game_record_detail 생성
INSERT INTO game_record_detail (
game_detail_id, player_id, game_id, season,
hitter_g, ab, hit, hr, rbi, hitter_so, hitter_bb,
pitcher_g, ip, er, pitcher_h, pitcher_so, pitcher_bb, win, lose, save,
error, assist, dp, sb, cs
) VALUES
(33, 4001, 1005, 2022, 1, 5, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0),
(34, 4002, 1001, 2023, 1, 1, 1, 0, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1),
(35, 4003, 1002, 2024, 1, 2, 2, 0, 2, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 0, 2, 0),
(36, 4004, 1003, 2022, 1, 3, 3, 1, 3, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 1, 0, 1),
(37, 4005, 1004, 2023, 1, 4, 0, 0, 0, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 1, 0),
(38, 4006, 1005, 2024, 1, 5, 1, 0, 1, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 1, 2, 1),
(39, 4007, 1001, 2022, 1, 1, 2, 0, 2, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, 0, 0, 0),
(40, 4008, 1002, 2023, 1, 2, 3, 1, 3, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 1, 1);

-- game_record_detail 에서 Player별 데이터 추출
INSERT INTO player_record_detail (
  player_id,
  season,
  hitter_g,
  ab,
  hit,
  hr,
  rbi,
  hitter_so,
  hitter_bb,
  pitcher_g,
  ip,
  er,
  pitcher_h,
  pitcher_so,
  pitcher_bb,
  win,
  lose,
  save,
  `error`,
  assist,
  dp,
  sb,
  cs
)
SELECT
  player_id,
  season,
  SUM(IFNULL(hitter_g,0))   AS hitter_g,
  SUM(IFNULL(ab,0))         AS ab,
  SUM(IFNULL(hit,0))        AS hit,
  SUM(IFNULL(hr,0))         AS hr,
  SUM(IFNULL(rbi,0))        AS rbi,
  SUM(IFNULL(hitter_so,0))  AS hitter_so,
  SUM(IFNULL(hitter_bb,0))  AS hitter_bb,
  SUM(IFNULL(pitcher_g,0))  AS pitcher_g,
  ROUND(SUM(IFNULL(ip,0)),1) AS ip,
  SUM(IFNULL(er,0))         AS er,
  SUM(IFNULL(pitcher_h,0))  AS pitcher_h,
  SUM(IFNULL(pitcher_so,0)) AS pitcher_so,
  SUM(IFNULL(pitcher_bb,0)) AS pitcher_bb,
  SUM(IFNULL(win,0))        AS win,
  SUM(IFNULL(lose,0))       AS lose,
  SUM(IFNULL(save,0))       AS save,
  SUM(IFNULL(`error`,0))    AS `error`,
  SUM(IFNULL(assist,0))     AS assist,
  SUM(IFNULL(dp,0))         AS dp,
  SUM(IFNULL(sb,0))         AS sb,
  SUM(IFNULL(cs,0))         AS cs
FROM game_record_detail
GROUP BY player_id, season
;


-- player_record_detail 에서 Player별 통산 데이터 추출
DELETE FROM player_record;
INSERT INTO player_record (
  player_id,
  season,
  era,
  whip,
  `avg`,
  obp,
  slg,
  ops,
  epct,
  sba
)
SELECT
  player_id,
  season,
  ROUND(SUM(er) * 9.0 / NULLIF(SUM(ip),0), 2) AS era,
  ROUND((SUM(pitcher_h) + SUM(pitcher_bb)) / NULLIF(SUM(ip),0), 2) AS whip,
  ROUND(SUM(hit) / NULLIF(SUM(ab),0), 3) AS `avg`,
  ROUND((SUM(hit) + SUM(hitter_bb)) / NULLIF(SUM(ab + hitter_bb + cs),0), 3) AS obp,
  ROUND((SUM(hr) * 4.0) / NULLIF(SUM(ab),0), 3) AS slg,
  ROUND(
    (SUM(hit) + SUM(hitter_bb)) / NULLIF(SUM(ab + hitter_bb + cs),0)
    + (SUM(hr) * 4.0) / NULLIF(SUM(ab),0), 3)  AS ops,
  ROUND(1 - SUM(`error`) / NULLIF(SUM(`error` + assist + dp),0)  , 3) AS epct,
  ROUND(SUM(sb) / NULLIF(SUM(sb + cs),0),  AS sba
FROM player_record_detail
GROUP BY player_id, season
;
