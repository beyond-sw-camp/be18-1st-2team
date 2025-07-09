-- player 테이블 (선수)
CREATE TABLE `player` (
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `player_name` VARCHAR(20) NOT NULL COMMENT '선수명',
  `birth` DATE COMMENT '생년월일',
  `number` CHAR(10) COMMENT '등번호',
  `phone` CHAR(16) COMMENT '연락처',
  `nation` VARCHAR(30) COMMENT '국적',
  `ent_date` DATE COMMENT '입단일',
  `height` INT COMMENT '키',
  `weight` INT COMMENT '몸무게',
  `absence` VARCHAR(30) COMMENT '부재사유',
  PRIMARY KEY (`player_id`),
  UNIQUE KEY (`phone`), -- 전화번호 중복금지
  UNIQUE KEY `unique_number` (`player_id`, `team_id`, `number`),	-- 한 팀에서 등번호 중복금지
  CONSTRAINT `FK_player_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
);