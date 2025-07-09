-- user 테이블 (사용자)
CREATE TABLE `user` (
  `user_id` INT NOT NULL COMMENT '사용자 ID',
  `name` VARCHAR(20) NOT NULL COMMENT '사용자명',
  `password` VARCHAR(30) NOT NULL COMMENT '비밀번호',
  `email` VARCHAR(30) COMMENT '이메일',
  `permission_id` INT NOT NULL COMMENT '권한 ID',
  `team_id` INT NOT NULL COMMENT '팀 ID',
  `resident_number` CHAR(14) NOT NULL COMMENT '주민 번호',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY (`email`), -- 이메일 중복금지
  UNIQUE KEY `unique_resident_number` (`resident_number`), -- 주민번호 중복금지
  CONSTRAINT `FK_user_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `FK_user_team`       FOREIGN KEY (`team_id`)       REFERENCES `team` (`team_id`)
);
