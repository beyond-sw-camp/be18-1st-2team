-- team 테이블 (구단 정보)
CREATE TABLE `team` (
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `team_name` VARCHAR(20) NOT NULL COMMENT '팀명',
  `region` VARCHAR(20) COMMENT '연고지',
  `found_year` YEAR COMMENT '창단일',
  `stadium` VARCHAR(20) COMMENT '홈구장',
  PRIMARY KEY (`team_id`),
  UNIQUE KEY (`team_name`) -- 팀명 중복금지
);
