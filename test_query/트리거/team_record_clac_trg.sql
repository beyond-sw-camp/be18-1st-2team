ALTER TABLE `team_record`
  ADD UNIQUE KEY `uk_team_season` (`team_id`,`season`);
-- 한팀이 한시즌만 있어야함 계산 가능

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
