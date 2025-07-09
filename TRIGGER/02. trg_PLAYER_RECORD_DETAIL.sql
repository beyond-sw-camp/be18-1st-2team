DELIMITER $$
CREATE TRIGGER trg_prd_after_insert
AFTER INSERT ON `player_record_detail`
FOR EACH ROW
BEGIN
  -- 누적 통계 집계
  INSERT INTO `player_record` (
    player_id, season,
    era, whip,
    `avg`, obp, slg, ops,
    epct, sba
  )
  SELECT
    NEW.player_id,
    NEW.season,
    ROUND(
      SUM(er) * 9.0
      / NULLIF( SUM(FLOOR(ip)*3 + ROUND((ip-FLOOR(ip))*10)) / 3.0, 0 )
    , 2) AS era,

    -- (피안타+볼넷) / (총아웃/3)
    ROUND(
      (SUM(pitcher_h) + SUM(pitcher_bb))
      / NULLIF( SUM(FLOOR(ip)*3 + ROUND((ip-FLOOR(ip))*10)) / 3.0, 0 )
    , 2) AS whip,
    -- 타율
    ROUND(SUM(hit)     / NULLIF(SUM(ab),0),                3),
    -- 출루율
    ROUND((SUM(hit)+SUM(hitter_bb)+SUM(hbp)) 
          / NULLIF(SUM(ab)+SUM(hitter_bb)+SUM(hbp)+SUM(sf),0), 3),
    -- 장타율
    ROUND((SUM(`1b`) + SUM(`2b`)*2 + SUM(`3b`)*3 + SUM(hr)*4)
          / NULLIF(SUM(ab),0),                              3),
    -- OPS = OBP + SLG
    ROUND(
      (SUM(hit)+SUM(hitter_bb)+SUM(hbp))
      / NULLIF(SUM(ab)+SUM(hitter_bb)+SUM(hbp)+SUM(sf),0)
      +
      (SUM(`1b`) + SUM(`2b`)*2 + SUM(`3b`)*3 + SUM(hr)*4)
      / NULLIF(SUM(ab),0)
    ,3),
    -- 수비율
    ROUND((SUM(po)+SUM(assist))
          / NULLIF(SUM(po)+SUM(assist)+SUM(`error`),0)
    ,3),
    -- 도루성공률 (%)
    ROUND(SUM(sb) / NULLIF(SUM(sb)+SUM(cs),0) * 100, 1)
  FROM `player_record_detail`
  WHERE player_id = NEW.player_id
    AND season    = NEW.season
  GROUP BY player_id, season
  ON DUPLICATE KEY UPDATE
    era  = VALUES(era),
    whip = VALUES(whip),
    `avg`= VALUES(`avg`),
    obp  = VALUES(obp),
    slg  = VALUES(slg),
    ops  = VALUES(ops),
    epct = VALUES(epct),
    sba  = VALUES(sba)
  ;
END$$
DELIMITER ;



-- UPDATE에도 적용
DELIMITER $$
CREATE TRIGGER trg_prd_after_update
AFTER UPDATE ON `player_record_detail`
FOR EACH ROW
BEGIN
    INSERT INTO `player_record` (
    player_id, season,
    era, whip,
    `avg`, obp, slg, ops,
    epct, sba
  )
  SELECT
    NEW.player_id,
    NEW.season,
    ROUND(
      SUM(er) * 9.0
      / NULLIF( SUM(FLOOR(ip)*3 + ROUND((ip-FLOOR(ip))*10)) / 3.0, 0 )
    , 2),
    ROUND(
      (SUM(pitcher_h) + SUM(pitcher_bb))
      / NULLIF( SUM(FLOOR(ip)*3 + ROUND((ip-FLOOR(ip))*10)) / 3.0, 0 )
    , 2),
    ROUND(SUM(hit)     / NULLIF(SUM(ab),0),                3),
    ROUND((SUM(hit)+SUM(hitter_bb)+SUM(hbp)) 
          / NULLIF(SUM(ab)+SUM(hitter_bb)+SUM(hbp)+SUM(sf),0), 3),
    ROUND((SUM(`1b`) + SUM(`2b`)*2 + SUM(`3b`)*3 + SUM(hr)*4)
          / NULLIF(SUM(ab),0),                              3),
    ROUND(
      (SUM(hit)+SUM(hitter_bb)+SUM(hbp))
      / NULLIF(SUM(ab)+SUM(hitter_bb)+SUM(hbp)+SUM(sf),0)
      +
      (SUM(`1b`) + SUM(`2b`)*2 + SUM(`3b`)*3 + SUM(hr)*4)
      / NULLIF(SUM(ab),0)
    ,3),
    ROUND((SUM(po)+SUM(assist))
          / NULLIF(SUM(po)+SUM(assist)+SUM(`error`),0)
    ,3),
    ROUND(SUM(sb) / NULLIF(SUM(sb)+SUM(cs),0) * 100, 1)
  FROM `player_record_detail`
  WHERE player_id = NEW.player_id
    AND season    = NEW.season
  GROUP BY player_id, season
  ON DUPLICATE KEY UPDATE
    era  = VALUES(era),
    whip = VALUES(whip),
    `avg`= VALUES(`avg`),
    obp  = VALUES(obp),
    slg  = VALUES(slg),
    ops  = VALUES(ops),
    epct = VALUES(epct),
    sba  = VALUES(sba)
  ;
END$$
DELIMITER ;