-- train 테이블 (훈련)
CREATE TABLE `train` (
  `train_id` INT NOT NULL AUTO_INCREMENT COMMENT '훈련 ID',
  `player_id` INT NOT NULL COMMENT '선수 ID',
  `date` DATE COMMENT '훈련일자',
  `location` VARCHAR(20) COMMENT '훈련장소',
  `content` VARCHAR(100) COMMENT '훈련내용',
  PRIMARY KEY (`train_id`),
  CONSTRAINT `FK_train_player` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`)
);