-- team_record 테이블 (팀 Season 성적)
CREATE TABLE `team_record` (
  `team_record_id` INT NOT NULL AUTO_INCREMENT COMMENT '팀 성적 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `season` YEAR COMMENT '시즌',
  `game_count` INT COMMENT '경기수',
  `win_count` INT COMMENT '승',
  `draw_count` INT COMMENT '무',
  `lose_count` INT COMMENT '패',
  `winning_per` DECIMAL(4,3) COMMENT '승률',
  PRIMARY KEY (`team_record_id`),
  CONSTRAINT `FK_tr_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`),
  CONSTRAINT `uk_team_season` UNIQUE (`team_id`, `season`) -- 팀의 동일 시즌 중복금지
);