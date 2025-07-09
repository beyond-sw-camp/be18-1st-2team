-- contract 테이블 (계약)
CREATE TABLE `contract` (
  `contract_id` INT NOT NULL AUTO_INCREMENT COMMENT '계약ID',
  `payment` BIGINT COMMENT '계약금',
  `year_salary` BIGINT COMMENT '연봉',
  `contract_start` DATE COMMENT '계약시작일',
  `contract_end` DATE COMMENT '계약종료일',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  PRIMARY KEY (`contract_id`),
  UNIQUE KEY (`player_id`,`contract_start`), -- 선수의 계약시작일 중복금지
  CONSTRAINT `FK_contract_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `FK_contract_team`   FOREIGN KEY (`team_id`)   REFERENCES `team` (`team_id`)
);