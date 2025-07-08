DELIMITER $$
CREATE TRIGGER trg_game_record_detail_after_insert
AFTER INSERT ON `game_record_detail`
FOR EACH ROW
BEGIN
  INSERT INTO `player_record_detail` (
    player_id, season,
    games, ab, hit, hr, rbi,
    hitter_so, hitter_bb,
    ip, er, pitcher_h, pitcher_so, pitcher_bb,
    win, lose, save,
    `error`, assist, po, sb, cs
  ) VALUES (
    NEW.player_id, NEW.season,
    1,
    IFNULL(NEW.ab,0),   IFNULL(NEW.hit,0),
    IFNULL(NEW.hr,0),   IFNULL(NEW.rbi,0),
    IFNULL(NEW.hitter_so,0), IFNULL(NEW.hitter_bb,0),
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
    hr          = hr          + VALUES(hr),
    rbi         = rbi         + VALUES(rbi),
    hitter_so   = hitter_so   + VALUES(hitter_so),
    hitter_bb   = hitter_bb   + VALUES(hitter_bb),
    ip          = ROUND(ip    + VALUES(ip),1),
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