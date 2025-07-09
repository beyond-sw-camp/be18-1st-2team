-- player_position 테이블 (선수 포지션)
CREATE TABLE `player_position` (
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `position_id` INT NOT NULL COMMENT '포지션 ID',
  `is_main_position` BOOLEAN COMMENT '주포지션 여부',
  PRIMARY KEY (`player_id`, `position_id`),
  CONSTRAINT `FK_pp_player`   FOREIGN KEY (`player_id`)   REFERENCES `player` (`player_id`),
  CONSTRAINT `FK_pp_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`)
);