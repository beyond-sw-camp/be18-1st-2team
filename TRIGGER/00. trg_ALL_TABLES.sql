-- 01. trg_GAME_RECORD_DETAIL.sql
DELIMITER $$
CREATE TRIGGER trg_game_record_detail_after_insert
AFTER INSERT ON `game_record_detail`
FOR EACH ROW
BEGIN
  INSERT INTO `player_record_detail` (
    player_id, season,
    games, ab, hit,`1b`,`2b`,`3b`, hr, rbi,
    hitter_so, hitter_bb,hbp,sf,
    ip, er, pitcher_h, pitcher_so, pitcher_bb,
    win, lose, save,
    `error`, assist, po, sb, cs
  ) VALUES (
    NEW.player_id, NEW.season,
    1,
    IFNULL(NEW.ab,0),   IFNULL(NEW.hit,0),
    IFNULL(NEW.`1b`,0), IFNULL(NEW.`2b`,0), IFNULL(NEW.`3b`,0),
    IFNULL(NEW.hr,0),   IFNULL(NEW.rbi,0),
    IFNULL(NEW.hitter_so,0), IFNULL(NEW.hitter_bb,0),
    IFNULL(NEW.hbp,0), IFNULL(NEW.sf,0),
    IFNULL(NEW.ip,0),   IFNULL(NEW.er,0),
    IFNULL(NEW.pitcher_h,0), IFNULL(NEW.pitcher_so,0), IFNULL(NEW.pitcher_bb,0),
    IFNULL(NEW.win,0),  IFNULL(NEW.lose,0),  IFNULL(NEW.save,0),
    IFNULL(NEW.`error`,0), IFNULL(NEW.assist,0), IFNULL(NEW.po,0),
    IFNULL(NEW.sb,0),   IFNULL(NEW.cs,0)
  )
  ON DUPLICATE KEY UPDATE
    games       = games       + 1,
    ab          = ab          + VALUES(ab),
    hit         = hit         + VALUES(hit),
    `1b`         = `1b`         + VALUES(`1b`),
    `2b`        = `2b`        + VALUES(`2b`),
    `3b`        = `3b`        + VALUES(`3b`),
    hr          = hr          + VALUES(hr),
    rbi         = rbi         + VALUES(rbi),
    hitter_so   = hitter_so   + VALUES(hitter_so),
    hitter_bb   = hitter_bb   + VALUES(hitter_bb),
    hbp   = hbp   + VALUES(hbp),
    sf   = sf   + VALUES(sf),
     ip = (
      FLOOR(  /* 정수부 = total_outs ÷ 3 */
        (
          /* 기존아웃 */ FLOOR(ip)*3
          + ROUND((ip - FLOOR(ip))*10)
          /* + incoming 아웃 */ 
          + FLOOR(VALUES(ip))*3
          + ROUND((VALUES(ip) - FLOOR(VALUES(ip)))*10)
        ) / 3
      )
      /* + 소수부 = (total_outs % 3) × 0.1 */
      + (MOD(
          FLOOR(ip)*3 
          + ROUND((ip - FLOOR(ip))*10)
          + FLOOR(VALUES(ip))*3
          + ROUND((VALUES(ip) - FLOOR(VALUES(ip)))*10)
        , 3) * 0.1)
    ),
    er          = er          + VALUES(er),
    pitcher_h   = pitcher_h   + VALUES(pitcher_h),
    pitcher_so  = pitcher_so  + VALUES(pitcher_so),
    pitcher_bb  = pitcher_bb  + VALUES(pitcher_bb),
    win         = win         + VALUES(win),
    lose        = lose        + VALUES(lose),
    save        = save        + VALUES(save),
    `error`     = `error`     + VALUES(`error`),
    assist      = assist      + VALUES(assist),
    po          = po          + VALUES(po),
    sb          = sb          + VALUES(sb),
    cs          = cs          + VALUES(cs)
  ;
END$$
DELIMITER ;

-- 02. trg_PLAYER_RECORD_DETAIL.sql
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



-- 03. trg_GAME.sql
DELIMITER $$
CREATE TRIGGER trg_game_after_insert
AFTER INSERT ON `game`
FOR EACH ROW
BEGIN
  DECLARE s YEAR;
  SET s = YEAR(NEW.start_time);

  -- 홈팀 기록 갱신
  INSERT INTO `team_record`
    (`team_id`, `season`, `game_count`, `win_count`, `draw_count`, `lose_count`, `winning_per`)
  VALUES
    (NEW.home, s, 1,
      IF(NEW.win = NEW.home, 1, 0),
      IF(NEW.win = 0, 1, 0),
      IF(NEW.lose = NEW.home, 1, 0),
      0
    )
  ON DUPLICATE KEY UPDATE
    `game_count` = `game_count` + 1,
    `win_count`  = `win_count`  + IF(NEW.win = NEW.home, 1, 0),
    `draw_count` = `draw_count` + IF(NEW.win = 0, 1, 0),
    `lose_count` = `lose_count` + IF(NEW.lose = NEW.home, 1, 0),
    `winning_per` = ROUND(`win_count` / NULLIF(`game_count` - `draw_count`,0),3)
  ;

  -- 원정팀 기록 갱신
  INSERT INTO `team_record`
    (`team_id`, `season`, `game_count`, `win_count`, `draw_count`, `lose_count`, `winning_per`)
  VALUES
    (NEW.away, s, 1,
      IF(NEW.win = NEW.away, 1, 0),
      IF(NEW.win = 0, 1, 0),
      IF(NEW.lose = NEW.away, 1, 0),
      0
    )
  ON DUPLICATE KEY UPDATE
    `game_count` = `game_count` + 1,
    `win_count`  = `win_count`  + IF(NEW.win = NEW.away, 1, 0),
    `draw_count` = `draw_count` + IF(NEW.win = 0, 1, 0),
    `lose_count` = `lose_count` + IF(NEW.lose = NEW.away, 1, 0),
    `winning_per` = ROUND(`win_count` / NULLIF(`game_count` - `draw_count`,0),3)
  ;
END$$
DELIMITER ;

-- 04. trg_STAFF.sql
DELIMITER $$

CREATE TRIGGER trg_staff_before_insert
BEFORE INSERT ON staff
FOR EACH ROW
BEGIN
    DECLARE coach_count INT;
    DECLARE existing_same_person INT;

    -- 1. 같은 이름+폰번호가 이미 있으면 거부
    SELECT COUNT(*) INTO existing_same_person
    FROM staff
    WHERE staff_name = NEW.staff_name
      AND phone = NEW.phone
      AND team_id = NEW.team_id
      AND resignation_date IS NULL;

    IF existing_same_person > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '동일한 이름과 전화번호를 가진 스태프가 이미 존재합니다. 해당 스태프를 해고처리하세요.';
    END IF;

    -- 2. 역할별 정책 분기
    IF NEW.role = '감독' THEN
    SELECT COUNT(*) INTO existing_same_person
    FROM staff
    WHERE resignation_date IS NULL;
    
    if existing_same_person > 0 THEN
    	  SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '감독이 이미 있습니다. 감독을 해고처리 하하세요.';
    END IF;
      

    END IF;
END$$

DELIMITER ;