-- game 테이블 (경기)
CREATE TABLE `game` (
  `game_id` INT NOT NULL COMMENT '경기 ID',
  `home` INT COMMENT '홈팀 ID',
  `away` INT COMMENT '원정팀 ID',
  `start_time` DATETIME COMMENT '시작일시',
  `end_time` DATETIME COMMENT '종료일시',
  `win` INT COMMENT '승리팀 ID (NULL: 전, 0: 무승부)',
  `lose` INT COMMENT '패배팀 ID',
  `home_score` INT COMMENT '홈팀 점수',
  `away_score` INT COMMENT '원정팀 점수',
  `stadium` VARCHAR(20) COMMENT '경기장',
  PRIMARY KEY (`game_id`),
  CONSTRAINT `FK_game_home` FOREIGN KEY (`home`) REFERENCES `team` (`team_id`),
  CONSTRAINT `FK_game_away` FOREIGN KEY (`away`) REFERENCES `team` (`team_id`)
);