-- player_record 테이블 (선수 Season 기록)
CREATE TABLE `player_record` (
  `player_record_id` INT NOT NULL AUTO_INCREMENT COMMENT '선수기록 ID',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `season` YEAR COMMENT '시즌연도',
  `era` DECIMAL(4,2) COMMENT '평균자책점',
  `whip` DECIMAL(4,2) COMMENT 'WHIP',
  `avg` DECIMAL(4,3) COMMENT '타율',
  `obp` DECIMAL(4,3) COMMENT '출루율',
  `slg` DECIMAL(4,3) COMMENT '장타율',
  `ops` DECIMAL(4,3) COMMENT 'OPS',
  `epct` DECIMAL(4,3) COMMENT '수비율',
  `sba` DECIMAL(4,1) COMMENT '도루성공률',
  PRIMARY KEY (`player_record_id`),
  UNIQUE KEY (`player_id`,`season`), -- 선수의 동일 시즌 중복금지
  CONSTRAINT `FK_pr_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
);